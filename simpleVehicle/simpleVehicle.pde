Mover mover;

void setup() {
  size(600, 360);
  mover = new Mover();
}

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
  if(keyPressed) {
    if(keyCode == 38) {
      mover.accelerate();
    } else if(keyCode == 40) {
      mover.brake();
    }
  }
}

void keyPressed() {
  if(keyCode == 38) {
    mover.accelerate();
  } else if(keyCode == 40) {
    mover.brake();
  }
  
}
