Program potenza4;
uses CRT;
var base,esp:integer;
function calcolapotenza(b,e:integer):integer;
var c,p:integer;
 begin
  if e=1 then writeln('La potenza con esponente 1 Š uguale alla base stessa')
         else
             begin
              p:=base*base;
              for c:= 1 to (e-2) do p:=p*base;
             end;
  calcolapotenza:=p;
 end;
begin
clrscr;
writeln('=========== POTENZA 4: programma per il calcolo di una potenza ===========');
writeln;
write('Base: ');
readln(base);
write('Esponente: ');
readln(esp);
writeln;
writeln('La potenza ',base,'^',esp,' Š uguale a ',calcolapotenza(base,esp));
readln;
end.
