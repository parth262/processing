function Ball(x, y, r) {
  var options = {
    friction: 0
  }
  this.body = Bodies.circle(x, y, r, options)
  this.r = r;
  World.add(world, this.body);
  
  this.isOffscreen = function() {
    var pos = this.body.position;
    return pos.y > height + 100;
  }
  
  this.removeFromWorld = function() {
    World.remove(world, this.body);
  }
  
  this.show = function() {
    var pos = this.body.position;
    var angle = this.body.angle;
    push()
    translate(pos.x, pos.y);
    rotate(angle);
    noStroke();
    fill(255);
    ellipse(0,0,r*2);
    pop();
  }
}
