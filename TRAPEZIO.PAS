Program Trapezio;
uses CRT;
var a:real;
b,c,d:integer;
Procedure area;
begin
a:=((b+c)*d)/2;
end;
Procedure dati;
begin
writeln('______________AREA DI UN TRAPEZIO______________');
writeln;
writeln('Scrivi la base maggiore, la base minore e l_altezza separati da uno spazio:');
readln(b,c,d);
end;
Procedure output;
begin
writeln('L_area del trapezio Š ',a:5:2);
end;
begin
clrscr;
dati;
area;
output;
readln;
end.