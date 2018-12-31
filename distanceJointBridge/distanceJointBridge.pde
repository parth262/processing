import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
Bridge b;
ArrayList<Box> boxes;

void setup() {
  size(1000, 800);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  b = new Bridge();
  boxes = new ArrayList();
}

void draw() {
  background(255);
  box2d.step();
  b.display();
  
  if(mousePressed) {
    boxes.add(new Box(mouseX, mouseY));
  }
  
  for(Box b: boxes) {
    b.display();
  }
}
