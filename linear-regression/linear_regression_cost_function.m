function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m = size(Y, 1);
  n = size(FeatureMatrix, 2);
  Error = 0;
  for i = 1 : m
    h0 = 0;
    for j = 2 : n + 1
      h0 += Theta(j, 1) * FeatureMatrix(i, j - 1);
    endfor
    Error += (h0 - Y(i, 1)) .^ 2;
  endfor
  Error /= (2 * m);
end
