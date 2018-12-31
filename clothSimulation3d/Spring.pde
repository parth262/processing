class Spring extends VerletSpring3D {
  
  Spring(Particle a, Particle b, float len) {
    super(a, b, len, 1);
  }
  
  void display() {
    stroke(255);
    line(a.x, a.y, a.z, b.x, b.y, b.z);
  }

}
