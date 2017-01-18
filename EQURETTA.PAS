Program EquazioneRetta;
uses CRT;
var a,b,c,x1,y1,x2,y2:real;
begin
clrscr;
writeln('Programma per determinare l''equazione di una retta passante per 2 punti:');
writeln('A(x1,y1) e B(x2,y2)');
writeln;
write('x1 = ');
readln(x1);
write('y1 = ');
readln(y1);
write('x2 = ');
readln(x2);
write('y2 = ');
readln(y2);
a:=y2-y1;
b:=x1-x2;
c:=x2*y1-x1*y2;
writeln('L''equazione della retta Š: ');
write(a:8:2,'x');
if b>=0 then write (' + ',b:0:2,'y') else write (' ',b:0:2,'y');
if c>=0 then write (' + ',c:0:2,' = 0') else write (' ',c:0:2,' = 0');
readln;
end.