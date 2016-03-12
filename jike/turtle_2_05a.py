#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from turtle import *

#turtle = Turtle()

def setups():
	print getshapes()
	setup (width=600, height=600, startx=830, starty=32)
	reset()
	ht()

def main():
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

def draw(str, vec, color):
	goto(vec)
	for i in range(8):
		pendown()
		dot(color)
		penup()
		fd(30)
	return

if __name__ == '__main__':
	setups()
	main()
	draw("dummy",Vec2D(0, 40), "red")
	draw("dummy",Vec2D(0, 80), "green")
	draw("dummy",Vec2D(0, 40), "blue")
	draw("dummy",Vec2D(0, 40), "red")
	mainloop()



