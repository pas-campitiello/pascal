Program matrice5;
uses CRT;
var i,j,m,n:integer;
    matrice:array[1..10,1..10] of integer;
    vettappoggio:array[1..10] of integer;
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
for i:=1 to 10 do
 begin
  vettappoggio[i]:=matrice[2,i];
  matrice[2,i]:=matrice[3,i];
  matrice[3,i]:=vettappoggio[i];
 end;
writeln('Matrice aggiornata (scambiati gli elementi della riga 2 con la riga 3):');
for i:=1 to m do
 for j:=1 to n do
  begin
   write(matrice[i,j]:4);
   if j=n then writeln;
  end;
readln;
end.