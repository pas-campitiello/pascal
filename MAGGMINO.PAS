Program Maggiore_Minore;
uses CRT;
var A:array[1..10] of real;
    I:integer;
    Min,Mag:real;

begin
 clrscr;

 for I:=1 to 10 do
 begin
  writeln('Scrivi il ',I,'� numero');
  readln(A[I]);
 end;

 Min:=A[1];
 for I:= 2 to 10 do if A[I] < MIN then MIN:=A[I];
 writeln('Il numero minore �: ',Min:0:2);

 Mag:=A[1];
 for I:= 2 to 10 do if A[I] > Mag then Mag:=A[I];
 writeln('Il numero maggiore �: ',Mag:0:2);

 readln;
end.
