class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  
  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topSpeed = 10;
    acceleration = new PVector(-0.001,0.01);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
