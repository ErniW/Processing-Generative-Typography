import geomerative.*;

RShape shape;

void setup(){
  size(1200,800);
  background(255);
  strokeWeight(1);
  
  RG.init(this);
  shape = RG.getText("GENERATIVE", "FreeSans.ttf", 160, CENTER);
}

void draw(){
  
  RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(map(mouseX,0,width,0,1));

  for(int letter = 0; letter<shape.children.length; letter++){
    
    RPoint[] points = shape.children[letter].getPoints();
    
    for(int i=0; i<points.length; i++){
      
      points[i].x = points[i].x + width/2;
      points[i].y = points[i].y + height/2;
  
      int select = round(random(points.length-1));
      float d = dist(points[i].x, points[i].y,points[select].x, points[select].y );

      if(d<30 ){
        color c = color(map(d,0,30,0,255));
        stroke(c);
        line(points[i].x, points[i].y,points[select].x, points[select].y);
      }
    }
  }
  
}
