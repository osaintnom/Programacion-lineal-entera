# "tp.2023.dat"
# Mes	Producto A	Producto B	Producto C	Producto D	Producto E
# Ene/24	20	30	10	15	15
# Feb/24	25	40	15	20	15
# Mar/24	30	40	15	20	20
# Abr/24	40	45	20	20	25
# May/24	60	90	30	45	70
# Jun/24	100	140	50	70	100
# Jul/24	180	210	90	105	150
# Ago/24	210	250	105	125	160
# Sep/24	150	170	75	85	140
# Oct/24	60	60	30	30	70
# Nov/24	30	40	15	20	40
# Dic/24	20	25	10	15	20
# Ene/25	20	30	10	15	15
# Feb/25	25	40	15	20	15
# Mar/25	30	40	15	20	20
# Abr/25	40	45	20	20	25
# May/25	60	90	30	45	70
# Jun/25	100	140	50	70	100
# Jul/25	180	210	90	105	150
# Ago/25	210	250	105	125	160
# Sep/25	150	170	75	85	140
# Oct/25	60	60	30	30	70
# Nov/25	30	40	15	20	40
# Dic/25	20	25	10	15	20

# $P = \{A, B, C, D, E, F\}$ Producto
# $D_{pt} = $ Demanda del Producto $P$ en el Tiempo $T$
# $L_{pt} \in \mathbb{Z}, \forall p \in P, \forall t \in T$
# $L_{pt} = $ Lotes fabricados del Producto $P$ en el Tiempo $T$ $\{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12\}$
# $L_{pt} >= 0$
# $L_{pt} <= 12$
# $U_{pt} = L_{pt} * 10$
# $S_{pt} = $ Stock del Producto $P$ en el Tiempo $T$
# $S_{pt} = S_{p(t-1)} + U_{pt} - D_{pt}$
# $S_{pt} >= 0$
# $\sum_{t \in T} \sum_{p \in P} S_{pt} <= 900$
# $U_t = $ Sumatoria de $U_{pt}$ para cada $P$ en el Tiempo $T <= 120$
# $U_t = \sum_{p \in P} U_{pt} \leq 120$
# $min \sum_{p \in P} \sum_{t \in T} U_{pt} * 370$



set P := {"A","B","C","D","E"};
#{ read "tp2.2023.dat" as "<2s,3s,4s,5s,6s>" use 1 };

set T := {1 .. 24};
#{ read "tp2.2023.dat" as "<1s>" skip 1 };

param D[P*T] := read "tp2.2023_fresco.dat" as "n+";
param C := 370;

var L[P*T] integer >= 0 <= 12;
var U[P*T] integer >= 0;
var S[P*T] integer >= 0;

minimize costo_total: sum <p,t> in P cross T: U[p,t] * C;

subto unidades: 
    forall <p,t> in P cross T: 
        U[p,t] == L[p,t] * 10;

subto demanda:
    forall <p,t> in P*T with t>1:
        S[p,t] == S[p,t-1] + U[p,t] - D[p,t];

subto stock:
    forall <p,t> in P cross T:
        S[p,t] >= 0;

subto stock_max:
    forall <t> in T with t>1:
        sum <p,ti> in P*{1..t-1}: S[p,ti] <= 900;
    #forall <p,t> in P*T:
    #    S[p,t] <= 900;

subto produccion_max:
    forall <p,t> in P*T:
        U[p,t] <= 120;
