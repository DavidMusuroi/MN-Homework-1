function [decoded_path] = decode_path (path, lines, cols)
	n = size(path, 2);
	init_mat = zeros(lines, cols);
	loop_init_mat = 1;

	% Construiesc matricea initiala
	for i = 1 : lines
		for j = 1 : cols
			init_mat(i, j) = loop_init_mat;
			loop_init_mat++;
		endfor
	endfor

	% Construiesc matricea drumului decodat (n - 1 pentru ca nu vreau si
	% indicele WIN-ului)
	decoded_path = zeros(n - 1, 2);
	for i = 1 : n - 1
		for j = 1 : lines
			for k = 1 : cols
				if init_mat(j, k) == path(1, i)
					decoded_path(i, 1) = j;
					decoded_path(i, 2) = k;
					break;
				endif
			endfor
		endfor
	endfor
end
