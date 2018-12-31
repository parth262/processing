Mover m;
Attractor a;

void setup() {
  size(1200, 800);
  m = new Mover(random(0.5, 2), 250, 200);
  a = new Attractor();
}

void draw() {
  background(255);
  PVector f = a.attract(m);
  m.applyForce(f);
  a.update(mouseX, mouseY);
  a.display();
  m.update();
  m.display();
}
