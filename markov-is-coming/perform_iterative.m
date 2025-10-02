function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	x = x0;
	for i = 1 : max_steps
		x = G * x + c;
		if norm(x - x0) < tol
			break;
		endif
		x0 = x;
	endfor
	
	steps = i;
	err = norm(x - x0);
end
