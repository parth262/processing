var Engine = Matter.Engine,
    World = Matter.World,
    Bodies = Matter.Bodies;


var engine;
var world;
var boxes = [];
var boundaries = [];
var balls = [];
function setup() {
  createCanvas(1000, 800);
  engine = Engine.create();
  world = engine.world;
  world.gravity.y = 2;
  boundaries.push(new Boundary(200, 200, 500, 5, PI/8))
  boundaries.push(new Boundary(width/2, 500, 500, 5, -PI/8))
  //Engine.run(engine);

}

function draw() {
  background(0)
  Engine.update(engine);
  boxes.forEach(b => b.show())
  for(var i=balls.length-1;i>=0;i--) {
    balls[i].show();
    if(balls[i].isOffscreen()) {
      balls[i].removeFromWorld();
      balls.splice(i, 1);
    }
  }
  boundaries.forEach(b => b.show())
}

function mousePressed() {
  balls.push(new Ball(mouseX, mouseY, random(10, 15)));
}

function mouseDragged() {
  boxes.push(new Box(mouseX, mouseY, 20, 20));
}
