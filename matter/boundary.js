function Boundary(x, y, w, h, angle) {

  this.w = w;
  this.h = h;
  var options = {
    friction: 0.3,
    restitution: 0.05,
    angle: angle,
    isStatic: true
  }
  this.body = Bodies.rectangle(x, y, w, h, options)
  World.add(world, this.body)
  
  this.show = function() {
    var pos = this.body.position;
    var angle = this.body.angle;
    push()
    translate(pos.x, pos.y);
    rotate(angle);
    noStroke();
    rectMode(CENTER);
    fill(255);
    rect(0,0,w,h);
    pop();
  }
}
