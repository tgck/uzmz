#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from turtle import *
from colorsys import *

#turtle = Turtle()

def setups():
	print getshapes()
	setup (width=600, height=600, startx=830, starty=32)
	setundobuffer(40)
	reset()
	ht()

def guide():
	st()
	pensize(0.5)
	color("gray")
	penup()
	goto(-300,0)
	print "x:%d y:%d" % (xcor(), ycor())
	pendown()
	fd(600)
	print "x:%d y:%d" % (xcor(), ycor())
	penup()
	setpos(0, -300)
	pendown()
	print "x:%d y:%d" % (xcor(), ycor())
	goto(0, 300)
	print "x:%d y:%d" % (xcor(), ycor())
	goto(0, 0)

	print shapesize()
	shape("square")
	pen(fillcolor = "")	
	for i in range(1,10): # 10掛された値が実際の寸法になるらしい
		shapesize(i)
		stamp()
	shapesize(20)
	color("green")
	pen(fillcolor = "")	
	stamp()
	fd(1)
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
		pendown();
		dot(color);
		penup()
		fd(30)
	for i in range(4*4):
		undo() # undo の単位は code step 
	return


if __name__ == '__main__':
	setups()
	guide()
	#main()
	draw("dummy",Vec2D(0, 0), "black")
	draw("dummy",Vec2D(0, 40), "red")
	draw("dummy",Vec2D(0, 80), "green")
	draw("dummy",Vec2D(0, 40), "blue")
	draw("dummy",Vec2D(0, 40), "red")
	ontimer(bye, 3388)
	mainloop()




