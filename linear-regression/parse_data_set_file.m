function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % Initializez datele
  file = fopen(file_path, 'r');
  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1 : m
    % Ma folosesc de structura fisierului de date
    Y(i, 1) = fscanf(file, '%d', 1);
    InitialMatrix(i, 1) = fscanf(file, '%f', 1);
    for j = 3 : 16
      InitialMatrix(i, j - 1) = fscanf(file, '%d', 1);
    endfor
    for j = 17 : n - 2
      InitialMatrix(i, j - 1) = fscanf(file, '%s', 1);
    endfor
    InitialMatrix(i, n - 2) = fscanf(file, '%d', 1);
    InitialMatrix(i, n - 1) = fscanf(file, '%s', 1);

    % Verific daca ultimul element este cuvant sau numar real
    get_line = fgetl(file);
    % Elimin "\n" de la sfarsitul lui
    get_last_elem = strtrim(get_line);
    real_val = str2double(get_last_elem);

    if isnan(real_val) == 1
      InitialMatrix(i, n) = get_last_elem;
    else
      InitialMatrix(i, n) = real_val;
    endif
  endfor
end
