Program Multiplo;
Var a,b,c:integer;
Begin
Writeln('Scrivi un numero');
Readln(a);
Writeln('Scrivi il numero della tabellina');
Readln(b);
c:=a mod b;
writeln;
if c=0 then writeln('Il numero ',a,' Š un multiplo di ',b)
       else writeln('Il numero ',a,' non Š un multiplo di ',b);
readln;
end.
