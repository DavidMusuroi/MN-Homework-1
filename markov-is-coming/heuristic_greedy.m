function [path] = heuristic_greedy (start_position, probabilities, Adj)
	path = [start_position];
	[m, n] = size(Adj);
	m -= 2;
	n -= 2;
	visited = zeros(1, m);
	visited(start_position) = 1;

	% Nu am gasit WIN inca
	while 1
		poz = path(end);
		% Am gasit WIN
		if Adj(poz, n + 1) == 1
			path = [path, n + 1];
			break;
		endif

		found = 0;
		probability = 0;
		% Determin elementul cu cea mai mare probabilitate de castig
		for i = 1 : m
			if Adj(poz, i) == 1 && probabilities(i, 1) > probability
				found = i;
				probability = probabilities(i, 1);
			endif
		endfor

		% Verific daca am ajuns la WIN
		if found == 0
			path(poz) = [];
		else
			visited(found) = 1;
			path = [path, found];
		endif
	end
end
