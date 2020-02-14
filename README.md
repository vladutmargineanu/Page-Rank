# Page-Rank
Homeworks for the Numerical Methods course @ ACS, UPB

# Algorithm

  In rezolvarea temei, am efectuat cele 5 functii, si anume: PageRank, Iterative, GramSchmidt, Apartenenta, Algebraic. 
  Prima functie Iterative calculeaza matricea R folosind algoritmul iterativ. Citesc pentru fiecare lista de adiacenta elementele pe linie. Citim numarul de noduri cu care se invecineaza nodul i. Retinem numarul de link-uri pentru fiecare pagina. Citim nodurile cu care se invecineaza i. Construim matricea de adiacenta A si matricea M. Calculam factorul R (vectorul), iterativ. Algoritmul se opreşte când se atinge pentru valoarea unui eps (precizia). 
  Functia Algebraic calculeaza vectorul PageRank folosind varianta algebrica de calcul. Calculam inversa unei matrici prin factorizare Gram-Schmidt si rezolvam un sistem triunghiular superior (SST). Pentru a calcula inversa unei matrici, folosesc algoritmul Gram-Schmidt (de factorizare QR). Apoi pentru a afla  T^(-1) rezolv sistemul (T · x I = e) pentru fiecare i in parte, folosind algoritmul Gram-Schmidt optimizat (T = Q · R). Pe baza matricilor Q şi R rezolv apoi cele n sisteme de ecuaţii.
  Functia Apartenenta calculeaza a si b pe baza valorilor val1 si val2, astfel incat functia sa fie continua. Funcţia indică gradul de apartenenţă al paginii a cărui PageRank este x la mulţimea paginilor importante.
  In functia PageRank, calculez vectorul R1 cu metoda Iterative si R2 cu metoda Algebraic. Apoi sortez descrescator prin interschimbare in PR1 pe R2 si calculez pentru fiecare pagina, gradul de apartenenta F.
