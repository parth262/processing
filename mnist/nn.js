function sigmoid(x) {
  return 1 / (1 + Math.exp(-x));
}

function dsigmoid(y) {
  return y*(1-y);
}

class NeuralNetwork {

  constructor(numI, numH, numO) {
    this.input_nodes = numI;
    this.hidden_nodes = numH;
    this.output_nodes = numO;

    this.weights_ih = new Matrix(this.hidden_nodes, this.input_nodes);
    this.weights_ho = new Matrix(this.output_nodes, this.hidden_nodes);
    this.weights_ih.randomize();
    this.weights_ho.randomize();
    this.bias_h = new Matrix(this.hidden_nodes, 1);
    this.bias_o = new Matrix(this.output_nodes, 1);
    this.bias_h.randomize();
    this.bias_o.randomize();
    this.learning_rate = 0.5;
  }

  setLearningRate(lr) {
    this.learning_rate = lr;
  }

  predict(input_array) {

    let inputs = Matrix.fromArray(input_array);
    let hidden = Matrix.dot(this.weights_ih, inputs);
    hidden.add(this.bias_h);
    hidden = Matrix.map(hidden, sigmoid);

    let outputs = Matrix.dot(this.weights_ho, hidden);
    outputs.add(this.bias_o);
    outputs = Matrix.map(outputs, sigmoid);

    return outputs.toArray();
  }

  train(input_array, target_array) {
    let inputs = Matrix.fromArray(input_array);
    let hidden = Matrix.dot(this.weights_ih, inputs);
    hidden.add(this.bias_h);
    hidden = Matrix.map(hidden, sigmoid);

    let outputs = Matrix.dot(this.weights_ho, hidden);
    outputs.add(this.bias_o);
    outputs = Matrix.map(outputs, sigmoid);

    let targets = Matrix.fromArray(target_array);
    let output_errors = Matrix.subtract(targets, outputs);

    let output_gradients = Matrix.map(outputs, dsigmoid);
    output_gradients.multiply(output_errors);
    output_gradients.multiply(this.learning_rate);

    let hiddens_t = Matrix.transpose(hidden);
    let weights_ho_deltas = Matrix.dot(output_gradients, hiddens_t);

    this.weights_ho.add(weights_ho_deltas);
    this.bias_o.add(output_gradients);

    let who_t = Matrix.transpose(this.weights_ho);
    let hidden_errors = Matrix.dot(who_t, output_errors);

    let hidden_gradients = Matrix.map(hidden, dsigmoid);
    hidden_gradients.multiply(hidden_errors);
    hidden_gradients.multiply(this.learning_rate);

    let inputs_t = Matrix.transpose(inputs);
    let weights_ih_deltas = Matrix.dot(hidden_gradients, inputs_t);

    this.weights_ih.add(weights_ih_deltas);
    this.bias_h.add(hidden_gradients);
  }
}
