#!/bin/ruby

class Node
	def initialize data
		@data=data
		@left=nil
		@right=nil
	end
end

class Tree
	def initialize
		@root=nil
	end
	
	def add_node data
		#@root=Node.new(data) unless @root
		if @root == nil
			@root=Node.new(data)
			return
		end
		
		temp=@root
		while true 
			if temp.data > data
				if temp.left
					temp=temp.left
				else
					temp.left=Node.new(data)
					break
				end
			else
				if temp.right
					temp=temp.right
				else
					temp.right=Node.new(data)
				end
			end
		end
	end
	
	def inorder rt
		if rt
			inorder temp.left
			puts temp.data
			inorder temp.right
		else
			return
		end
	end
	
	def view
		inorder @root
	end
end


T=Tree.new
while true
	puts "Input new item"
	gets
end
