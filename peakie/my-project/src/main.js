import p5 from 'p5'

// new p5(($)=>{
//   var x = 80,
//     y = 80;
//   $.setup = function() {
//     $.createCanvas(300, 200);
//   };
//   $.draw = function() {
//     $.background(128);
//     $.fill(255);
//     $.rect(x,y,50,50);
//   };
// });


new p5(($)=>{
  var counter = 0;
  var k = 10.0;

  $.setup = () => {
    // $.createCanvas(300, 300, $.WEBGL);
    $.createCanvas(300, 300);
  };
  $.draw = () => {

    $.background(24, 188);

    $.stroke(0, 50);
    $.line(0,0,$.mouseX,$.mouseY);
    $.ellipse($.mouseX, $.mouseY, 10, 10);

    $.push();
    $.shearX(0.05* $.sin(k*counter*0.1));
    $.shearX(0.05* $.sin(k*counter*0.03));
    $.shearY(0.05* $.cos(k*counter*0.1));
    $.scale(1+ 0.5* $.sin(k*counter*0.005));
    // $.rotateX(counter*0.01); // WEBGL
    // $.rotateY(counter*0.001); // WEBGL
    //$.translate(counter*0.1, 0, 0);
    $.stroke(0, 228, 48, 255);
    $.noFill();
    $.ellipse($.mouseX, $.mouseY, 80, 80);
    $.pop();
    counter++;
  }

  // NOTE: 座標は取れている
  // このなかで draw な 命令が効いていないような気がする
  $.mouseMoved = () => {
    console.log('mousemoved ', + $.mouseX +  ':' + $.mouseY );
    // $.stroke(255);
    // $.fill(255);
    $.ellipse($.mouseX, $.mouseY, 10, 10);
    //$.ellipse($.mouseX, $.mouseY, 10, 10);
    // prevent default
    return false;
  }
});
