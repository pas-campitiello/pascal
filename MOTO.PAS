Program Spazi;
uses CRT;
var nome:string;
    spazio,veloc:real;
    secondi:integer;
begin
clrscr;
secondi:=0;
writeln('Scrivi il nome del mezzo: ');
read(nome);
writeln('Scrivi la velocit… costante del mezzo (m/s): ');
read(veloc);
writeln;
writeln('MEZZO: ',nome);
writeln(' SECONDI   SPAZIO');
repeat
secondi:=secondi+1;
spazio:=veloc * secondi;
if secondi<>10 then writeln(' ',secondi,'          ',Spazio:6:2)
               else writeln(' ',secondi,'         ',Spazio:6:2);
until secondi=10;
readln;
readln;
end.
