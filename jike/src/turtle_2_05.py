#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from turtle import *

#turtle = Turtle()

def main():
	print getshapes()
	setup (width=600, height=600, startx=830, starty=32)
	reset()
	#ht()
	#width(3)
	#color("red")
	#shapesize(5,1)
	pensize(0)
	for i in range(8):
		#shape("circle")
		pendown()
		dot()
		penup()
		#stamp()
		fd(30)
	return "Done!"

if __name__ == '__main__':
	main()
	mainloop()



