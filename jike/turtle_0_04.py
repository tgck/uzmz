#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from turtle import *


def main():
	reset()
	shape("circle")
	pu(); goto(150,0)
	fillcolor("red")
	shapesize(5,1,4)
	for i in range(72):
		fd(12)
		lt(5)
		tilt(7.5)
		dummy=stamp()

if __name__ == '__main__':
	main()
	mainloop()