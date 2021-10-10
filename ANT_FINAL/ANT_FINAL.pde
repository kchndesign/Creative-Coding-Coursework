//click to start everything
//move around to look for your food


public ArrayList<PVector> path;
Player player = new Player();
int numAnts = 1000;
Ant[] antss = new Ant[numAnts];
boolean start = false;
Food food;

void setup() {

  size(1000, 1000);
  smooth();

  food = new Food(random(width), random(height));
  println(food.x);
  println(food.y);

  player.display();

  path = new ArrayList<PVector>();

  for (int i=0; i<numAnts; i++) {
    antss[i] = new Ant(random(width/2-50, width/2+50), random(height/2-50, height/2+50));
  }
}

void draw () {

  background(0);
  noStroke();
  fill(#008908);
  //anthill
  ellipse(height/2, width/2, 80, 80);
  //food update
  food.update(player.xLerped, player.yLerped);


  //when the player is moving add points to the path
  if ((player.moving==true) && (frameCount % 5 == 0) && start) {
    path.add(new PVector(player.xLerped, player.yLerped));
  }


  drawPath();

  player.interpolatePosition();
  player.update();

  for (Ant a : antss) {
    a.search();
    a.update();
  }
}

void drawPath() {
  for (int i=1; i<path.size()-1; i++) {
    PVector pointy = path.get(i);
    strokeWeight(20);
    colorMode(RGB, 255, 255, 255, 100);
    stroke(222, 222, 25, 5);
    point(pointy.x, pointy.y);
  }
}

void mousePressed() {
  start = true;
  food.spawn();
}
