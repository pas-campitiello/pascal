Program trasforma;
uses crt,dos;
var conta,num,k,risult1,base:longint;
    vet:array [1..1000] of integer;
    scelta:char;

Begin
 repeat
  clrscr;
  k:=0;
  Write ('Inserire un numero in base 10: ');
  Readln(num);
  Writeln;writeln;
  repeat
   write ('Inserire la base nel quale lo si vuole trasformare (2-16): ');
   readln(base);
   if (base<2) or (base>16) then
                                begin
                                 sound (500);
                                 delay (200);
                                 nosound;
                                end;
  until (base>=2) and (base<=16);
  risult1:=num;
  repeat
   k:=k+1;
   vet[k]:=(risult1) mod (base);
   risult1:=(risult1) div (base);
  until risult1<1;
  k:=k+1;
  writeln;writeln;
  write ('Il numero ',num,' in base ',base,' Š: ');
  textcolor (white);
  if base<10 then
                 repeat
                   k:=k-1;
                   write (vet[k]);
                 until k=1
             else
                 repeat
                  k:=k-1;
                  if vet[k]=10 then write ('A');
                  if vet[k]=11 then write ('B');
                  if vet[k]=12 then write ('C');
                  if vet[k]=13 then write ('D');
                  if vet[k]=14 then write ('E');
                  if vet[k]=15 then write ('F');
                  if vet[k]<10 then write (vet[k]);
                 until k=1;
   textcolor (7);
   writeln;writeln;
   write ('Si desidera terminare (S/N)? ');
   scelta:=readkey;
  until (upcase(scelta)='S');
end.

