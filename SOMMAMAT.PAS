Program somma_matrici;
uses CRT;
type matrice=array[1..3,1..3] of integer;
var c,mat,mat2:matrice;
    i,j,k:integer;

procedure caricamat(var m:matrice);
begin
 for i:=1 to 3 do
  for j:=1 to 3 do
   begin
    write('Inserisci elemento (',i,',',j,'): ');
    readln(m[i,j]);
   end;
end;

procedure stampa(m:matrice);
begin
 for i:=1 to 3 do
  begin
   writeln;
   write(' |');
   for j:=1 to 3 do
    write(m[i,j]:3);
   write('  |');
  end;
end;

procedure stampa2(m,m2,m3:matrice);
begin
 for k:=1 to 3 do
  begin
   writeln;
   write(' |');
   for j:=1 to 3 do
    write(m[k,j]:3);
   write('  |');
   if k=1 then write(' +')
          else write('  ');
   write(' |');
   for j:=1 to 3 do
    write(m2[k,j]:3);
   write('  |');
   if k=1 then write(' = ')
          else write('   ');
   write(' |');
   for j:=1 to 3 do
    write(m3[k,j]:3);
   write('  |');
  end;
end;

begin
 clrscr;
 writeln('* * * PROGRAMMA PER LA SOMMA DI 2 MATRICI (ordine massimo 3) * * *');
 writeln;
 writeln('--- CARICA 1¦ matrice:');
 caricamat(mat);
 writeln;
 writeln('--- CARICA 2¦ matrice:');
 caricamat(mat2);
 writeln;
 writeln('--- Le due matrici:');
 stampa(mat);
 writeln;
 stampa(mat2);
 writeln;
 for i:=1 to 3 do
  for j:=1 to 3 do
   c[i,j]:=mat[i,j]+mat2[i,j];
 writeln;
 writeln('--- SOMMA DELLE 2 MATRICI:');
 stampa2(mat,mat2,c);
 writeln;
 readln;
end.