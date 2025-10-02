Task 1 --> Markov is coming...

1) parse_labyrinth.m

Citesc numarul de linii si coloane ale matricei, urmate de elementele sale
coloana cu coloana, astfel ca la final trebuie sa transpunem matricea Labyrinth
pentru a avea dimensiunea m x n.

2) get_adjacency_matrix.m

Initializez matricea adjuncta cu zerouri, mai putin ultimele 2 elemente ale
diagonalei principale care vor fi 1. Dupa initializare, stabilesc tranzitiile
dintre 2 stari iterand prin matricea Labyrinth, si actualizez matricea
adjuncta folosind 2 variabile auxiliare : cu variabila nr contruiesc matricea
propriu-zisa, iar cu crt_elem verific daca exista posibilitatea deplasarii din
elementul curent spre cele 4 directii prezentate in enunt. La final, utilizez
functia sparse pt a salva aceasta matrice sub forma unei matrice rare.

3) get_link_matrix.m

Fac acelasi lucru ca la functia de mai sus, numai ca in loc de a stabili
tranzitiile dintre 2 stari, determin probabilitatea ca un element sa treaca
dintr-o celula in alta. La final, utilizez din nou functia sparse pt a salva
matricea sub forma unei matrice rare.

4) get_Jacobi_parameters.m

Matricea G este matricea corespunzatoare probabilitatilor din Link cu
dimensinea Labyrinth, iar matricea c este matricea-coloana a WIN-urilor din
matricea Link.

5) perform_iterative.m

Aici se aplica Metoda Jacobi clasica, tinandu-se minte si numarul de pasi.

6) heuristic_greedy.m

Mai intai, Initializez un vector coloana care retine celulele vizitate
anterior. Pentru ca intotdeauna vom avea o solutie, nu vom iesi din loop pana
nu o gasim. Asadar, tin minte ultima pozitie din calea catre solutie, verific
daca ma aflu la un WIN, si astfel ies din loop-ul infinit, iar in caz contrar
caut elementele in care pot sa ma misc si il aleg pe cel cu probabilitatea cea
mai mare de a duce la un WIN. Daca am ajuns la final si tot nu am gasit
WIN-ul, sterg ultimul element din path, iar altfel actualizez vectorul de
elemente vizitate si vectorul unde tin minte calea catre solutie.

7) decode_path.m

In aceasta functie, contruiesc mai intai matricea initiala cu toate valorile
de la 1 la m * n (dimensiunea matricii Labyrinth), dupa care initializez
matricea drumului decodat ce contine 2 inidici pentru linie si coloana si
iterez prin matricea initiala pana ajung la elemntele matricii path (anterior
calculata), care contine solutia iesirii din labirint.


Task 2 --> Linear Regression

1) parse_data_set_file.m

Prima oara citesc din fisier m si n si initializez cele 2 matrice, dupa care
ma folosesc de structura fisierului pentru a citi cele (m + 1) * n elemente,
linie cu linie in urmatorul fel : primul va fi intotdeauna elementul matricei
Y, urmat de un numar intreg, 14 numere reale si cuvinte pana la antepenultimul
element exclusiv. Acesta este un numar intreg, penultimul este din nou cuvant
iar pentru ultimul determin daca este cuvant sau numar real.

2) prepare_for_regression.m

In aceasta functie construiesc matricea pe masura ce iterez prin matricea
initiala, si ma folosesc de faptul ca "semi-furnished, "unfurnished" si
"furnished" pot aparea o singura data doar la finalul matricei. Variabila
auxiliara found determina daca ultimul element de pe fiecare linie a matricei
initiale este sir de caractere sau cuvant, si modifica matricea FeatureMatrix
corespunzator.

3) linear_regression_cost_function

Implementez functia descrisa (la pagina 15) in enunt, considerandu-le pe Theta0
si pe Epsilon ca fiind 0.

4) parse_csv_file.m

Trec peste prima linie din fisier intrucat ea este irelevanta. Cat timp nu am
citit tot fisierul, citesc urmatoarea linie, scot toate virgulele si
construiesc cele 2 matrice avand grija sa verific daca elementul curent este
cuvant sau numar.

5) gradient_descent.m

La fiecare iteratie construiesc matricea h0 ca fiind o suma de produse exact
cum a fost definita in enunt (x * theta). Dupa aceea, construiesc vectorul
gradientului functiei de cost folosindu-ma de formula din enunt si de matricea
h0. La final, actualizez matricea si dupa ce termin iteratiile adaug un 0 la
inceputul lui Theta.

6) normal_equation.m

Trebuie sa rezolv ecuatia (X^T * X) * Theta = X^T * Y, adica A * x = b, deci
initializez cele 2 matrice A si b si cei 2 vectori r si v. In continuare, aplic
exact algoritmul descris in enunt si atunci cand am iesit din loop adaug un 0
la inceputul lui Theta.

7) lasso_regression_cost_function.m

Prima data construiesc suma de la final, adica norma 1 a lui Theta. Dupa aceea,
aplic algoritmul descris in enunt, calculand fiecare h0 si acutalizand eroarea.

8) ridge_regression_cost_function.m

Analog ca la functia lasso de mai sus calculez norma 2 a lui Theta si aplic
algoritmul descris in enunt, calculand fiecare h0 si actualizand eroarea.


Task3 --> MNIST 101

1) load_dataset.m

Folosesc functia load.

2) split_dataset.m

Folosesc functia randperm pentru a genera o permutare la intamplare astfel
amestecand toate exemplele, dupa care construiesc matricele de training si de
testing folosind procentul, exact ca in enunt.

3) initialize_weights.m

Initializez functia cu valori random intre (0; 2 * epsilon), unde epsilon este
dat de formula din enunt si pentru a avea valorile intre (-epsilon; epsilon)
voi scadea din aceste valori un epsilon.

4) cost_function.m

Prima oara il initializez pe a1 folosind functia ones. Dupa aceea, dau reshape
la Theta1 si Theta2 tinand cont de dimensiuni (exact ca in enunt) si aplic
algoritmul de forward propagation. Astfel, voi initializa o noua matrice care
pune cate un 1 in matricea I_10 pe randul corespunzator fiecarei valori
initiale din y. In continuare, pentru ca checker-ul sa nu isi ia timeout, voi
aplica o abordare vectoriala asupra formulelor din enunt : in loc de cateva
for-uri, voi calcula J-ul folosind sum(sum()), care calculeaza suma tuturor
elementelor unei matrice. De asemenea, voi face produsul pe elemente pentru
matricea etichetelor si matricea log(a3) (respectiv matricelor 1 - matricea
etichetelor si log(1 - a3)) pentru a eficientiza problema. In continuare, voi
adauga suma patratelor elementelor lui Theta1 si Theta2 inmultime cu
lambda / (2 * m). In final, aplic backpropagation, iar pentru a nu avea
confuzii intre delta mare si delta mic, voi nota pe delta mic cu Gamma si
numarul respectiv. Inainte de a returna gradientii, aduna la Delta1 si Delta 2,
pentru j > 1, (lambda / m) * Theta_ij, adica toate elementele lui Theta1 si
Theta2 mai putin cele de pe coloana 1, unde m in cazul nostru este size_X.

5) predict_classes.m

Construiesc Theta1 si Theta2 si aplic algoritmul de forward propagation exact
ca la functia cost_function de mai sus. Dupa aceea, determin maximul de pe
fiecare coloana a lui a3 si pun indicele coloanei in vectorul de clase.