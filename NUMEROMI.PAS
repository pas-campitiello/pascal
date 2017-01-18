Program NumeroMinore;
var A:array [1..10] of integer;
    B,MIN:integer;
begin
 for B:=1 to 10 do
    begin
     writeln('Inserire il ',B,'ø numero');
     readln(A[B]);
    end;
 MIN:=A[1];
 for B:=1 to 10 do
    if A[B] < MIN then MIN:=A[B];
 writeln;
 writeln('Numero minore = ', MIN);
 readln;
end.