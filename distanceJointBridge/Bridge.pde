class Bridge {
  ArrayList<Particle> particles = new ArrayList();
  float len;
  int y;
  
  Bridge() {
    len = 17;
    y = 400;
    
    particles.add(new StaticParticle(0, y));
    for (int i=int(len); i<= width; i+=len) {
      particles.add(new Particle(i, y));
    }
    particles.add(new StaticParticle(width, y));
    
    for(int i=0;i<particles.size()-1;i++) {
      Particle p1 = particles.get(i);
      Particle p2 = particles.get(i+1);
      joint(p1, p2);
    }
  }
  
  void joint(Particle p1, Particle p2) {
    DistanceJointDef djd = new DistanceJointDef();
    djd.bodyA = p1.body;
    djd.bodyB = p2.body;
    djd.length = box2d.scalarPixelsToWorld(len);
    djd.frequencyHz = 40;
    djd.dampingRatio = 1;
    
    box2d.world.createJoint(djd);
  }
  
  void display() {
    for(Particle p: particles) {
      p.display();
    }
  }
  
}
