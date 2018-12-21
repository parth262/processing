class ParticleSystem {
  ArrayList<Particle> particles;
  PVector location;
  
  ParticleSystem(float x, float y) {
    particles = new ArrayList();
    location = new PVector(x, y);
  }
  
  void addParticle() {
    particles.add(new SquareParticle(location.copy()));
  }
  
  void run() {
    for(int i=particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      p.display();
      if(p.isDead()) {
        particles.remove(i);
      }
    }
  }
    
}
