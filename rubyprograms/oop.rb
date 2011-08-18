#!/usr/bin/env ruby

class Point
	
	attr_reader :x,:y
	@@count = 0
	ORIGIN = Point.new(0.0)
	UNIT_X = Point.new(1,0)
	UNIT_Y = Point.new(0,1)
		
	def initialize x,y
		@x,@y=x,y
		@@count+=1
	end
	
	def +(other)
		Point.new(@x+other.x,@y+other.y)
	end
	
	def -@
		Point.new(-@x,-@y)
	end
	
	def *(scalar)
		Point.new(@x*scalar,@y*scalar)
	end
	
	def to_s
		"(#@x,#@y)"
	end
	
	def self.sum(*points)
		x=y=0
		points.each{|p| x+=p.x;y+=p.y }
		Point.new(x,y)
	end
	
	def self.count
		@@count
	end
	
	
end

class Point3D < Point
	
	def initialize x,y,z
		super x,y
		@z=z
	end
	
	def to_s
		return "(#@x,#@y,#@z)"
	end
	
end

p1=Point.new(2,3)
puts p1
p2=Point.new(4,5)
puts p2
puts p1+p2
puts -p1
puts p1*2
puts p1.x+p1.y
puts "The class method sum"
puts Point.sum(p1,p2,p1,p2)
puts "Total number of points #{Point.count}"
