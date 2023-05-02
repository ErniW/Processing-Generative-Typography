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
  strokeWeight(4);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(dotsDensity);
  
  RPoint[] points = shape.getPoints();

  
  pushMatrix();
  translate(width/2, height/2);

  float mx = mouseX - width/2;
  float my = mouseY - height/2;

  for(int i=0; i<points.length; i++){
    
    float d = dist(mx, my, points[i].x, points[i].y);
    float r = 0;
    
    if(d < 200){
      r = map(d, 0,200,30,0);
    }
    
    ellipse(points[i].x, points[i].y,10+r,10+r);
  }
  
  popMatrix();
}
