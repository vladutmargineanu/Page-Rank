% Nume, Prenume, Grupa

function B = GramSchmidt(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Acesta este un algoritm destul de diferit, nu doar o simplă modificare a clasicului Gram-Schmidt.
  % Ideea este de a ortogonaliza împotriva setului de vectori care apar în loc de setul original. 
  % Există două variante, unul orientat pe coloană și unul orientat pe rând.
  % Ele produc aceleași rezultate, în ordine diferită.
  % Eu am realizat versiunea coloană.
  % Dupa factorizare QR, am rezolvat sistemul triunghiular superior (SST).
  
	[N N] = size(A);
  % A = matricea de factorizat (baza initiala).
	Q = A;
  % Q = factorul ortogonal(baza ortonormata).
	R = zeros(N, N);
  % R = factorul superior triunghiular.
  % Iteram prin fiecare coloana pentru calcularea matricei ortogonale Q.
	for k = 1 : N
		R(k, k) = norm(Q(1:N, k));
		Q(1:N, k) = Q(1:N, k) / R(k, k);
	  for j = k+1 : N
		  R(k, j) = Q(1:N, k)' * Q(1:N, j);
		  Q(1:N, j) = Q(1:N, j) - Q(1:N, k) * R(k, j);
	  endfor
	endfor
  % Matricea triunghiulara superioara va fi transpose(Q) * A.
  N = size(R);
  % solve the system
  % Rezolvam sistemul prin SST.
  % A * x = b => Q * R * x = b => R * x = transpose(Q) * b
  Q = Q';  
  for iter = 1 : N
    % Initializam vectorul coloana cu 0.
    x = zeros(N, 1);
    % Extragem fiecare coloana din matricea ortogonala Q in vectoril coloana b.
    b = Q(:, iter);
    % Calculam x(i) invers (backwards).
    for i = N : -1 : 1
      % Calculam suma.
      sum_of_xs = 0;
      for j = i+1 : N
        sum_of_xs = sum_of_xs + R(i, j) * x(j);
      endfor
      x(i) = (b(i, 1) - sum_of_xs) / R(i, i);
    endfor
    % Inseram in matricea B, fiecare coloana x calculata.
    B(:, iter) = x;
  endfor
   
endfunction 