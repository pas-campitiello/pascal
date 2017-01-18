Program AREEePERIMETRI;
uses CRT;
var a:real;
b,c,d:integer;
Procedure triangolo;
begin
writeln;
writeln('Scrivi base e altezza separati da uno spazio');
readln(b,c);
a:=(b*c)/2;
d:=b*3;
writeln('L_area del tringolo equilatero Š ',a:5:2);
writeln('Il perimetro del triangolo equilatero Š ',d);
end;
Procedure Quadrato;
begin
writeln;
writeln('Scrivi il lato del quadrato');
readln(b);
a:=sqr(b);
d:=b*4;
writeln('L_area del quadrato Š ',a:5:2);
writeln('Il perimetro del quadrato Š ',d);
end;
Procedure Rettangolo;
begin
writeln;
writeln('Scrivi base e altezza separati da uno spazio');
readln(b,c);
a:=b*c;
d:=(b+c)*2;
writeln('L_area del rettangolo Š ',a:5:2);
writeln('Il perimetro del rettangolo Š ',d);
end;
begin
clrscr;
writeln('___Programma per calcolare area e perimetro di una figura___');
writeln;
writeln('Scrivi il numero della figura di cui vuoi calcolare area e perimetro:');
writeln;
writeln('     _________________________MENU DI SCELTA');
writeln('     1  Triangolo equilatero');
writeln('     2  Quadrato');
writeln('     3  Rettangolo');
writeln;
readln(d);
case d of
1:triangolo;
2:quadrato;
3:rettangolo;
end;
readln;
end.
