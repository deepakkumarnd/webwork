#!/usr/bin/env ruby

require'rubygems'
require'roo'


class Parsesheet
	STARTCOLUMN=7
	STARTROW=5
	def initialize filename
		@week_count=0
		@output=[]
		begin
			@sheet=Openoffice.new(filename)
			@sheet.default_sheet=@sheet.sheets.first
		rescue
			puts "Cannot open the spreadsheet file #{filename}"
		end
	end
	
	def check_no_weeks
		x=STARTCOLUMN+1
		while @sheet.cell(1,x)==nil
			@week_count+=1
			x+=1
		end
		@week_count
	end
	
	def find_column_indexes
		@colindexes=[]
		x=STARTCOLUMN
		@colindexes<<x
		while x < @sheet.last_column
			x+=@week_count+1
			@colindexes.push(x)
		end
		@colindexes.pop
		return @colindexes
	end
	
	def find_row_indexes
		@rowindexes=[]
		c=0
		x=STARTROW
		while c!=2
			unless pro=@sheet.cell(x,1)
				c+=1
				x+=1
				next
			end
			if !((pro.downcase == "totals" )|| (pro.downcase.include? "internal"))
				@rowindexes.push(x)
			end
			x+=1
		end
		@rowindexes
	end
	
	def calculate_gross_work_time
		record=[]
		hash={}
		@output=[]
		sum=0
		@rowindexes.each do |row|
			record.push(@sheet.cell(row,1))     # pushing the project name
			@colindexes.each do |col|
				(1..@week_count).each { |wk| sum+=@sheet.cell(row,col+wk-1).to_f }
				if sum >0
					hash[@sheet.cell(1,col)]=sum
				end
				sum=0
			end
			record.push(hash)                   #pushing the code worktime details of each person
			hash={}
			@output.push(record)
			record=[]
		end
		@output
	end
	
	def write_to_sheet
	end

end


sh=Parsesheet.new("exp.ods")  # put your file name here
sh.check_no_weeks
sh.find_column_indexes
sh.find_row_indexes
puts sh.calculate_gross_work_time[1] 
