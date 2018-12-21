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
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    float dist = dir.mag();
    dir.normalize();
    dir.mult(2);
    dir.div(dist);
    acceleration = dir;
    dir.mult(random(0.5));
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }
  
  void accelerate() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
  }
  
  void brake() {
    velocity.sub(acceleration);
    velocity.limit(topSpeed);
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
