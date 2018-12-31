import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


ArrayList<Box> boxes;
Surface s;
Box2DProcessing box2d;

void setup() {
  size(600, 400);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  boxes = new ArrayList();
  s = new Surface();
}

void draw() {
  background(255);
  box2d.step();
  
  s.display();
  
  if(mousePressed) {
    boxes.add(new Box(mouseX, mouseY));
  }
  
  for(Box b: boxes) {
    b.display();
  }
}
