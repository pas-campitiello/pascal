Program rigori;
uses CRT;
var a,b:integer;
    c:char;
begin
repeat
clrscr;
writeln('_____________________________');
writeln('| 0          2           4  |');
writeln('|                           |');
writeln('| 1          3           5  |');
writeln;
writeln('Dove vuoi tirare il pallone?');
readln(a);
randomize;
b:=random(7);
if a=b then Writeln('Parata!!!')
       else writeln('GOAL!!!');
writeln('Vuoi giocare ancora (s/n)?');
readln(c);
until c='n';
writeln;
writeln('-- G  A  M  E   O  V  E  R --');
readln;
end.
