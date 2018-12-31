class Connection extends VerletSpring2D {
  Connection(VerletParticle2D p1, VerletParticle2D p2, float len, float strength) {
    super(p1, p2, len, strength);
  }
  
  void display() {
    stroke(0);
    line(a.x, a.y, b.x, b.y);
  }
}
