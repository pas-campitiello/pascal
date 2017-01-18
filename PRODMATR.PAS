{ Pasquale Campitiello (C) 24/12/2004 }

Program PRODOTTO_matrici;
uses CRT;
type matrice=array[1..5,1..5] of integer;
var c,mat1,mat2:matrice;
    m1,n1,m2,n2:integer;
    k,i,j:integer;

procedure caricamat(var mat:matrice; m,n:integer);
begin
 for i:=1 to m do
  for j:=1 to n do
   begin
    write('Inserisci elemento (',i,',',j,'): ');
    readln(mat[i,j]);
   end;
end;

procedure stampa(mat:matrice; m,n:integer);
begin
 for i:=1 to m do
  begin
   writeln;
   write(' |');
   for j:=1 to n do
    write(mat[i,j]:4);
   write('  |');
  end;
end;

procedure StampaProdotto(matP:matrice);
begin
 for i:=1 to m1 do
  begin
   writeln;
   write(' |');
   for j:=1 to n2 do
    write(matP[i,j]:4);
   write('  |');
  end;
end;

begin
 repeat
  clrscr;
  writeln('* * * * * PROGRAMMA PER IL CALCOLO DEL PRODOTTO DI 2 MATRICI * * * * * *');
  writeln;
  writeln('ORDINI delle 2 MATRICI:');
  writeln('------------------------');
  writeln('1¦ MATRICE - Inserisci numero di righe (m) e di colonne (n) separato da INVIO:');
  readln(m1,n1);
  writeln;
  writeln('2¦ MATRICE - Inserisci numero di righe (m) e di colonne (n) separato da INVIO:');
  readln(m2,n2);
  writeln;
  if n1<>m2 then begin
                  writeln('ATTENZIONE!!!');
                  writeln('Per eseguire correttamente un prodotto fra matrici, il numero di colonne');
                  writeln('della prima matrice deve essere uguale al numero di righe della seconda.');
                  readln;
                 end;
 until n1=m2;
 writeln('--- CARICA 1¦ matrice:');
 caricamat(mat1,m1,n1);
 writeln;
 writeln('--- CARICA 2¦ matrice:');
 caricamat(mat2,m2,n2);
 writeln;
 writeln('--- Le due matrici:');
 stampa(mat1,m1,n1);
 writeln;
 stampa(mat2,m2,n2);
 writeln;
 for i:=1 to m1 do
  for j:=1 to n2 do
   c[i,j]:=(mat1[i,1]*mat2[1,j]) + (mat1[i,2]*mat2[2,j]) +
           (mat1[i,3]*mat2[3,j]) + (mat1[i,4]*mat2[4,j]) +
           (mat1[i,5]*mat2[5,j]);
 writeln;
 writeln('--- PRODOTTO DELLE 2 MATRICI:');
 StampaProdotto(c);
 writeln;
 readln;
end.