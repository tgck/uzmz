#!/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/ruby
#or 
#!/usr/bin/ruby
# サインの波をアニメーションで表現する
# inspired by CoreAudio Programming - chaper 5

SAMPLES = 44100
RAD_PER_SAMPLE = (2 * Math::PI) / SAMPLES
current_rad = 0

# param for anime
STEP = 80

# val : -1.0 .. 1.0
def printAsPicture(frame, val)
	normed_val = (val + 1.0) / 2     # 0.0 ... 1.0
	draw_at = (STEP * normed_val).round

	print("[")
	for i in 1..STEP
		if (i==draw_at)
			print("*")
		else
			print(" ")
		end
	end
	print("]", frame, "/", SAMPLES, "\r")
end

for i in 1..10*SAMPLES 
	out = Math.sin(current_rad)
	current_rad += RAD_PER_SAMPLE
	printAsPicture(i, out)
	STDOUT.flush
#	sleep(0.001)
end