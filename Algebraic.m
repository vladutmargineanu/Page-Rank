% Margineanu Nicolae-Vladut, 313CA

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  output_precision(6);
  fid = fopen (nume, 'r');
  % Citim N liste de adiacenta (resurse web).
  N = fscanf(fid, '%d', 1);
  % Initializam matricea A.
  A = zeros(N, N);
  for a = 1 : N
    % Citim pentru fiecare lista de adiacenta elementele pe linie.
    % Citim nodul i.
    i = fscanf(fid, '%d', 1);  
    % Numarul de link-uri detinut de nodul i.
    % Citim numarul de noduri cu care se invecineaza nodul i.
    L = fscanf(fid, '%d', 1);  
    % Retinem numarul de link-uri pentru fiecare pagina.
    V(i) = L; 
    % Citim nodurile cu care se invecineaza i.
    for j = 1 : L
      nod = fscanf(fid, '%d', 1);
      % Construim matricea de adiacenta A.
      if nod != i
        A(i, nod) = 1;
      else  V(i) = V(i) - 1;
      endif
    endfor
  endfor
     val1 = fscanf(fid, '%f', 1);
     val2 = fscanf(fid, '%f', 1);
  fclose(fid);
  % Construim matricea M.
   for i = 1 : N
     for j = 1 : N
        if A(j, i) == 1
         M(i, j) = 1 / V(j);
        else M(i, j) = 0;
        endif
     endfor
   endfor
  % Calculam vectorul PageRank folosind varianta algebrica de calcul.
  % Matricea unitate de dimensiune N.
  I = eye(N);
  % Calculam inversa unei matrici prin factorizare G-S si rezolvam un SST.
  T_inv = GramSchmidt(I - d * M);
  % Vectorul unitate coloana.
  v(1:N, 1) = 1;
  R = T_inv * ((1 - d) / N) * v;
  
endfunction