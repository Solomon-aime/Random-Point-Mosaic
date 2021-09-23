//---------------Initialization-------------------

int centx = width/2;
int centy = height/2;
float xstart = centx +540;
float ystart = centy +370;
float rotrand = 0;  
float lastx = centx+540;
float lasty = centy+370;
float p = 100;

void setup() {
  size(1080, 720);
  background(0);
  smooth();
  strokeWeight(4);
  frameRate(60);
}

void draw() {
  rotrand += int(random(0, 2));
  
  for(int i =0; i <= rotrand; i++) {
   
    float choosex = pow(2, 1)*2;
    float choosey = pow(2, 1)*2;
       
    if (xstart <= width && xstart >= 0) {xstart +=choosex;}
    else {xstart =0;}
    
    if (ystart <= height && ystart >= 0) {ystart +=choosey;}
    else {ystart =0;}
    
    if (rotrand <1000) {
      p++;
      if(p <= 255) {
        //p=noise(cos(random(TWO_PI))*sin(random(TWO_PI)))*100;
        stroke(random(255), random(255), random(255), random(p));
        point(xstart, ystart);  
        stroke(random(255), random(255), random(255), random(p));
        point(lastx, lasty);
      } else if (p >255) {
        //p=noise(cos(random(TWO_PI))*sin(random(TWO_PI)))*5;
        p = noise(100)*2;
        //p=0;
      } else if(p <0) {
        p= 1;
      }
    } else {
      rotrand =1;
    }
    
    lastx = xstart;
    lasty = ystart;
  }
}

//-------------------captures-screen-when-LMB-pressed------------------------
 void mousePressed() {
  saveFrame("saveFrame####.png");
}
