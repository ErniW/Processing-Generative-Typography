import geomerative.*;

RShape shape;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  
  shape = RG.getText("Typography", "FreeSans.ttf", 160, CENTER);
}


void draw(){
  background(255);
  translate(width/2, height/2);

  shape.draw();
}
