class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255;
  
  Particle(PVector location) {
    this.location = location;
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.05);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -=2;
  }
  
  boolean isDead() {
    return lifespan <= 0;
  }
  
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(location.x, location.y, 10, 10);
  }
}
