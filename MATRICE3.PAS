Program matrice3;
uses CRT;
var r,c,i,j,m,n:integer;
    matrice:array[1..10,1..10] of integer;
begin
clrscr;
writeln('Inserisci il nø delle righe e delle colonne della matrice (max 10)');
writeln('(separati da un INVIO):');
readln(m,n);
writeln;
for i:=1 to m do
 for j:=1 to n do
  begin
   write('Elemento di riga ',i,' e colonna ',j,': ');
   readln(matrice[i,j]);
  end;
writeln;
writeln('Inserisci riga e colonna dell''elemento da azzerare (separati da un INVIO)');
readln(r,c);
matrice[r,c]:=0;
writeln;
writeln('Matrice aggiornata:');
for i:=1 to m do
 for j:=1 to n do
  begin
   write(matrice[i,j]:3);
   if j=n then writeln;
  end;
readln;
end.


