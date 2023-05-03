import geomerative.*;

RShape shape;



//Draw an additional masking layer to check if point is in a shape
PGraphics overlay;

void setup(){
  size(800,800);
  background(255);
  
  overlay = createGraphics(width,height);
  
  RG.init(this);
  shape = RG.getText("A", "FreeSans.ttf", 600, CENTER);
  
  overlay.beginDraw();
  overlay.translate(width/2,height/2+200);
  overlay.fill(0);
  shape.draw(overlay);
  overlay.endDraw();
}

void draw(){

  background(255);
  strokeWeight(10);
  
  //image(overlay,0,0);
  
  for(int x=0; x<=width; x = x+10){
    for(int y=0; y<=height; y = y+10){
 
      color check = overlay.get(int(x),int(y));
      
      if(check == color(0)) {
         point(x, y);
      }
      
    }
  }

}
