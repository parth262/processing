class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float mass;
  boolean dragging;
  PVector dragOffset;
  
  Mover(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector();
    dragOffset = new PVector();
    topSpeed = 10;
    acceleration = new PVector();
    mass = m;
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }
  
  void display() {
    stroke(0);
    if(dragging) {
      fill(150);
    } else {
      fill(255);
    }
    ellipse(location.x, location.y, mass*2, mass*2);
  }
  
  void clicked(int mx, int my) {
    float d = dist(mx, my, location.x, location.y);
    if(d<mass) {
      dragging = true;
      dragOffset.x = location.x - mx;
      dragOffset.y = location.y - my;
    }
  }
  
  void stopDragging() {
    dragging = false;
  }
  
  void drag(int mx, int my) {
    if(dragging) {
      location.x = mx + dragOffset.x;
      location.y = my + dragOffset.y;
    }
  }
  //void checkEdges() {
  //  if (location.x > width) {
  //    velocity.x *= -1;
  //    location.x = width;
  //  } else if (location.x < 0) {
  //    velocity.x *= -1;
  //    location.x = 0;
  //  }
 
  //  if (location.y > height) {
  //    velocity.y *= -1;
  //    location.y = height;
  //  } else if (location.y < 0) {
  //    velocity.y *= -1;
  //    location.y = 0;
  //  }
  //}
}
