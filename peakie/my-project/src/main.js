import p5 from 'p5'

new p5(($)=>{
  var x = 80,
    y = 80;
  $.setup = function() {
    $.createCanvas(300, 200);
  };
  $.draw = function() {
    $.background(128);
    $.fill(255);
    $.rect(x,y,50,50);
  };
});
