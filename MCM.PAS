Program mcm;
uses crt;
var i,n,m:integer;
    vet:array[1..5] of integer;

procedure carica;
begin
 for i:=1 to n do
  begin
   write(i,'ø numero: ');
   readln(vet[i]);
  end;
end;

function mag(x:integer):integer;
var m:integer;
begin
 m:=0;
 for i:=1 to x do
  if vet[i]>m then m:=vet[i];
 mag:=m;
end;

function CalMCM (y:integer):longint;
var m:longint;
    cont:integer;
begin
 m:=y;
 repeat
  cont:=0;
  for i:=1 to n do
   begin
    if (m mod vet[i])=0 then cont:=cont+1;
   end;
  if cont<>n then m:=m+y;
 until cont=n;
 CalMCM:=m;
end;

begin
 repeat
  clrscr;
  writeln('     --- Programma per il calcolo del Minimo Comune Multiplo ---');
  writeln;
  write('Di quanti numeri vuoi calcolare il mcm (max=5)? ');
  readln(n);
 until (n<=5) and (n<>1);
 carica;
 writeln;
 m:=mag(n);
 writeln('Mcm = ',CalMCM(m));
 readln;
end.