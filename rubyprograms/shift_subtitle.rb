#!/usr/bin/env ruby 
# usage shift_subtitle --operation {add|sub} --time 02,110 input_file output_file
# --time is in second,millisecond format

require 'optparse'
require 'time'

$options={}

class Subsect
	BLANK="\n"
	
	def initialize input,output
		@src=File.open(input,"r")
		@dest=File.open(output,"w")
		@arb_date="2000-01-01 "
		
		#rescue
		#	puts "cannot open files"
		#	exit
		#ensure 
		#	@src.closefiles
		#end
	end
	
	def readblock	
		@dialog=[]
		@blockid=@src.readline.strip
		@timeline=@src.readline.strip
		l=@timeline.split("-->")
		@starttime=l[0].strip
		@endtime=l[1].strip
		l=@starttime.split(",")
		@st_tm=Time.parse(@arb_date+l[0].to_s)
		@st_msec=l[1].to_i
		l=@endtime.split(",")
		@end_tm=Time.parse(@arb_date+l[0].to_s)
		@end_msec=l[1].to_i
		while !@src.eof?
			line=@src.readline.strip
			break if line.empty?
			@dialog<<line
		end
	end
	
	def writeblock
		@dest.puts(@blockid)
		@timeline=@st_tm.inspect.split[1]+","+@st_msec.to_s+" --> "+@end_tm.inspect.split[1]+","+@end_msec.to_s
		@dest.puts(@timeline)
		@dialog.each { |d| @dest.puts(d)}
		@dest.puts(BLANK)
	end
	
	def adjusttiming 
		t=$options[:time]
		
		if $options[:operation]==:add
			@st_msec+=((t[1].to_i)+(t[0].to_i)*1000)
			@st_tm+=(@st_msec/1000);
			@st_msec%=1000;
			
			@end_msec+=((t[1].to_i)+(t[0].to_i)*1000)
			@end_tm+=(@end_msec/1000);
			@end_msec%=1000;
		elsif $options[:operation]=="sub"
			@st_tm-=t[0].to_i
			if @st_msec> t[1].to_i
				@st_msec-=t[1].to_i
			else
				@st_tm-=1
				@st_msec-=t[1].to_i+1000
			end
		else
			puts("Invalid options")
		end
	end
	
	def closefiles
		@src.close
		@dest.close
	end
	
	def isover
		@src.eof
	end
		
end




optparse=OptionParser.new do |opts|
	opts.banner= "Usage: shift_subtitle --operation {add|sub} --time 02,110 input_file output_file "
	$options[:operation]=:add
	opts.on('-o','--operation OPT',[:add,:sub],"OPT can be add or sub") do |o|
		$options[:operation]=o
	end
	
	$options[:time]=[0,0]
	opts.on('-t ','--time sec,millisec',Array,"Time in second,millisecond format") do |l|
		$options[:time]=l
	end
	
	opts.on('-h','--help','Help') do
		puts opts
		exit
	end
end

optparse.parse!

unless ARGV.length == 2
	puts "Type shift_subtitle -h for help"
	exit 11 
end

input_file=ARGV[0]
output_file=ARGV[1]

sub=Subsect.new(input_file,output_file)

while true
	sub.readblock
	sub.adjusttiming
	sub.writeblock
	break if sub.isover
end

sub.closefiles



