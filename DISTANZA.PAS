Program distanza;
uses cRT;
var x1,y1,x2,y2:real;
function calcoladistanza(a1,b1,a2,b2:real):real;
 begin
  calcoladistanza:=sqrt(sqr(a1-a2)+sqr(b1-b2));
 end;
begin
clrscr;
write('PRIMO PUNTO - x1: ');
readln(x1);
write('PRIMO PUNTO - y1: ');
readln(y1);
write('SECONDO PUNTO - x2: ');
readln(x2);
write('SECONDO PUNTO - y2: ');
readln(y2);
writeln;
writeln('La distanza tra i due punti Š ',calcoladistanza(x1,y1,x2,y2):5:5);
readln;
end.
