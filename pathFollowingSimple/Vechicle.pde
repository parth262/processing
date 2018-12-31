class Vehicle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;
  
  Vehicle(PVector l, float ms, float mf) {
    position = l.copy();
    r = 4.0;
    maxSpeed = ms;
    maxForce = mf;
    acceleration = new PVector();
    velocity = new PVector(maxSpeed, 0);
  }
  
  void run() {
    update();
    display();
  }
  
  void follow(Path p) {
    PVector predict = velocity.copy();
    predict.normalize();
    predict.mult(50);
    PVector predictpos = PVector.add(position, predict);
    
    PVector a = p.start;
    PVector b = p.end;
    
    PVector normalPoint = getNormalPoint(predictpos, a, b);
    
    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);
    
    float distance = PVector.dist(predictpos, normalPoint);
    
    if(distance > p.radius) {
      seek(target);
    }
    
    if(debug) {
      fill(0);
      stroke(0);
      line(position.x, position.y, predictpos.x, predictpos.y);
      ellipse(predictpos.x, predictpos.y, 4, 4);

      // Draw normal position
      fill(0);
      stroke(0);
      line(predictpos.x, predictpos.y, normalPoint.x, normalPoint.y);
      ellipse(normalPoint.x, normalPoint.y, 4, 4);
      stroke(0);
      if (distance > p.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x+dir.x, target.y+dir.y, 8, 8);
    }
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    
    if(desired.mag() == 0) return;
    
    desired.normalize();
    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p, a);
    // Vector from a to b
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    float theta = velocity.heading() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(PConstants.TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  
  void borders(Path p) {
    if (position.x > p.end.x + r) {
      position.x = p.start.x - r;
      position.y = p.start.y + (position.y-p.end.y);
    }
  }

}
