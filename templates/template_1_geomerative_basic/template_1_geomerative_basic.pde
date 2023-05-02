import geomerative.*;

RShape shape;

RPoint firstLetterCenter;

void setup(){
  size(1200,800);
  background(255);
  
  RG.init(this);
  
  shape = RG.getText("Typography", "FreeSans.ttf", 160, CENTER);
  
  firstLetterCenter = shape.children[0].getCenter();
}


void draw(){
  background(255);
  translate(width/2, height/2);

  //change parameters of whole shape
  shape.setFill(0);
  shape.setStroke(false);
  
  //change parameters of a single letter
  shape.children[0].setFill(#BC1717);
  
  //To rotate an element we have to get its center before
  //any transforations. Check what happens if we don't do that:
  //firstLetterCenter = shape.children[0].getCenter();

  shape.children[0].rotate(PI/40, firstLetterCenter);
  
  shape.draw();
}
