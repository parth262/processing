let nn

let training_data = [
  {
    inputs: [0, 1],
    targets: [1]
  },
  {
    inputs: [1, 0],
    targets: [1]
  },
  {
    inputs: [0, 0],
    targets: [0]
  },
  {
    inputs: [1, 1],
    targets: [0]
  },
]

let scale = 10, cols, rows
let lrSlider

function setup() {
  createCanvas(500, 500)
  nn = new NeuralNetwork(2, 4, 1);
  cols = width/scale
  rows = height/scale

  lrSlider = createSlider(0.01, 0.5, 0.1, 0.01)
}

function draw() {
  background(0)
  noStroke()
  for(let i=0;i<1000;i++) {
    let data = random(training_data)
    nn.train(data.inputs, data.targets)
  }
  nn.setLearningRate(lrSlider.value())

  for(let i=0;i<cols;i++) {
    for(let j=0;j<rows;j++) {
      let x1 = i/cols
      let x2 = j/rows
      let inputs = [x1, x2]
      let y = nn.feedForward(inputs)
      fill(y[0]*255)
      rect(i*scale, j*scale, scale, scale)
    }
  }
}



// let training_data = [
//   {
//     inputs: [0, 1],
//     targets: [1]
//   },
//   {
//     inputs: [1, 0],
//     targets: [1]
//   },
//   {
//     inputs: [0, 0],
//     targets: [0]
//   },
//   {
//     inputs: [1, 1],
//     targets: [0]
//   },
// ]
// let nn;

// function setup() {

//   nn = new NeuralNetwork(2, 2, 1);

//   for(let i=0;i<50000;i++) {
//     let data = random(training_data);
//     nn.train(data.inputs, data.targets);
//   }

//   console.log(nn.feedForward([0, 1]))
//   console.log(nn.feedForward([1, 0]))
//   console.log(nn.feedForward([0, 0]))
//   console.log(nn.feedForward([1, 1]))
// }

// function draw() {

// }
