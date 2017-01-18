Program matrice4;
uses CRT;
var s,i,j,m,n:integer;
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
s:=0;
for i:=1 to m do
 for j:=1 to n do s:=s+matrice[i,j];
writeln('La somma dei componenti della matrice Š ',s);
readln;
end.