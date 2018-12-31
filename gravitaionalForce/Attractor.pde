class Attractor {

  float mass;
  PVector location;
  float G = 0.4;
  
  Attractor() {
    location = new PVector(width/2,height/2);
    mass = 20;
  }
  
  void update(float x, float y) {
    location.x = x;
    location.y = y;
  }
 
  void display() {
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
  float constrain(float distance, float min, float max) {
    if(distance > max) {
      return max;
    } else if(distance < min) {
      return min;
    } else {
      return distance;
    }
  }
  
}
