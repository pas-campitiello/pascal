PROGRAM potenza;
VAR base,esp,P,c:INTEGER;
BEGIN
WRITELN('Inserisci la base');
READLN(base);
WRITELN('Inserisci l_esponente');
READLN(esp);
if esp=1 then Writeln('La potenza con esponente 1 Š uguale alla base stessa')
         else begin
              P:=base*base;
              FOR c:= 1 TO (esp-2) DO
              P:=P*base;
              WRITELN('Il risultato della potenza Š ',p);
              end;
END.
