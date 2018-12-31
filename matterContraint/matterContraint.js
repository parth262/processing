var Engine = Matter.Engine,
    World = Matter.World,
    Bodies = Matter.Bodies,
    Constraint = Matter.Constraint,
    Mouse = Matter.Mouse,
    MouseConstraint = Matter.MouseConstraint;


balls = []

function setup() {
  var canvas = createCanvas(1000, 800);
  engine = Engine.create();
  world = engine.world;
  var prev = null;
  for(var i=50;i<=400;i+=20) {
    b = new Ball(width/2+i, i, 10, !prev)
    balls.push(b);
    if(prev) {
      var options = {
        bodyA: b.body,
        bodyB: prev.body,
        length: 20,
        stiffness: 0.4
      }
      constraint = Constraint.create(options);
      World.add(world, constraint)
    }
    prev=b;
  }
  
  var canvasMouse = Mouse.create(canvas.elt);
  canvasMouse.pixelRatio = pixelDensity();
  var options = {
    mouse: canvasMouse
  }
  var mConstraint = MouseConstraint.create(engine, options)
  World.add(world, mConstraint)
}

function draw() {
  background(0);
  Engine.update(engine);
  for(var i=balls.length-1;i>=0;i--) {
    balls[i].show();
    if(balls[i].isOffscreen()) {
      balls[i].removeFromWorld();
      balls.splice(i, 1);
    }
  }
}
