import geomerative.*;
import controlP5.*;

ControlP5 cp5;

RShape shape;

int dotsDensity = 10;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("GENERATIVE", "FreeSans.ttf", 160, CENTER);

  cp5 = new ControlP5(this);
  cp5.addSlider("dotsDensity");
  cp5.getController("dotsDensity").setColorLabel(color(0));
}

void draw(){

  background(255);

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(dotsDensity);
  
  RPoint[] points = shape.getPoints();
  
  float d = map(mouseX, 0, width, 0, 50);
  float r = map(mouseY, 0, height, 0.5, 20);
  
  strokeWeight(r);
  pushMatrix();
  translate(width/2, height/2);

  for(int i=0; i<points.length; i++){   
    line(points[i].x, points[i].y, points[i].x + d,points[i].y + d);
    point(points[i].x, points[i].y);
  }

  shape.draw();
  popMatrix();
}
