function [Theta] = grad_fct_costient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  Theta = zeros(n, 1);
  for i = 1 : iter
    % Construiesc matricea h0
    h0 = zeros(m, 1);
    for j = 1 : m
      for k = 1 : n
        h0(j, 1) += FeatureMatrix(j, k) * Theta(k, 1);
      endfor
      h0(j, 1) -= Y(j, 1);
    endfor

    % Calculez vectorul de gradienti
    grad_fct_cost = zeros(n, 1);
    for j = 1 : n
      for k = 1 : m
        grad_fct_cost(j, 1) += FeatureMatrix(k, j) * h0(k, 1);
      endfor
      grad_fct_cost(j, 1) /= m;
    endfor
    % Actualizez Theta
    for j = 1 : n
      Theta(j, 1) -= grad_fct_cost(j, 1) * alpha;
    endfor
  endfor
  Theta = [double(0); Theta];
end
