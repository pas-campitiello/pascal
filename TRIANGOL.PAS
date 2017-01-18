Program Triangolo;
var a,b,c:integer;
begin
writeln('Programma per verificare se un triangolo Š equilatero, isoscele o scaleno');
writeln;
writeln('Scrivi le misure dei lati del triangolo separate da uno spazio');
readln(a,b,c);
writeln;
if (a=b) and (b=c) then writeln('Il triangolo Š equilatero');
if (a=b) and (c<>a) then writeln('Il triangolo Š isoscele');
if (c=b) and (a<>c) then writeln('Il triangolo Š isoscele');
if (a=c) and (b<>a) then writeln('Il triangolo Š isoscele');
if (a<>b) and (b<>c) and (a<>c) then writeln('Il triangolo Š scaleno');
readln;
end.

