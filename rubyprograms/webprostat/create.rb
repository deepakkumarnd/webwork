#require"rubygems"
require 'spreadsheet'

def create_file(value)
	Spreadsheet.client_encoding='UTF-8'
	book=Spreadsheet::Workbook.new
	sheet1=book.create_worksheet
	sheet1[0,0]="Project Name"
	sheet1[0,1]="Resource Name"
	sheet1[0,2]="Number of hours"
	row=1
	#value={'Wantsa'=>{'deepak'=>12,'dayanand'=>13},'venga'=>{'deepak'=>13,'dayanand'=>2}}

	value.each do |project|	
		 sheet1[row,0]=project[0].encode("UTF-8")
			row+=1
       		 project[1].each do |programmer| 
			
			sheet1[row,1]=programmer[0].encode("UTF-8")
			sheet1[row,2]=programmer[1]
			row+=1
		end
		
	end
	book.write'b.xls'
end	
#create_file
