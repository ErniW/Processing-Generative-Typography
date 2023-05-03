import geomerative.*;

RShape shape;

PGraphics overlay;

void setup(){
  size(600,800);
  noFill();
  background(30);
  
  overlay = createGraphics(width,height);
  
  RG.init(this);
  shape = RG.getText("s", "FreeSans.ttf", 600, CENTER);
  
  overlay.beginDraw();
  shape.translate(width/2,height/2 + 100);
  shape.draw(overlay);
  overlay.endDraw();
  smooth();
}

float t = 0;

void draw(){ 

  //image(overlay,0,0);
  
  RPoint center = shape.getCenter();
  float shapeWidth = shape.getWidth();
  float shapeHeight = shape.getHeight();
  float shapeX = center.x - shapeWidth/2;
  float shapeY = center.y - shapeHeight/2;
  float density = 5;
  
  int gridColMax = round(shapeWidth / density);
  int gridRowMax = round(shapeHeight / density);
  
  for(int col=0; col<=gridColMax; col++){
    for(int row=0; row<=gridRowMax; row++){

      float x = (col * density) + shapeX;
      float y = (row * density) + shapeY;
       
      color c = overlay.get(int(x),int(y));
      
      if(c != color(255)) continue;
      
      float a = col * 0.1;
      float b = (t - row) / 10;
      float h = noise(a,b) * 100;
       
      strokeWeight(map(h,0,100,6,0));
      stroke(map(h,0,100,255,30));
      point(x, y + h);     
      
    }
  }
  
  t = t + 0.1;

  fill(30,30,30,80);
  noStroke();
  rect(0,0,width,height);
}
