function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  [m, n] = size(FeatureMatrix);
  sum = 0;
  Error = 0;
  % Termenul 2 al sumei
  for i = 1 : n + 1
    sum += abs(Theta(i, 1));
  endfor
  sum *= lambda;

  % Calculez h0 si Eroarea
  for i = 1 : m
    h0 = 0;
    for j = 2 : n + 1
      h0 += Theta(j, 1) * FeatureMatrix(i, j - 1);
    endfor
    Error += (h0 - Y(i, 1)) .^ 2;
  endfor
  Error /= m;
  Error += sum;
end
