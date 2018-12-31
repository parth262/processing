class DNA {

  PVector[] genes;
  float maxForce = 0.5;
  
  DNA() {
    genes = new PVector[lifetime];
    for(int i=0;i<genes.length;i++) {
      float angle = random(TWO_PI);
      genes[i] = new PVector(cos(angle), sin(angle));
      genes[i].mult(random(0, maxForce));
    }
  }
  
  DNA(PVector[] newgenes) {
    genes = newgenes;
  }
  
  DNA crossover(DNA partner) {
    PVector[] newgenes = new PVector[genes.length];
    int crossover = int(random(genes.length));
    for(int i=0;i<genes.length;i++) {
      if(i > crossover) newgenes[i] = genes[i];
      else newgenes[i] = partner.genes[i];
    }
    
    DNA child = new DNA(newgenes);
    return child;
  }
  
  void mutate(float mutationRate) {
    for(int i=0;i<genes.length;i++) {
      if(random(1) < mutationRate) {
        float angle = random(TWO_PI);
        genes[i] = new PVector(cos(angle), sin(angle));
        genes[i].mult(random(0, maxForce));
      }
    }
  }
}

void mousePressed() {
  target.x = mouseX;
  target.y = mouseY;
}
