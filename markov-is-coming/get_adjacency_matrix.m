function [Adj] = get_adjacency_matrix (Labyrinth)
	% Initializez matricea Adj
  [m, n] = size(Labyrinth);
  Adj = zeros(m * n + 2, m * n + 2);
  Adj(m * n + 1, m * n + 1) = Adj(m * n + 2, m * n + 2) = 1;
  nr = 1;

  for i = 1 : m
    for j = 1 : n
      crt_elem = Labyrinth(i, j);

      % Verific deplasarea spre N
      if crt_elem >= 8
        crt_elem -= 8;
      else if crt_elem < 8 && i == 1
        Adj(nr, m * n + 1) = 1;
      else
        Adj(nr - n, nr) = Adj(nr, nr - n) = 1;
      endif
      endif

      % Verific deplasarea spre S
      if crt_elem >= 4
        crt_elem -= 4;
      else if crt_elem < 4 && i == m
        Adj(nr, m * n + 1) = 1;
      else
        Adj(nr + n, nr) = Adj(nr, nr + n) = 1;
      endif
      endif

      % Verific deplasarea spre E
      if crt_elem >= 2
        crt_elem -= 2;
      else if crt_elem < 2 && j == n
        Adj(nr, m * n + 2) = 1;
      else
        Adj(nr + 1, nr) = Adj(nr, nr + 1) = 1;
      endif
      endif

      % Verific deplasarea spre V
      if crt_elem >= 1
        crt_elem -= 1;
      else if crt_elem < 1 && j == 1
        Adj(nr, m * n + 2) = 1;
      else
        Adj(nr - 1, nr) = Adj(nr, nr - 1) = 1;
      endif
      endif

      nr++;
    endfor
  endfor
  Adj = sparse(Adj);
end
