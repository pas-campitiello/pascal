Program pitagora;
uses CRT;
var ia,ib,ic,c1a,c1b,c1c,c2a,c2b,c2c:real;
    a:char;
begin
clrscr;
writeln('Che cosa vuoi calcolare?');
writeln;
writeln('1 -> ipotenusa');
writeln('2 -> cateto minore');
writeln('3 -> cateto maggiore');
writeln;
readln(a);
case a of
'1':begin
    writeln;
    writeln('Scrivi il valore del primo cateto');
    readln(c1a);
    writeln('Scrivi il valore del secondo cateto');
    readln(c2a);
    ia:=sqrt(sqr(c1a)+sqr(c2a));
    writeln('L_ipotenusa Š uguale a ',ia:0:2);
    end;
'2':begin
    writeln;
    writeln('Scrivi il valore dell_ipotenusa');
    readln(ib);
    writeln('Scrivi il valore del cateto maggiore');
    readln(c2b);
    c1b:=sqrt(sqr(ib)-sqr(c2b));
    writeln('Il cateto minore Š uguale a ',c1b:0:2);
    end;
'3':begin
    writeln;
    writeln('Scrivi il valore dell_ipotenusa');
    readln(ic);
    writeln('Scrivi il valore del cateto minore');
    readln(c1c);
    c2c:=sqrt(sqr(ic)-sqr(c1c));
    writeln('Il cateto maggiore Š uguale a ',c2c:0:2);
    end;
    end;
 readln;
end.
