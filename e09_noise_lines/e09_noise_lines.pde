import geomerative.*;

RShape shape;

PGraphics overlay;

void setup() {
  size(800, 800, P3D);
  noFill();
  background(255);

  overlay = createGraphics(width, height);

  RG.init(this);
  shape = RG.getText("A", "FreeSans.ttf", 600, CENTER);

  overlay.beginDraw();
  shape.translate(width/2, height/2+200);
  overlay.fill(0);
  shape.draw(overlay);
  overlay.endDraw();

  smooth();
}

float t = 0;

void draw() {
  background(255);
  //image(overlay,0,0);

  RPoint center = shape.getCenter();
  float shapeWidth = shape.getWidth();
  float shapeHeight = shape.getHeight();
  float shapeX = center.x - shapeWidth/2;
  float shapeY = center.y - shapeHeight/2;
  float density = 5;

  int gridColMax = round(shapeWidth / density);
  int gridRowMax = round(shapeHeight / density);

  for (int row=0; row<=gridRowMax; row++) {

    beginShape();
    
    for (int col=0; col<=gridColMax; col++) {
      float x = (col * density) + shapeX;
      float y = (row * density) + shapeY;

      float a = col * 0.1;
      float b = (t - row) / 10;
      float h = noise(a, b) * 40;

      color c = overlay.get(int(x), int(y));
      if (c != color(0)) stroke(255);
      else stroke(0);

      h -= 10;
      strokeWeight(2);
      vertex(x, y-h);
    }
    
    endShape();
  }

  t = t + 0.1;
}
