import geomerative.*;
import controlP5.*;

ControlP5 cp5;

RShape shape;
RPoint[] points;

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
  strokeWeight(2);

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(dotsDensity);
  
  points = shape.getPoints();
  
  float r = map(mouseX,0,width,0,50);
  
  pushMatrix();
  translate(width/2, height/2);

  for(int i=0; i<points.length; i++){
    float step = map(points[i].x, 0, width, 0,1);
    color c = lerpColor(#0DD9FF, #F20DFF, step);
    fill(c); 
    ellipse(points[i].x, points[i].y, r, r);
  }
  
  popMatrix();
}
