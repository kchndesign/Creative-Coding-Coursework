class Player {

  float xLerped, yLerped;
  boolean moving;

  Player() {
  }

  void display() {
    noStroke();
    fill(#FFB003);
    ellipse(height/2, width/2, 15, 15);
    xLerped = width/2;
    yLerped = height/2;
  }

  void interpolatePosition() {
    if (dist(mouseX, mouseY, xLerped, yLerped)>1) {
      moving=true;
      //xLerped = lerp(xLerped, mouseX, 0.1);
      //yLerped = lerp(yLerped, mouseY, 0.1);

      PVector target = new PVector(mouseX, mouseY);
      PVector current = new PVector(xLerped, yLerped);

      PVector direct = PVector.sub(target, current);
      direct.mult(0.02);
      direct.limit(1.8);

      current.add(direct);

      xLerped=current.x;
      yLerped=current.y;
    } else { 
      moving=false;
    }
  }

  void update() {
    noStroke();
    fill(#FFB003);
    ellipse(xLerped, yLerped, 15, 15);
  }
}
