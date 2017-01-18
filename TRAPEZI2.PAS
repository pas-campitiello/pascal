Program Trapezio2;
Uses CRT;
var a,b,c:real;
Function Area (e,f,g:real):real;
var d:real;
begin
d:=((e+f)*g)/2;
writeln('L_area del trapezio Š ',d:5:2);
end;
begin
clrscr;
writeln('Scrivi base maggiore, base minore e altezza separati da uno spazio');
readln(a,b,c);
Area(a,b,c);
readln;
end.