% Add circuit specification here

type(g1, not1).

in(1,g1,z11).

out(g1,y1).

connected(x1, z11).

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
signal(x1,1).
