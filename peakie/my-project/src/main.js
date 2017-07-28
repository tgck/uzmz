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
  $.setup = () => {
    $.createCanvas(300, 300);
  };
  $.draw = () => {
    $.background(128, 30);

    $.stroke(0, 50);
    $.line(0,0,$.mouseX,$.mouseY);
    $.ellipse($.mouseX, $.mouseY, 10, 10);

    $.stroke(0, 228, 48);
    $.noFill();
    $.ellipse($.mouseX, $.mouseY, 80, 80);
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
