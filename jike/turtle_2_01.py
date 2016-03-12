# -*- coding: utf-8 -*-

from turtle import Turtle

# import processing 一度に二つのライブラリは読み込めない

bTrace = False

# クラスを使う
class MyTurtle(Turtle):
	def __init__(self):
		Turtle.__init__(self)
	def setup():
		t = Turtle()
		t.reset
		t.shape("circle")
		t.delay(100)
	def draw(self, size, steps):
		for i in range(steps):
			t.fd(size)
			t.lt(deg)
			t.dummy=t.stamp()

# 初期化処理 ##################
if (bTrace): t.tracer(0)

# params for movement
steps = 72
deg = 360 / steps     # 小刻みなステップ
fd = 20             # 円弧の大きさに効く

# 描画処理 ##################

#t.pu(); t.goto(0,-150); t.fillcolor("gray")
t = MyTurtle()
t.setup
t.draw(fd, deg)

# 終了処理 ##################

if (bTrace): t.tracer(1)
print ("end")
# カメラの操作は?
# 
