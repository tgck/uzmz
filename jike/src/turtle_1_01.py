#!/usr/bin/python

# Adventures in Raspberry Pi, 2nd Edition 
# Figure 4-15
# https://www.safaribooksonline.com/library/view/adventures-in-raspberry/9781119046059/xhtml/05_9781119046028-ch04.xhtml

import turtle

a = turtle.Turtle()
a.color("brown")
a.shape("turtle")
print (range(5,100,2))

a.penup()

for size in range(5,100,2):
  a.stamp()
  a.forward(size)
  a.left(25)

