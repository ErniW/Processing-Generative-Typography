import geomerative.*;

RShape shape;

PGraphics overlay;

void setup(){
  size(800,800);
  background(255);
  
  overlay = createGraphics(width,height);
  
  RG.init(this);
  shape = RG.getText("A", "FreeSans.ttf", 600, CENTER);
  
  overlay.beginDraw();
  overlay.translate(width/2, height/2+200);
  overlay.fill(0);
  shape.draw(overlay);
  overlay.endDraw();
}

float tx = 100;
float ty = 0;

void draw(){
  background(255);
  
  tx = tx+0.01;
  ty = ty+0.01;
  
  float mx = noise(tx) * width;
  float my = noise(ty) * height;
  
  point(mx,my);

  //image(overlay,0,0);
  
  for(int x=0; x<=width; x = x+10){
    for(int y=0; y<=height; y = y+10){
 
      color c = overlay.get(int(x),int(y));
      
      if(c != color(0)) continue;

      float d = dist(x,y,mx,my);
      
      if(d <100){
        strokeWeight(map(d,0,100,20,6));
      }
      else{
        strokeWeight(6);
      }
           
      point(x, y);
    }
  }

}
