// instance mode
// https://github.com/processing/p5.js/wiki/Global-and-instance-mode
//
var s = function($) {

  var x = 100;
  var y = 100;

  $.setup = function() {
    $.createCanvas(200, 200);
  };

  $.draw = function() {
    $.background(0);
    $.fill(255);
    $.rect(x,y,50,50);
  };
};

var myp5 = new p5(s);

//
// Not tested
//
function setup() {
  fn.ex2.s();
}
function draw() {
	fn.ex3.d();
}

// lib
var fn = {
	// example1 //
  ex1:{
  	s:()=>{ createCanvas(640, 360)},
    d:()=>{ background(102);ellipse(50, 50, 80, 80)}
  },
  // example2 //
  ex2:{
  	s:()=>{ createCanvas(640, 360);stroke(255);noFill()},
    d:()=>{	background(0);
  					for (var i = 0; i < 200; i += 20) {
							bezier(mouseX-(i/2.0), 40+i, 410, 20, 440, 300, 240-(i/16.0), 300+(i/8.0));
 						}}
  },
  ex3:{
  	d:()=>{
    	background(0);
			//for(var i=0; i<640; i+=20){rect(i, i, 10, 10)}
      [...Array(100).keys()].forEach(
      	(v)=>{
          stroke(188,188,188); noFill();
					rect(v*20,0,20,20);
          stroke(0,128,0);
          rect(v*20+2,2,16,16);
          stroke(0,128,128); fill(0,128,128);
          rect(v*20+8,8,4,4);
				}
      )
    }
  }
}
