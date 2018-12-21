class Spring extends VerletSpring2D {
  
  Spring(Particle a, Particle b, float len) {
    super(a, b, len, 1);
  }
  
  void display() {
    stroke(255);
    line(a.x, a.y, b.x, b.y);
  }

}
