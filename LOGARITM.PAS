Program logaritmi;
uses CRT;
var b,z:integer;
    pot,c,a:real;

function potenza(x,y:real):real;
var p:real;
begin
 p:=exp(y*ln(x));
 potenza:=p;
end;

procedure intestazione;
begin
 clrscr;
 writeln(' ::::: Programma per il calcolo di logaritmi in varie basi :::::');
 writeln('             (arrotondamento alla terza cifra decimale)');
end;

begin
 intestazione;
 writeln;
 writeln(' 1 - Logaritmi in varie basi');
 writeln(' 2 - Logaritmi naturali');
 writeln;
 write('Che logaritmi devi calcolare? (1/2) ');
 readln(z);
 case z of
 1:begin
    intestazione;
    writeln;
    write('Inserisci la base del logaritmo: ');
    readln(b);
    write('Inserisci l''argomento del logaritmo: ');
    readln(a);
    c:=0;
    repeat
     c:=c+0.0001;
     pot:=potenza(b,c);
    until pot>=a;
    writeln;
    writeln('LOG(',b,') di ',a:0:3,' = ',c:0:3);
   end;
 2:begin
    intestazione;
    writeln;
    write('Inserisci l''argomento del logaritmo: ');
    readln(a);
    pot:=ln(a);
    writeln;
    writeln('LN di ',a:0:3,' = ',pot:0:3);
    writeln('(e = 2.718)');
   end
 else writeln('ERRORE. Numero non presente nel menu');
 end;
 readln;
end.

