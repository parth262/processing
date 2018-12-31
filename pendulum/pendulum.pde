//PVector origin;
//PVector bob;
//float len;
//float angle= PI/4 ;
//float aV = 0.0;
//float aAcc = 0.0;
Pendulum[] ps = new Pendulum[10];
Pendulum p1;

void setup() {
  size(700, 400);
  //len = 200;
  //origin = new PVector(width/2, 0);
  //bob = new PVector(width/2, len);
  for(int i=0;i<ps.length;i++) {
    ps[i] = new Pendulum(new PVector(width/2, 0), new PVector(width/2, 200), random(100, 200), random(-PI/2, PI/2));
  }
}

void draw() {
  background(0);
  
  for(Pendulum p: ps) {
    p.update();
    p.display();
  }
}
