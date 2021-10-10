PFont font;
String tired = "tired";
char[] letters;

void setup() {
  size(400, 400);
  smooth();
  randomSeed(0);
  
  font = createFont("AkzidenzGrotesk-Bold.otf", 64);
  textFont(font);
  
  letters = tired.toCharArray();
}

void draw() {
  background(255);
  fill(0);
  
  translate(120, 0);
  
  for (int i=0; i<letters.length; i++) {
   noiseSeed(i);
   float letterWidth=textWidth(letters[i]);
   fill(map(mouseY, 0, 400, 250, 235));
   text(letters[i], 0, 200);
   fill(0);
   text(letters[i], map(mouseX, 0, 400, -15, 15), map(mouseY, 275, 0, 350, 240)+(30*noise(mouseX*0.01, mouseY*0.002)));
   println(map(mouseY, 275, 0, 350, 220));
   translate(letterWidth, 0);
   
  }
}
