class Food {

  float x, y;
  float playerX, playerY;
  boolean spawned;

  Food(float x_, float y_) {

    //x_ = x;
    //y_ = y;
    //playerX_ = playerX;
    //playerY_ = playerY;

    x=x_;
    y=y_;
    playerX=width/2;
    playerY=height/2;
    spawned=false;
  }

  void spawn() {
    spawned=true;
  }

  void update(float playerX_, float playerY_) {
    playerX=playerX_;
    playerY=playerY_;
    if (spawned) {
      float alpha = map(dist(playerX, playerY, x, y), 100, 200, 100, 0);
      noStroke();
      colorMode(RGB, 255, 255, 255, 100);
      fill(216, 99, 20, alpha);
      ellipse(x, y, 80, 80);
    }
  }
}
