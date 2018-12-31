ArrayList<ParticleSystem> ps;

void setup() {
  size(600, 400);
  ps = new ArrayList();
}

void draw() {
  background(0);
  for(int i=0; i<ps.size();i++) {
    ParticleSystem p = ps.get(i);
    p.addParticle();
    p.run();
  }
}

void mousePressed() {
  ps.add(new ParticleSystem(mouseX, mouseY));
}
