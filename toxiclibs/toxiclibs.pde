import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Particle p1;
Particle p2;
Connection spring;

void setup() {
  size(600, 400);
  
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  p1 = new Particle(new Vec2D(width/2, 20));
  p2 = new Particle(new Vec2D(width/2+160, 20));
  
  p1.lock();
  
  spring = new Connection(p1, p2, 160, 0.01);
  
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);
}

void draw() {
  physics.update();
  background(255);
  spring.display();
  p1.display();
  p2.display();
  
  if(mousePressed) {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  }
}
