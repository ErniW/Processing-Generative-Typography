import fontastic.*;
import geomerative.*;

//Uppercase letters
//char[] alphabet = Fontastic.alphabet;

//Lowercase letters
//char[] alphabet = Fontastic.alphabetLc;

//Combine both for full alphabet, you can add your own chars to the string.
String alphabetString = new String(Fontastic.alphabet) + new String(Fontastic.alphabetLc);
char[] alphabet = alphabetString.toCharArray();

//Manually select chars
//char[] alphabet = {'1', '2', '#', 'A', 'a', 'G', 'g'};

int fontSize = 100;

RFont oldfont;
RPolygon[] letter = new RPolygon[alphabet.length];

void setup() {
  size(1200, 800);

  RG.init(this);
  oldfont = new RFont("FreeSans.ttf", fontSize);

  //RG.setPolygonizer(RG.ADAPTATIVE);
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(6);
  
  noStroke();
  fill(0);
}

void draw() {
  background(255);
  translate(100, 50);
  
  int counter = 0;
  int row = 0;
  
  for(int i=0; i<letter.length; i++){
    letter[i] = oldfont.toPolygon(alphabet[i]);
  }
  
  //Letter -> Contour -> Point
  for(int i=0; i<letter.length; i++){
    RContour[] contours = letter[i].contours;
    
    //we dont start here from zero, zero is always outer contour.
    
    for(int k=1; k<contours.length; k++){
      RPoint[] points = contours[k].getPoints();
      
      for(int p=0; p<points.length; p++){

        //play around with the proportions
        
        if(points[p].x > 25){
          points[p].x = points[p].x + mouseX;
        }
        else if(points[p].x < 25){
          points[p].x = points[p].x - mouseX;
        } 
        
      }
    }
    
    if(counter % 8 == 0){
      row++;
      counter = 0;
    }
    counter++;
    
    pushMatrix();
    
    translate((120*counter) - letter[i].getWidth()/2, fontSize*row);
    RShape letterDraw = letter[i].toShape();
    letterDraw.draw();
    
    popMatrix();
  }
}

void keyPressed() {

  //Create an empty font
  Fontastic f = new Fontastic(this, "My custom font");
  
  float scaleFactor = 1.024 * 6;
  
  //Add letters to font
  for(int i=0; i<letter.length; i++){
    
    char c = alphabet[i];

    //Create a new letter
    f.addGlyph(c);
    
    RContour[] contours = letter[i].contours;
    
    for (int k = 0; k<contours.length; k++){
      
      RPoint[] points = contours[k].getPoints();
      FPoint[] p = new FPoint[points.length];
      
      //Convert RPoint to FPoint
      for (int j=0; j<points.length; j++) {
        p[j] = new FPoint((points[j].x * scaleFactor), points[j].y * (-scaleFactor));
      }

      //Add contour to the letter
      f.getGlyph(c).addContour(p);
    }
    
    float letterWidth = letter[i].getWidth();
    float advanceWidth = ((letterWidth + (letterWidth * 0.2)) * scaleFactor) + 30;

    f.getGlyph(c).setAdvanceWidth(int(advanceWidth));
  }
  
  //Create the font files
  f.buildFont();
  f.cleanup(); 
  
  //Close the window
  //exit();
}
