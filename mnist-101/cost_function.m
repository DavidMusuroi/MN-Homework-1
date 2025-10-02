function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
  size_X = size(X, 1);
  % Folosesc functia reshape pt a avea exact dimensiunile din cerinta
  Theta1 = reshape(params(1 : hidden_layer_size * (input_layer_size + 1)), [hidden_layer_size, input_layer_size + 1]);
  theta_size = hidden_layer_size * (input_layer_size + 1) + output_layer_size * (hidden_layer_size + 1);
  Theta2 = reshape(params(1 + hidden_layer_size * (input_layer_size + 1) : theta_size), [output_layer_size, hidden_layer_size + 1]);

  % Forward Propagation
  a1 = [ones(size_X, 1), X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2_biased = [ones(size_X, 1) a2];
  z3 = a2_biased * Theta2';
  a3 = sigmoid(z3);

  % Construiesc matricea label-urilor corespunzatoare lui y
  tmp = eye(output_layer_size);
  mat_etichetelor = tmp(y, :);

  % Construiesc J-ul
  J = (1 / size_X) * sum(sum(-mat_etichetelor .* log(a3) - (1 - mat_etichetelor) .* log(1 - a3)));
  % Construiesc suma patratelor
  suma_patratelor = sum(sum(Theta1(1 : hidden_layer_size, 2 : input_layer_size + 1) .^ 2)) + sum(sum(Theta2(1 : output_layer_size, 2 : hidden_layer_size + 1) .^ 2));
  J += suma_patratelor * lambda / (2 * size_X);

  % Backpropagation cu Gamma_i = delta mic_i
  grad = zeros(size(params));
  Gamma3 = a3 - mat_etichetelor;
  Delta2 = Gamma3' * a2_biased;
  %Altfel, vom obine o eroare mis-match
  Gamma2 = (Gamma3 * Theta2(1 : output_layer_size, 2 : hidden_layer_size + 1)) .* a2 .* (1 - a2);
  Delta1 = Gamma2' * a1;
  Delta1 = Delta1 / size_X;
  Delta2 = Delta2 / size_X;

  % Adun la Delta1 si Delta2 toate elementele cu coloanele > 1 ale lui Theta1 si Theta2 si construiesc grad
  Delta1(1 : hidden_layer_size, 2 : input_layer_size + 1) += (lambda / size_X) * Theta1(1 : hidden_layer_size, 2 : input_layer_size + 1);
  Delta2(1 : output_layer_size, 2 : hidden_layer_size + 1) += (lambda / size_X) * Theta2(1 : output_layer_size, 2 : hidden_layer_size + 1);
  grad = [Delta1(:); Delta2(:)];
end
