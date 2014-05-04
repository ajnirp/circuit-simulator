% Add circuit specification here

type(g1, xor1).
type(g2, xor1).
type(g3, not1).
type(g4, not1).
type(g5, and1).

in(1,g1,z11).
in(2,g1,z12).
in(1,g2,z21).
in(2,g2,z22).
in(1,g3,z31).
in(1,g4,z41).
in(1,g5,z51).
in(2,g5,z52).

out(g1,y1).
out(g2,y2).
out(g3,y3).
out(g4,y4).
out(g5,y5).

connected(x1, z11).
connected(x5, z12).
connected(x2, z21).
connected(x4, z22).
connected(y1, z31).
connected(y2, z41).
connected(y3, z51).
connected(y4, z52).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Rules

signal(X,1) :- out(Gate, X),
               type(Gate, and1),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               signal(Terminal1, 1),
               signal(Terminal2, 1).

signal(X,1) :- out(Gate, X),
               type(Gate, and3),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               in(3, Gate, Terminal3),
               signal(Terminal1, 1),
               signal(Terminal2, 1),
               signal(Terminal3, 1).

signal(X,1) :- out(Gate, X),
               type(Gate, or1),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               ( signal(Terminal1, 1) ; signal(Terminal2, 1) ).

signal(X,1) :- out(Gate, X),
               type(Gate, or10),
               in(1, Gate, Terminal1),
               in(2, Gate, Terminal2),
               in(3, Gate, Terminal3),
               in(4, Gate, Terminal4),
               in(5, Gate, Terminal5),
               in(6, Gate, Terminal6),
               in(7, Gate, Terminal7),
               in(8, Gate, Terminal8),
               in(9, Gate, Terminal9),
               in(10, Gate, Terminal10),
               ( signal(Terminal1, 1) ; signal(Terminal2, 1) ; signal(Terminal3, 1) ; signal(Terminal4, 1) ; signal(Terminal5, 1) ; signal(Terminal6, 1) ; signal(Terminal7, 1) ; signal(Terminal8, 1) ; signal(Terminal9, 1) ; signal(Terminal10, 1) ).

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

%signal(X,0) :- out(Gate, X),
%               type(Gate, and1),
%               in(1, Gate, Terminal1),
%               in(2, Gate, Terminal2),
%               ( signal(Terminal1, 0) ; signal(Terminal2, 0) ).
%
%signal(X,0) :- out(Gate, X),
%               type(Gate, or1),
%               in(1, Gate, Terminal1),
%               in(2, Gate, Terminal2),
%               signal(Terminal1, 0),
%               signal(Terminal2, 0).
%
%signal(X,0) :- out(Gate, X),
%               type(Gate, not1),
%               in(1, Gate, Terminal1),
%               signal(Terminal1, 1).
%
%signal(X,0) :- out(Gate, X),
%               type(Gate, xor1),
%               in(1, Gate, Terminal1),
%               in(2, Gate, Terminal2),
%               signal(Terminal1, Terminal1_Value),
%               signal(Terminal2, Terminal2_Value),
%               Terminal1_Value == Terminal2_Value.

signal(Y,Z) :- connected(X,Y), signal(X,Z).