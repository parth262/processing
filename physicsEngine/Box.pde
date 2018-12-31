class Box {
  
  Body body;
  float x, y;
  float w, h;
  
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = 16;
    h = 16;   
    
    makeBody();
  }
  
  void makeBody() {
    //Step 1 Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    
    //Step 2 Create body
    body = box2d.createBody(bd);
    
    //Step 3 Create Shape
    PolygonShape ps = new PolygonShape();
    float box2dw = box2d.scalarPixelsToWorld(w/2);
    float box2dh = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    
    //Step4 Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    //Physical properties
    fd.density = 1;
    fd.friction = 1;
    fd.restitution = 0.5;
    
    //Step 5 Attach Shape to Body
    body.createFixture(fd);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a); 
    fill(127);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
}
