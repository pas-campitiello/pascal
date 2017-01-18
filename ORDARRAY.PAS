Program OrdArray;
Uses crt;
Const Max=10;
Var V:Array [1..Max] of real;
    i,j,Dim:integer;
    Appoggio:real;

Begin
 Clrscr;
 writeln('       ::: PROGRAMMA PER L''ORDINAMENTO DI UN VETTORE :::');
 writeln;

 Repeat
  Write('Inserire la dimensione del vettore: ');
  Readln(Dim);
  Writeln;
  If Dim>Max then Writeln('Valore errato, inserire un valore compreso fra 1 e ',Max, ':');
 Until (Dim>=1) and (Dim<=Max);

 For i:=1 to Dim do
  Begin
   Write('Inserire l''elemento di posizione ',i,': ');
   Readln(V[i]);
  End;

 For i:=1 to Dim-1 do
  For j:=i+1 to Dim do
   If V[i]>V[j] then
    Begin
     Appoggio:=V[i];
     V[i]:=V[j];
     V[j]:=Appoggio;
    End;

 writeln;
 Writeln('Il vettore ordinato Š: ');
 For i:=1 to Dim do Write(V[i]:1:2,'  ');

 Readln;
End.

