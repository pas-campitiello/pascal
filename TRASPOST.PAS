Program Trasposta;
Uses Crt;
Const Max=10;
Var Dim,i,j:integer;
    M,T:Array [1..Max,1..Max] of real;

Begin
 Clrscr;
 writeln('.: Programma per la visualizzazione di matrice trasposta da una matrice data :.');
 writeln;

 Repeat
  Write('Inserire il numero delle colonne e delle righe: ');
  Readln(Dim);
  If Dim>Max then Writeln('Il numero delle righe e delle colonne Š errato, inserire un valore compreso tra 1 e ',Max,':');
 Until (Dim>1) and (Dim<=Max);

 writeln;
 For i:=1 to Dim do
  For j:=1 to Dim do
   Begin
    Write('Inserire il valore di riga ',i,' e di colonna ',j,' : ');
    Readln(M[i,j]);
   End;

 writeln;
 Writeln('La matrice trasposta Š: ');
 writeln;
 For i:=1 to Dim do
  Begin
   For j:=1 to Dim do
    Begin
     T[i,j]:=M[j,i];
     Write (T[i,j]:10:2);
    End;
   Writeln;
  End;

 Readln;
End.