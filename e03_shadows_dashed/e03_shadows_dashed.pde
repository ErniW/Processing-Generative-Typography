import geomerative.*;
import controlP5.*;

ControlP5 cp5;

RShape shape;

int sliderValue = 10;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("GENERATIVE", "FreeSans.ttf", 160, CENTER);

  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue");
}

void draw(){

  background(255);
  strokeWeight(4);
  
  //nie możemy używać translate z sliderem :(
  //translate(width/2, height/2);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(sliderValue);
  
  RPoint[] points = shape.getPoints();

  for(int i=0; i<points.length; i++){

    points[i].x = points[i].x + width/2;
    points[i].y = points[i].y + height/2;
    
    float d = dist(mouseX,mouseY,points[i].x, points[i].y);
    float r = 0;
    
    if(d < 200){
      r = map(d, 0,200,30,0);
    }
    
    ellipse(points[i].x, points[i].y,10+r,10+r);
  }
}
