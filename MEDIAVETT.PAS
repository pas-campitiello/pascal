Program MediaVettore;
Uses Crt;
Const Max=30;
Var V:ARRAY [1..Max] OF integer;
    Dim,i,Tot:integer;
    Med:real;

Begin
 Clrscr;
 Writeln ('Programma per calcolare il valore medio di un vettore numerico');
 REPEAT
  writeln;
  Write('Inserisci la dimensione del vettore: ');
  Readln (Dim);
  Writeln;
 UNTIL (Dim>=1) AND (Dim<=Max);
 FOR i:=1 TO Dim DO
  Begin
   Write ('Dammi il numero di posizione ',i,': ');
   Readln (V[i]);
  End;
 Tot:=V[1];
 Med:=0;
 FOR i:=2 TO Dim DO Tot:=Tot+V[i];
 Med:=(Tot/Dim);
 Writeln ('La media Š: ',Med:5:2);
 Readln;
End.
