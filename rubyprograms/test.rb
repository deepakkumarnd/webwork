#!/bin/ruby

class Test
	def initialize
		@a=1
	end
	def a
		return @a
	end
end

ob=Test.new
puts ob.a
