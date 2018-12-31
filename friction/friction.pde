Mover[] movers = new Mover[10];
Liquid liquid;

void setup() {
  size(600, 360);
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  for(int i=0; i<movers.length; i++) {
    movers[i] = new Mover(random(0.1, 5), random(width), 0);
  }
}

void draw() {
  background(255);
  float c = 0.01;
  float normal = 1;
  float frictionMag = c*normal;
  
  liquid.display();
  
  for(Mover mover: movers) {
    if(mover.isInside(liquid)) {
      mover.drag(liquid);
    }
    //PVector friction = mover.velocity.copy();
    //friction.normalize();
    //friction.mult(-1);
    //friction.mult(frictionMag);
    //PVector wind = new PVector(0.01, 0);
    float m = mover.mass;
    PVector gravity = new PVector(0, 0.1*m);
    //mover.applyForce(friction);
    //mover.applyForce(wind);
    mover.applyForce(gravity);
    mover.update();
    mover.checkEdges();
    mover.display();
  }
}
