use_module(library(clpfd)).

% Circuit specification

type(g1, and1).
type(g2, and1).
type(g3, or1).
type(g4, or1).
type(g5, not1).

in(1,g1,x11).
in(2,g1,x12).
in(1,g2,x21).
in(2,g2,x22).
in(1,g3,x31).
in(2,g3,x32).
in(1,g4,x41).
in(2,g4,x42).
in(1,g5,x51).

out(g1,y1).
out(g2,y2).
out(g3,y3).
out(g4,y4).
out(g5,y5).

connected(x1, x11).
connected(x2, x12).
connected(x3, x21).
connected(x4, x22).
connected(y2, x31).
connected(x5, x32).
connected(y1, x41).
connected(y3, x42).
connected(y4, x51).

% signal(x1,1).
% signal(x2,1).
% signal(x3,1).
% signal(x4,1).
% signal(x5,1).

% Rules

signal(X,1) :- out(Gate, X),
               type(Gate, and1),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               signal(Terminal1, 1),
               signal(Terminal2, 1).

signal(X,1) :- out(Gate, X),
               type(Gate, or1),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               ( signal(Terminal1, 1) ; signal(Terminal2, 1) ).

signal(X,1) :- out(Gate, X),
               type(Gate, not1),
               in(1, Gate, Terminal1),
               signal(Terminal1, 0).

signal(X,1) :- out(Gate, X),
               type(Gate, xor1),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               signal(Terminal1, Terminal1_Value),
               signal(Terminal2, Terminal2_Value),
               Terminal1_Value \= Terminal2_Value.

signal(X,0) :- \+ signal(X,1).

signal(Y,Z) :- connected(X,Y), signal(X,Z).

% check(y5,L,Y1,Y2,Y3,Y4,Y5) :- signal

op(L) :- (Y1 == 1 ; Y1 == 0),
         (Y2 == 1 ; Y2 == 0),
         (Y3 == 1 ; Y3 == 0),
         (Y4 == 1 ; Y4 == 0),
         (Y5 == 1 ; Y5 == 0),
         signal(x1,Y1),
         signal(x2,Y2),
         signal(x3,Y3),
         signal(x4,Y4),
         signal(x5,Y5),
         signal(y5,L),
         nl, fail.