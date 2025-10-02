function [Y, InitialMatrix] = parse_csv_file(file_path)
  count = 1;
  % Trec peste prima linie din fisier
  file = fopen(file_path, 'r');
  get_line = fgetl(file);

  while 1
    get_line = fgetl(file);
    % Nu am iesit inca din fisier (mai sunt caractere de citit)
    if ischar(get_line) == 0
      break;
    endif
    csv_file_details = strsplit(get_line, ',');
    % Construiesc cele 2 matrice
    Y(count, 1) = str2double(csv_file_details{1});
    InitialMatrix(count, :) = csv_file_details(2 : end);
    n = size(InitialMatrix, 2);
    for i = 1 : n
      InitialMatrix{count, i} = char(InitialMatrix{count, i});
      check_nan = str2double(InitialMatrix{count, i});
      % Verific daca am numar sau cuvant in matrice si o actualizez
      if isnan(check_nan) == 0
        InitialMatrix{count, i} = check_nan;
      endif
    endfor
    count++;
  end
end
