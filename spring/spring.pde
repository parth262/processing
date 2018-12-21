Mover bob;
PVector origin;
float restLength;
Spring spring;

void setup() {
  size(600, 400);
  restLength = 180;
  origin = new PVector(width/2, 0);
  bob = new Mover(10, origin.x, restLength);
  spring = new Spring(180, 0.04, origin);
  spring.connect(bob);
}

void draw() {
  background(0);
  spring.display();
  bob.drag(mouseX, mouseY);
  bob.update();
  bob.display();
  
  PVector springForce = spring.calculateSpringForce();
  bob.applyForce(springForce);
  PVector gravity = new PVector(0, 0.4);
  bob.applyForce(gravity);
}

void mousePressed() {
  bob.clicked(mouseX, mouseY);
}

void mouseReleased() {
  bob.stopDragging();
}
