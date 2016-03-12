from turtle import *

reset()
shape("triangle")
f = 0.83282
phi = 6.89637
s = 20
c = 1
for i in range(20):
	shapesize(s)
	fillcolor(c, 0.5, 1-c)
	dummy = stamp()
	s *= f
	c *= f
	right(phi)

