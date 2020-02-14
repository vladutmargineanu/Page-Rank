% Margineanu Nicolae-Vladut, 313CA

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
     fid = fopen (nume, 'r');
     % Citim N liste de adiacenta (resurse web).
     output_precision(6);
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
             A(i,nod) = 1;
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
   % Calculam factorul R
   R0 = ones(N, 1);
   R0 = R0 / N;     
      v(1:N, 1) = 1;
      
    while 1
      R = d * M * R0 + ((1 - d) / N) * v;
      % Algoritmul se opreşte când se atinge pentru un eps (precizia).
      if norm(R - R0) < eps
        break;
      endif
      R0 = R;
    endwhile
    
 endfunction