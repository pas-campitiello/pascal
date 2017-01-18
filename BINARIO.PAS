Program Rappresentazione_binaria_di_un_numero_in_base_10;
uses CRT;
Var N,Q,R,K:integer;
Begin
clrscr;
Writeln('_________Rappresentazione binaria di un numero in base 10_________');
Writeln;
Writeln('Scrivere il numero in base 10');
Readln(N);
writeln;
K:=0;
While N>0 do
      begin
      Q:=N div 2;
      R:=N mod 2;
      Writeln('Cifra numero',K,'=',R);
      N:=Q;
      K:=K+1;
      end;
      Writeln;
      Writeln('Le cifre prese in ordine dall_ultima alla prima danno il corrispondente binario del numero base10 inserito');
readln;
End.

