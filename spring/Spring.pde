class Spring {
  float restLength;
  float k;
  PVector origin;
  Mover bob;
  
  Spring(float restLength, float k, PVector origin) {
    this.restLength = restLength;
    this.k = k;
    this.origin = origin;
  }
  
  void connect(Mover bob) {
    this.bob = bob;
  }
  
  PVector calculateSpringForce() {
    PVector springForce = PVector.sub(bob.location, origin);
    float currentLength = springForce.mag();
    springForce.normalize();
    int stretch = int(currentLength - restLength);
    springForce.mult(-k*stretch);
    return springForce;
  }
  
  void update() {
    
  }
  
  void display() {
    fill(255);
    stroke(255);
    line(origin.x, origin.y, bob.location.x, bob.location.y);
  }
}
