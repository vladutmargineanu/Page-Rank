% Margineanu Nicolae-Vladut, 313CA

function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  nume_out = strcat(nume, '.out');
  fid1 = fopen (nume, 'r');
   N = fscanf(fid1, '%d', 1);
   % Initializam matricea A la 0.
   A = zeros(N, N);
   for a = 1 : N
      % Citim pentru fiecare lista de adiacenta elementele pe linie.
      % Citim nodul i.
      i = fscanf(fid1, '%d', 1);  
      % Numarul de link-uri detinut de nodul i.
      % Citim numarul de noduri cu care se invecineaza nodul i.
      L = fscanf(fid1, '%d', 1);  
      % Citim nodurile cu care se invecineaza i.
         for j = 1 : L
           nod = fscanf(fid1, '%d', 1);
           % Construim matricea de adiacenta A.
           if nod != i
           A(i,nod) = 1;
           endif
         endfor
     endfor
     val1 = fscanf(fid1, '%f', 1);
     val2 = fscanf(fid1, '%f', 1);
   fclose(fid1);
   
	 fid2 = fopen(nume_out, 'w');
   contor = fprintf(fid2, '%d\n', N);
   % Vectorul PR cu metoda Iterative.
   R1 = Iterative(nume, d, eps);
   for i = 1 : N
   contor = fprintf(fid2, '%f\n', R1(i));
   endfor
   contor = fprintf(fid2, '\n');
   % Vectorul PR cu metoda Algebraic.
   R2 = Algebraic(nume, d);
   for i = 1 : N
   contor = fprintf(fid2, '%f\n', R2(i));
   endfor
   contor = fprintf(fid2, '\n');
   PR1 = R2;
   % Sortare descrescatoare prin interschimbare.
   for i = 1 : N-1
     for j = i + 1 : N
      if PR1(i) < PR1(j)
        Temp = PR1(i);
        PR1(i) = PR1(j);
        PR1(j) = Temp;
       endif
      endfor
    endfor   
   % Se vor afişa N linii de forma:i j F.
   for i = 1 : N
     for j = 1 : N
       if PR1(i) == R2(j)
         contor = fprintf(fid2, '%d ', i);
         contor = fprintf(fid2, '%d ', j);
         break
      endif
    endfor
    % Gradul de apartenenta al paginii, F = u(P R 1 (i)).
    F = Apartenenta(PR1(i), val1, val2);
    contor = fprintf(fid2, '%f\n', F);
   endfor
   fclose(fid2);
  
endfunction