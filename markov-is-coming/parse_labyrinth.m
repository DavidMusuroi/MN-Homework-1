function [Labyrinth] = parse_labyrinth(file_path)
  file = fopen(file_path, 'r');
  m = fscanf(file, '%d', 1);
  n = fscanf(file, '%d', 1);
  
  % Citesc elementele coloana cu coloana
  Labyrinth = fscanf(file, '%d', [n, m]);
  Labyrinth = Labyrinth';
  fclose(file);
end
