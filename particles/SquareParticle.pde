class SquareParticle extends Particle {
  
  SquareParticle(PVector location) {
    super(location);
  }
  
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    rectMode(CENTER);
    rect(location.x, location.y, 16, 16);
  }
}
