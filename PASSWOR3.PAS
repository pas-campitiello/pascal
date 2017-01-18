Program password3;
uses CRT;
var lettminu,lettmaiu:array[1..26] of string;
    i,cifre,numletcaso:integer;
    caso1,caso2,numcaso:real;
begin
clrscr;
for i:=1 to 26 do
 lettminu[i]:=chr(i+96);
for i:=1 to 26 do
 lettmaiu[i]:=chr(i+64);
writeln('- - - - - - - - - - P A S S W O R D  3 - - - - - - - - - -');
writeln('- - - - - - - Generatore di password casuali - - - - - - -');
writeln;
write('Nø cifre della password da generare: ');
readln(cifre);
randomize;
writeln;
write('La password Š: ');
for i:= 1 to cifre do
 begin
  caso1:=random(10);
  if caso1>=5 then
                begin
                 numcaso:=random(10);
                 write(numcaso:0:0);
                end
            else
                begin
                 caso2:=random(10);
                 if caso2>=5 then
                                begin
                                 numletcaso:=random(27);
                                 write(lettminu[numletcaso]);
                                end
                             else
                                begin
                                 numletcaso:=random(27);
                                 write(lettmaiu[numletcaso]);
                                end;
                end;
 end;
readln;
end.

