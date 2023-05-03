import geomerative.*;

RShape shape;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  shape = RG.getText("Typography", "FreeSans.ttf", 150, CENTER);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(2);
  
  noStroke();
  fill(0);
}

float time = 0;

void draw(){
  background(255);
  translate(width/2, height/2);
  
  for(int i=0; i<shape.children.length; i++){
    RShape letter = shape.children[i];
    RPoint[][] points = letter.getPointsInPaths();
    
    for(int j=0; j< points.length; j++){

      for(RPoint p : points[j]){
        
        //try playing around with combinations and proportions
        
        p.x += sin(p.y / 2 + time) * 2;
        p.y += sin(p.x / 2 + time) * 2;
      }
      
    }
    
    letter = new RShape(points);
    letter.draw();
  }
  
  time += 0.1;  
}
