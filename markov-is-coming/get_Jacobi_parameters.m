function [G, c] = get_Jacobi_parameters (Link)
	[m, n] = size(Link);
  m -= 2;
  n -= 2;
  % G are aceeasi dimensiune cu Labyrinth
  G = Link(1 : m, 1 : n);
  c = Link(1 : m, m + 1);
end
