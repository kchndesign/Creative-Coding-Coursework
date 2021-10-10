import processing.pdf.*;

boolean record;
float interval = 2;
int rowOffset = 5;
float boxHeight = 82.5;
float boxWidth = 82.5;
float max = boxHeight*boxWidth;
float xOffset = 50;
float yOffset = 100;

void setup() {
  size(420, 595);
  smooth();
  noStroke();
  frameRate(1);
}

void draw() {
  
  if (record) {
    beginRecord(PDF, "frame-####.pdf");
    println("recordstart");
  }
  
  background(255);
  for (int a=0; a<6; a++) {
    float posY = 30+(82.5+10)*a;
    for (int b=0; b<4; b++) {
      float posX = 30+(82.5+10)*b;
      pattern(posX, posY);
    }
  }
  if (record) {
    endRecord();
    record=false;
    println("endrecord");
  }
}

void mouseClicked() {
  record = true;
}

void pattern(float x, float y) {
  interval = random(50, 100);
  for (float i=1; i<max; i=i+interval) {
    int rowNo = int(i/boxHeight);
    //println(i);
    //println(rowNo);
    fill(0);
    ellipse(rowNo*1+x, i-rowNo*boxHeight+y, 6, 6);
  }
}
