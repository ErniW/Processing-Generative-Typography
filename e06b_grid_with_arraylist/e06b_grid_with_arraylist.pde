import geomerative.*;

RShape shape;

ArrayList<RPoint> points = new ArrayList<RPoint>();

void setup(){
  size(800,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("A", "FreeSans.ttf", 600, CENTER);
  
  shape.translate(width/2, height/2+200);

  for(int x=0; x<=width; x = x+10){
    for(int y=0; y<=height; y = y+10){
 
      if(shape.contains(x,y)){
        points.add(new RPoint(x, y));
      }
      
    }
  }
}

void draw(){

  background(255);
  noStroke();
  fill(200);
  shape.draw();
  stroke(0);
  strokeWeight(10);
  
  for(RPoint p : points){
    point(p.x, p.y);
  }

}
