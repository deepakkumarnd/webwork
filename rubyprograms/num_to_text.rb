#!/usr/bin/env ruby

ones=["","one","two","three","four","five","six","seven","eight","nine"]
tens=["","ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety","hundred"]
teens=["","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]

msg= "Input the number(0-9999 only)"
puts msg
$s=nil
$n=nil
begin
	$s=gets
	$n=$s.to_i
	$s=$n.to_s
rescue
	puts "Input only numbers:"
	exit
end

len=$s.length
flag=0
 if len >4 
	puts msg
	exit
 end
 
 if len==4
	print ones[$s[0].to_i]+" thousand "
	$s[0]=""
	$n=$s.to_i
	$s=$n.to_s
	len=$s.length
	flag=1
 end


 case len
	when 1
		if $n==0
			puts "zero" if flag==0
		else
			puts ones[$s[0].to_i] 
		end
	when 2
		if $n<20 && $n>10
			puts teens[$s[1].to_i]
		elsif $n==10
			puts "ten"
		else
			puts (tens[$s[0].to_i]+ones[$s[1].to_i])
		end
	when 3
		if $n%100==0
			puts ones[$s[0].to_i]+" hundred" 
		elsif $n%10==0
			puts (ones[$s[0].to_i]+" hundred and "+tens[$s[1].to_i])
		elsif $s[1].to_i ==0 
			puts (ones[$s[0].to_i]+" hundred and "+ones[$s[2].to_i])
		elsif $s[1].to_i ==1
			puts (ones[$s[0].to_i]+" hundred and "+teens[$s[2].to_i])
		else
			puts (ones[$s[0].to_i]+" hundred and "+tens[$s[1].to_i]+ones[$s[2].to_i])
		end
	when 4
		puts "not implemented"
	else	
end
 
 


