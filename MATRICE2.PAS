Program matrice2;
uses CRT;
var s,i,j,n:integer;
    matrice:array[1..10,1..10] of integer;
begin
clrscr;
write('Inserisci il nø d''ordine della matrice (max 10): ');
readln(n);
writeln;
for i:=1 to n do
 for j:=1 to n do
  begin
   write('Elemento di riga ',i,' e colonna ',j,': ');
   readln(matrice[i,j]);
  end;
writeln;
s:=0;
for i:=1 to n do
 for j:=1 to n do
  if i=j then s:=s+matrice[i,j];
writeln('La somma dei numeri nella diagonale principale della matrice Š ',s);
readln;
end.