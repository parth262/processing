class Chain {
  float totalLength, strength, radius;
  int numPoints;
  
  ArrayList<Particle> particles;
  Particle tail;
  
  PVector offset = new PVector();
  boolean dragged = false;
  
  Chain(float l, int n, float r, float s) {
    
    particles = new ArrayList();
    
    totalLength = l;
    numPoints = n;
    radius = r;
    strength = s;
    
    float len = totalLength/numPoints;
    
    for(int i=0;i<numPoints;i++) {
      Particle particle = new Particle(width/2, i*len);
      physics.addParticle(particle);
      particles.add(particle);
      
      if(i!=0) {
        Particle previous = particles.get(i-1);
        VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
        physics.addSpring(spring);
      }
    }
    
    Particle head = particles.get(0);
    head.lock();
    
    tail = particles.get(numPoints-1);
    tail.r = radius;
  }
  
  void contains(int x, int y) {
    float d = dist(x, y, tail.x, tail.y);
    if(d<radius) {
      offset.x = tail.x - x;
      offset.y = tail.y - y;
      tail.lock();
      dragged = true;
    }
  }
  
  void release() {
    tail.unlock();
    dragged = false;
  }
  
   void updateTail(int x, int y) {
     if (dragged) {
       tail.set(x+offset.x,y+offset.y);
     }
   }
  
  void display() {
    // Draw line connecting all points
    beginShape();
    stroke(0);
    strokeWeight(2);
    noFill();
    for (Particle p : particles) {
      vertex(p.x,p.y);
    }
    endShape();
    tail.display();
  }
}
