// https://forum.processing.org/one/topic/set-3-viewports-from-3-camera-s-pointing-the-same-object.html

import processing.opengl.*;
import javax.media.opengl.*;
GL gl;

void setup() {
  size(1100, 640, OPENGL);
  noFill();
}

void draw() {
  // Viewport 1
  gl = ((PGraphicsOpenGL)g).beginGL();
  gl.glViewport (20, 20, 340, 600);  
  ((PGraphicsOpenGL)g).endGL();
  perspective(PI/6f, PI/5.6f, 1, 10000);
  camera(0, 0, 2000, 0, 0, 0, 0, 1, 0);
  box(600);
  ((PGraphicsOpenGL)g).endGL();

  // Viewport 2
  gl = ((PGraphicsOpenGL)g).beginGL();
  gl.glViewport(380, 20, 340, 600);  
  ((PGraphicsOpenGL)g).endGL();
  perspective(PI/6f, PI/5.6f, 5000, 15000);
  camera(0, 0, 10000, 0, 0, 0, 0, 1, 0);
  box(600);
  ((PGraphicsOpenGL)g).endGL();

  // Viewport 3
  gl = ((PGraphicsOpenGL)g).beginGL();
  gl.glViewport (740, 20, 340, 600);  
  ((PGraphicsOpenGL)g).endGL();
  perspective(PI/6f, PI/5.6f, 1, 10000);
  camera(0, 0, 3600, 0, 0, 0, 0, 1, 0);
  box(600);
  ((PGraphicsOpenGL)g).endGL();
}