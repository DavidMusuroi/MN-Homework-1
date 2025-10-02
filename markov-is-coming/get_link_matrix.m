function [Link] = get_link_matrix (Labyrinth)
	% Initializez matricea Link
  [m, n] = size(Labyrinth);
  Link = zeros(m * n + 2, m * n + 2);
  Link(m * n + 1, m * n + 1) = Link(m * n + 2, m * n + 2) = 1;
  nr = 1;

  for i = 1 : m
    for j = 1 : n
      probability = 0;
      crt_elem = Labyrinth(i, j);

      if(crt_elem >= 8)
        crt_elem -= 8;
      else
        probability++;
      endif

      if(crt_elem >= 4)
        crt_elem -= 4;
      else
        probability++;
      endif

      if(crt_elem >= 2)
        crt_elem -= 2;
      else
        probability++;
      endif

      if(crt_elem == 0)
        probability++;
      endif

      % In acest moment, am probabilitatea tranzitiei dintr-o stare in alta

      % Verific deplasarea spre N
      if Labyrinth(i, j) >= 8
        Labyrinth(i, j) -= 8;
      else if Labyrinth(i, j) < 8 && i == 1
        Link(nr, m * n + 1) = 1 / probability;
      else
        Link(nr, nr - n) = 1 / probability;
      endif
      endif

      % Verific deplasarea spre S
      if Labyrinth(i, j) >= 4
        Labyrinth(i, j) -= 4;
      else if Labyrinth(i, j) < 4 && i == m
        Link(nr, m * n + 1) = 1 / probability;
      else
        Link(nr, nr + n) = 1 / probability;
      endif
      endif

      % Verific deplasarea spre E
      if Labyrinth(i, j) >= 2
        Labyrinth(i, j) -= 2;
      else if Labyrinth(i, j) < 2 && j == n
        Link(nr, m * n + 2) = 1 / probability;
      else
        Link(nr, nr + 1) = 1 / probability;
      endif
      endif

      % Verific deplasarea spre V
      if Labyrinth(i, j) >= 1
        Labyrinth(i, j) -= 1;
      else if Labyrinth(i, j) < 1 && j == 1
        Link(nr, m * n + 2) = 1 / probability;
      else
        Link(nr, nr - 1) = 1 / probability;
      endif
      endif

      nr++;
    endfor
  endfor
  Link = sparse(Link);
end
