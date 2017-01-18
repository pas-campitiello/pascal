Program fattoriale;
Var N:integer;
Nfatt:longint;
Begin
Writeln('Scrivi il numero da fattorializzare');
Readln(N);
Nfatt:=N;
Repeat
N:=N-1;
Nfatt:=Nfatt*N;
Until N=1;
Writeln('Il fattoriale Š= ',Nfatt);
readln;
End.
