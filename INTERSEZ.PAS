Program intersezione;
uses CRT;
var m1,q1,m2,q2:integer;
    y,x:real;
begin
clrscr;
writeln('Programma per determinare le coordinate del punto di intersezione');
writeln('di 2 rette nella forma y=m1x+q1 e y=m2x+q2');
writeln('-----------------------------------------------------------------');
write('m1: ');
readln(m1);
write('q1: ');
readln(q1);
write('m2: ');
readln(m2);
write('q2: ');
readln(q2);
writeln;
If m1=m2 then writeln('Le 2 rette sono parallele')
         else
             begin
              writeln('Le 2 rette sono coincidenti');
              x:=(-q1+q2)/(m1-m2);
              y:=m1*x+q1;
              writeln('e il loro punto di intersezione ha le segueni coordinate: (',x:0:2,',',y:0:2,')');
             end;
readln;
end.