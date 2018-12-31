GOL gol;

void setup() {
  size(600, 400);
  gol = new GOL();
}

void draw() {
  background(255);
  gol.generate();
  gol.display();
}
