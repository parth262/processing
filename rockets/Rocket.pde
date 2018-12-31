class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float fitness;
  DNA dna;
  int geneCounter = 0;
  
  boolean hitTarget = false;
  boolean hitObstacle = false;
  
  Rocket(PVector l, DNA dna_) {
    acceleration = new PVector();
    velocity = new PVector();
    location = l.copy();
    r = 1;
    dna = dna_;    
  }
  
  void fitness() {
    float d = dist(location.x, location.y, target.x, target.y);
    
    fitness = pow(1/d, 2); //(1.0f/pow(finish, 1.5))*(pow(1/d, 2)); 
  }
  
  void run() {
    checkTarget();
    checkObstacle();
    if(!hitTarget && !hitObstacle && !borders()) {
      applyForce(dna.genes[geneCounter]);
      geneCounter = (geneCounter + 1) % dna.genes.length;
      update();
    }    
    //if(hitObstacle || borders()) {
    //  float angle = random(TWO_PI);
    //  dna.genes[geneCounter] = new PVector(cos(angle), sin(angle));
    //}
    display();
  }
  
  boolean borders() {
    return location.x >= width || location.x <= 0 || location.y >= height || location.y <= 0;
  }
  
  void checkObstacle() {
    for(Obstacle o: obstacles) {
      if(o.contains(location)) {
        hitObstacle = true;
      }
    }
  }
  
  void checkTarget() {
    float d = dist(location.x, location.y, target.x, target.y);
    if(d<12) {
      hitTarget = true;
    }
  }
  
  void applyForce(PVector f) {
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    float theta = velocity.heading() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    
    rectMode(CENTER);
    fill(0);
    rect(-r/2, r*2, r/2, r);
    rect(r/2, r*2, r/2, r);
    
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    
    popMatrix();
  }
  
  float getFitness() {
    return fitness;
  }
  
  DNA getDNA() {
    return dna;
  }
}
