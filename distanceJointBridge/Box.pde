class Box {
  float x, y, w, h;
  Body body;
  
  Box(float x_, float y_) {
    x = x_;
    y = y_;
    w = random(10, 20);
    h = random(10, 20);
    
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);
    
    body.createFixture(ps, 1);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(100);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(0,0,w,h);
    // Let's add a line so we can see the rotation
    popMatrix();
  }
}
