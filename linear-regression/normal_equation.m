function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  m = size(FeatureMatrix, 1);
  Theta = zeros(m, 1);
  b = FeatureMatrix' * Y;
  r = b;
  v = b;
  k = 1;
  A = FeatureMatrix' * FeatureMatrix;
  while k <= iter && r' * r > tol .^ 2
    t = (r' * r) / (v' * A * v);
    Theta += t * v;
    next_r = r - t * A * v;
    s = (next_r' * next_r) / (r' * r);
    r = next_r;
    v = r + s * v;
    k++;
  end
  Theta = [double(0); Theta];
end
