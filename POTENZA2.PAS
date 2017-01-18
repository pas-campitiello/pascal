PROGRAM potenza;
VAR base,esp,P,v:INTEGER;
BEGIN
WRITELN('Inserisci la base');
READLN(base);
WRITELN('Inserisci l_esponente');
READLN(esp);
v:=2;
P:=base*base;
repeat
v:=v+1;
P:=P*base;
until v=esp;
WRITELN('Il risultato della potenza Š ',p);
readln;
END.

