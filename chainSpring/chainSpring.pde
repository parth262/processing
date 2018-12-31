import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;

Chain chain;

void setup() {
  size(600, 400);
  
  physics = new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));
  
  physics.setWorldBounds(new Rect(0,0,width,height));
  chain = new Chain(180, 20, 16, 0.2);
}

void draw() {
  physics.update();
  background(255);
  chain.updateTail(mouseX, mouseY);
  chain.display();
}

void mousePressed() {
  chain.contains(mouseX, mouseY);
}

void mouseReleased() {
  chain.release();
}
