Program esadecimale;
uses CRT;
var n,R:integer;
begin
clrscr;
write('Scrivi il numero in base 10: ');
readln(n);
write('CIFRE: ');
While n<>0 do
 begin
  R:=n mod 16;
  n:=n div 16;
  If R<10 then write(R)
          else
              begin
               If r=10 then write('A');
               If r=11 then write('B');
               If r=12 then write('C');
               If r=13 then write('D');
               If r=14 then write('F');
               If r=15 then write('G');
              end;
 end;
writeln;
writeln('Le cifre prese in ordine dall''ultima alla prima danno il numero in esadecimale');
readln;
end.