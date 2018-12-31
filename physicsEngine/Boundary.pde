class Boundary {
  Body body;
  float x, y;
  float w, h;
  
  Boundary(float x_, float y_) {
    x = x_;
    y = y_;
    w = 300;
    h = 16;
    
    makeBody();
  }
  
  void makeBody() {
    //Step 1 Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    //Step 2 Create body
    body = box2d.createBody(bd);
    
    //Step 3 Create Shape
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    
    //Step 5 Attach Shape to Body
    body.createFixture(ps,1);
  }
  
  void display() {
    fill(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}
