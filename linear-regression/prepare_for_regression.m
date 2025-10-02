function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [m, n] = size(InitialMatrix);
  for i = 1 : m
    % found verifica daca ultimul element de pe linie este numar sau cuvant
    found = 0;
    for j = 1 : n
      if strcmp(InitialMatrix(i, j), "no")
        FeatureMatrix(i, j) = 0;
      else if strcmp(InitialMatrix(i, j), "yes")
        FeatureMatrix(i, j) = 1;
      else if strcmp(InitialMatrix(i, j), "semi-furnished")
        FeatureMatrix(i, j) = 1;
        FeatureMatrix(i, j + 1) = 0;
        found = 1;
      else if strcmp(InitialMatrix(i, j), "unfurnished")
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 1;
        found = 1;
      else if strcmp(InitialMatrix(i, j), "furnished")
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j + 1) = 0;
        found = 1;
      else if found == 0
        FeatureMatrix(i, j) = InitialMatrix{i, j};
      else
        FeatureMatrix(i, j + 1) = InitialMatrix{i, j};
      endif
      endif
      endif
      endif
      endif
      endif
    endfor
end
