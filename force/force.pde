//Mover[] movers = new Mover[20];
Mover mover;

void setup() {
  size(600, 360);
  mover = new Mover();
  //for(int i=0; i<movers.length; i++) {
  //  movers[i] = new Mover();
  //}
}

void draw() {
  background(255);
  //for(Mover mover: movers) {
    mover.update();
    mover.checkEdges();
    mover.display();
  //}
}
