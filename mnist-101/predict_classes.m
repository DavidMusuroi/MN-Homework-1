function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % Folosesc functia reshape pentru a avea exact dimensiunile din cerinta
  Theta1 = reshape(weights(1 : hidden_layer_size * (input_layer_size + 1)), [hidden_layer_size, input_layer_size + 1]);
  theta_size = hidden_layer_size * (input_layer_size + 1) + output_layer_size * (hidden_layer_size + 1);
  Theta2 = reshape(weights(1 + hidden_layer_size * (input_layer_size + 1) : theta_size), [output_layer_size, hidden_layer_size + 1]);

  % Aplic Forward Propagation
  size_X = size(X, 1);
  a1 = [ones(size_X, 1) X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2_biased = [ones(size_X, 1) a2];
  z3 = a2_biased * Theta2';
  a3 = sigmoid(z3);
  [m, n] = size(a3);
  
  % Gasesc maximul si actualizez vectorul de clase cu indicele
  classes = zeros(m, 1);
  for i = 1 : m
    maxim = -1;
    for j = 1 : n
      if(a3(i, j) > maxim)
        maxim = a3(i, j);
        classes(i, 1) = j;
      endif
    endfor
  endfor
end
