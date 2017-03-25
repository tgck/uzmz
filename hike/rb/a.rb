#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby

# ruby の場合、改行の補完を避け print を用いる

for i in 1..100 
	print( i, "/100\r")
	STDOUT.flush
	sleep(0.1)
end