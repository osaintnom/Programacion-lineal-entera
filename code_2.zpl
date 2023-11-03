set P := {"A","B","C","D","E"};

set T := {1 .. 24};
set T_ := {0 .. 24};

param D[T*P] := read "tp2.2023_fresco.dat" as "n+";
param C := 370;

var L[P*T] integer >= 0 <= 12;
var S[P*T_] integer >= 0;
# var U[P*T] integer >= 0;


minimize costo_total: sum <p,t> in P*T: L[p,t] * 10 * C;

# subto unidades: 
#     forall <p,t> in P*T: 
#         U[p,t] == L[p,t] * 10;

subto stock:
    forall <p,t> in P*T:
        S[p,t] == S[p,t-1] + L[p,t] * 10 - D[t,p];

subto stock_inicial:
    forall <p> in P:
        S[p,0] == 0;

subto stock_max:
    forall <t> in T:
        sum <p> in P: S[p,t] <= 900;

subto limite_unidades:
    forall <t> in T:
        (sum <p> in P: L[p,t] * 10) <= 300;
        # sum <p> in P: L[p,t] * 10 <= 300;
