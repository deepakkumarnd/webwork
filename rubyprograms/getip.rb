#!/usr/bin/env ruby

require 'socket'

unless ARGV.length==1
	puts "Usage: getip <hostname>"
	exit -1
end

begin
	puts IPSocket::getaddress(ARGV[0])
rescue 
	puts "Cannot resolve the name #{ARGV[0]}"
end
