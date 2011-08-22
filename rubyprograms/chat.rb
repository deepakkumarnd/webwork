require 'socket'
streamSock = TCPSocket::new( "", 26666 )
while true
	streamSock.puts( gets )
	str = streamSock.gets( 100 )
	puts str
end
streamSock.close

