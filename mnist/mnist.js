var mnist;
var train_index = 0;
var nn;
let para;
let user_digit
let userPredictionPara
let img

function setup() {
  createCanvas(400,200, P2D);
  img = createImage(28, 28);
  para = createP();
  userPredictionPara = createP();
  user_digit = createGraphics(width/2,height)
  user_digit.pixelDensity(1)
  loadMNIST(callback);
  nn = new NeuralNetwork(784, 16, 10);
}

function draw() {
  background(0);
  guessUserDigit();
  if(mnist && Object.keys(mnist).length == 4) {
    for(let i=0;i<50;i++) {
      if(train_index < 60000) {
        train();
      }
    }
  }

  image(user_digit, 0, 0)

  if(mouseIsPressed) {
    user_digit.stroke(255)
    user_digit.strokeWeight(10)
    user_digit.line(mouseX, mouseY, pmouseX, pmouseY)
  }
}

function keyPressed() {
  if(key == ' ') {
    user_digit.background(0)
  }
}

function guessUserDigit() {
  let inputs = []
  let img = user_digit.get()
  img.resize(28, 28)
  img.loadPixels()
  for(var i=0;i<784;i++) {
    inputs[i] = img.pixels[i*4]
  }

  let guess = nn.predict(inputs)
  let prediction = findMax(guess)

  userPredictionPara.html(`User Digit Prediction: ${prediction}`).style('font-size', '24pt')
}


function train() {
  let inputs = [];
  img.loadPixels();
  for(var i=0;i<784;i++) {
    let bright = mnist.train_data[i + train_index*784]
    inputs[i] = bright / 255
    let index = i*4
    img.pixels[index + 0] = bright
    img.pixels[index + 1] = bright
    img.pixels[index + 2] = bright
    img.pixels[index + 3] = 255
  }
  img.updatePixels();
  image(img,width/2,0,width/2,height)

  var label = mnist.train_labels[train_index]
  let targets = [0,0,0,0,0,0,0,0,0,0]
  targets[label] = 1;

  let guess = nn.predict(inputs)
  let prediction = findMax(guess)

  show(label, prediction)

  nn.train(inputs, targets)

  train_index++;
}

function findMax(arr) {
  let max = 0;
  let index = 0;
  for (let i =0;i<arr.length; i++) {
    if(arr[i] > max) {
        max = arr[i]
        index = i
    }
  }
  return index
}

function show(l, p) {
  clr = "red"
  if(l == p) clr = "blue"
  para.html(`Label: ${l} Prediction: ${p}`).style("color", clr).style("font-size", "16pt")
}


async function loadMNIST(callback) {
  var files = {"train_labels": ["mnist/train-labels.idx1-ubyte", 8], "train_data": ["mnist/train-images.idx3-ubyte", 16], "test_labels": ["mnist/t10k-labels.idx1-ubyte", 8], "test_data": ["mnist/t10k-images.idx3-ubyte", 16]};
  for (var [key, value] of Object.entries(files)) {
    await fetch(value[0])
    .then(r => r.arrayBuffer())
    .then(data => callback(key, new Uint8Array(data).slice(value[1])))
  }
}

function callback(key, data) {
  if(!mnist) {
    mnist = {}
  }
  mnist[key] = data
}
