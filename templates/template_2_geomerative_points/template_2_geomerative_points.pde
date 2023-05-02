import geomerative.*;

RShape shape;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("GENERATIVE", "FreeSans.ttf", 160, CENTER);
}

void draw(){
  background(255);
  strokeWeight(4);
  translate(width/2, height/2);
  
  //RG.setPolygonizer(RG.ADAPTATIVE);
  
  //RG.setPolygonizer(RG.UNIFORMSTEP);
  //RG.setPolygonizerStep(4);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10);

  RPoint[] points = shape.getPoints();
    
  for(RPoint p : points){
    point(p.x, p.y);
  }
}
