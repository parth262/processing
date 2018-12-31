class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass;
  float G = 0.4;
  
  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    topSpeed = 10;
    acceleration = new PVector(-0.001,0.01);
    mass = m;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }
  
  void display() {
    stroke(0);
    fill(175, 170, 280, 100);
    ellipse(location.x, location.y, mass*16, mass*16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      velocity.x *= -1;
      location.x = 0;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = width;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = 0;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = height;
    }
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
 
}
