set P := {"A","B","C","D","E"};

set T := {1 .. 24};
set T_ := {0 .. 24};

param D[T*P] := read "tp2.2023_fresco.dat" as "n+";
param C := 370;

param C_ := 540;
var ter[P*T] binary; #flag de si lo tercerizo 
var L[P*T] integer >= 0 <= 12;
var S[P*T_] integer >= 0;
var U[P*T] integer >= 0;

var F[P*T] >= 0; #unidades tercerizadas


minimize costo_total: sum <p,t> in P*T: (L[p,t] * 10 * C + F[p,t] * C_);

subto unidades: 
    forall <p,t> in P*T: 
        U[p,t] == L[p,t] * 10;

subto stock:
    forall <p,t> in P*T:
        S[p,t] == S[p,t-1] + L[p,t] * 10 + F[p,t] - D[t,p];

subto stock_inicial:
    forall <p> in P:
        S[p,0] == 0;

subto stock_max:
    forall <t> in T:
        (sum <p> in P: S[p,t]) <= 900;

subto limite_unidades:
    forall <t> in T:
        (sum <p> in P: U[p,t]) <= 300;

subto limite_uni_tercerizado:
    forall <p_,t> in P*T:
        (sum <p> in P: F[p,t]) <= 200 *ter[p_,t];

subto tercerizar_min:
    forall <p,t> in P*T:
        F[p,t] >= 20 * ter[p,t];
