import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList<Pair> pairs;

void setup() {
  size(600, 400);
  smooth();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  pairs = new ArrayList();
}

void draw() {
  background(255);
  box2d.step();
  for(Pair p: pairs) {
    p.display();
  }
}

void mousePressed() {
   Pair p = new Pair(mouseX,mouseY);
   pairs.add(p);
}
