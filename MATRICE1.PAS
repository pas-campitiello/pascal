Program matrice1;
uses CRT;
var i,j,m,n:integer;
    matrice:array[1..10,1..10] of integer;
begin
clrscr;
writeln('Inserisci il n� delle righe e delle colonne della matrice (max 10)');
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
writeln('RIGA 2: ');
for i:=1 to n do write(' ',matrice[2,i]);
writeln;
writeln;
writeln('COLONNA 3: ');
for i:=1 to m do writeln(matrice[i,3]);
readln;
end.

