class Ant {

  float currentCurvePoint;
  float x, y;
  float t;
  float lerpx, lerpy;
  int tryx;
  int tryy;
  float targetx;
  float targety;

  Ant(float x_, float y_) {
    x=x_;
    y=y_;
    lerpx=x;
    lerpy=y;
    targetx=x;
    targety=y;
  }

  void display() {

    strokeWeight(4);
    colorMode(HSB, 360, 255, 255, 100);
    stroke(248, 255, 255, 30);
    point(x, y);
  }

  void search() {

    tryx = int(random(lerpx-150, lerpx+150));
    tryy = int(random(lerpy-150, lerpy+150));

    if (frameCount%30==0) {
      if (brightness(get(tryx, tryy))>0) {
        targetx = tryx;
        targety = tryy;
      } else {
        targetx = random(targetx-10, targetx+10);
        targety = random(targety-10, targety+10);
      }
    }

    //    boolean searching=false;

    //    if (frameCount%20==0) {
    //      searching=true;
    //      //}

    //      //while (searching) {

    //      tryx = int(random(lerpx-150, lerpx+150));
    //      tryy = int(random(lerpy-150, lerpy+150));

    //      if (brightness(get(tryx, tryy))>0) {
    //        targetx = tryx;
    //        targety = tryy;
    //        searching=false;
    //      } else {         
    //        targetx = random(targetx-10, targetx+10);
    //        targety = random(targety-10, targety+10);
    //      }
    //    }
  }

  void update() {

    PVector target = new PVector(targetx, targety);
    PVector current = new PVector(lerpx, lerpy);

    PVector direct = PVector.sub(target, current);
    direct.mult(0.02);
    direct.limit(0.5);

    current.add(direct);

    lerpx=current.x;
    lerpy=current.y;

    //lerpx = lerp(lerpx, targetx, 0.01);
    //lerpy = lerp(lerpy, targety, 0.01);

    strokeWeight(4);
    colorMode(HSB, 360, 255, 255, 100);
    stroke(248, 255, 255, 30);
    point(lerpx, lerpy);
  }
}
