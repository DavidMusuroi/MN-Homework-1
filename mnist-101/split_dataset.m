function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % Amestec toate exemplele
  [m, n] = size(X);
  mix_m = randperm(m);
  X = X(mix_m, 1 : n);
  y = y(mix_m, 1);

  % Construiesc cele 4 matrice
  m_percent = m * percent;
  X_train = X(1 : m_percent, 1 : n);
  y_train = y(1 : m_percent, 1);
  X_test = X(m_percent + 1 : m, 1 : n);
  y_test = y(m_percent + 1 : m, 1);
end
