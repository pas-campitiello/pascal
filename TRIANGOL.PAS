Program Triangolo;
var a,b,c:integer;
begin
writeln('Programma per verificare se un triangolo � equilatero, isoscele o scaleno');
writeln;
writeln('Scrivi le misure dei lati del triangolo separate da uno spazio');
readln(a,b,c);
writeln;
if (a=b) and (b=c) then writeln('Il triangolo � equilatero');
if (a=b) and (c<>a) then writeln('Il triangolo � isoscele');
if (c=b) and (a<>c) then writeln('Il triangolo � isoscele');
if (a=c) and (b<>a) then writeln('Il triangolo � isoscele');
if (a<>b) and (b<>c) and (a<>c) then writeln('Il triangolo � scaleno');
readln;
end.

