class Pendulum {
  float len;
  PVector origin;
  PVector bob;
  float angle;
  float aV = 0.0;
  float aAcc = 0.0;
  
  Pendulum(PVector origin, PVector bob, float len, float angle) {
    this.len = len;
    this.bob = bob;
    this.origin = origin;
    this.angle = angle;
  }
  
  void update() {
    aAcc = -0.8/len * sin(angle);
    aV += aAcc;
    angle += aV;
    aV *= 0.99;
    bob.x = origin.x + len*sin(angle);
    bob.y = origin.y + len*cos(angle);
  }
  
  void display() {
    fill(255);
    stroke(255);
    line(origin.x, origin.y, bob.x, bob.y);
    ellipse(bob.x, bob.y, 20, 20);
  }
  
}
