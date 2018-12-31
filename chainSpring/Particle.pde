class Particle extends VerletParticle2D {

  float r = 4;
  
  Particle(float x, float y) {
    super(x, y);
  }
  
  void display() {
    fill(100);
    stroke(0);
    strokeWeight(2);
    ellipse(x, y, r*2, r*2);
  }
}
