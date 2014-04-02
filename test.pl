belong(a).

(Y1 == 1 ; Y1 == 0),
         (Y2 == 1 ; Y2 == 0),
         (Y3 == 1 ; Y3 == 0),
         (Y4 == 1 ; Y4 == 0),
         (Y5 == 1 ; Y5 == 0),

signal(x1,1).
signal(x2,0).
signal(x3,1).
signal(x4,1).
signal(x5,0).


forall(between(0,1,Y1),
            forall(between(0,1,Y2),
               forall(between(0,1,Y3),
                  forall(between(0,1,Y4),
                     forall(between(0,1,Y5),
                       % (writeln(Y1),writeln(Y2),writeln(Y3),op(L,Y1,Y2,Y3,Y4,Y5))
                       call(op(L),Y1,Y2,Y3,Y4,Y5)
                     )
                  )
               )
            )
         ).