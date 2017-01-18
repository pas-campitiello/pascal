Program ProdottoDiagPrinc;
Uses Crt;
Const Max=10;
Var Dim,i,j:integer;
    M:Array [1..Max,1..Max] of real;
    Prod:real;

Begin
 Clrscr;

 writeln('PROGRAMMA PER IL CALCOLO DEL PRODOTTO DELLA DIAGONALE PRINCIPALE DI UNA MATRICE');
 writeln;
 Repeat
  Write('Dammi il numero delle colonne e delle righe: ');
  Readln(Dim);
  If Dim>Max then Writeln ('Il numero delle righe e delle colonne Š errato, inserire un valore compreso tra 1 e ',Max,':');
 Until (Dim>1) and (Dim<=Max);

 For i:=1 to Dim do
  For j:=1 to Dim do
   Begin
    Write('Dammi il valore di riga ',i,' e di colonna ',j,' : ');
    Readln(M[i,j]);
   End;

 Prod:=1;
 For i:=1 to Dim do
  For j:=1 to Dim do If i=j then Prod:=Prod*M[i,j];

 writeln;
 Writeln ('Il prodotto degli elementi sulla diagonale principale Š: ',Prod:5:2);

 Readln;
End.
