/*
  Current code saves a single frame into pdf file.

  If you want to save a sequence of draw frames into pdf
  you should put beginRecord in the setup and endRecord in keyPressed.
  Be aware that pdf size and loading time can increase significantly.
*/

import geomerative.*;
import processing.pdf.*;

RShape shape;

boolean saveFrame = false;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("GENERATIVE", "FreeSans.ttf", 160, CENTER);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10);
}


void draw(){
  if(saveFrame == true) {
    beginRecord(PDF, "text.pdf"); 
  }
  
  background(255);
  strokeWeight(10);
  translate(width/2, height/2);
  
  RPoint[] points = shape.getPoints();

  for(RPoint p : points){
    point(p.x, p.y);
  }

  if(saveFrame == true) {
    endRecord();
    println("Done saving");
    saveFrame = false; 
  }
}


void keyPressed(){
  saveFrame = true;
}
