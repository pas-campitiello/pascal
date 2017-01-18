Program Rappresentazione_decimale_di_numero_base_otto;
Var NCIFRE, CIFRA, ACCUMULATORE, K: integer;
begin
writeln('Programma per rappresentare in base 10 un numero dato in base 8');
writeln;
writeln('Scrivere il numero delle cifre del numero in base 8');
readln(NCIFRE);
ACCUMULATORE:=0;
writeln;
For K:=1 to NCIFRE do
 begin
  writeln ('Scrivere la cifra di posto ',K,' da sinistra verso destra: ');
  readln(CIFRA);
  ACCUMULATORE:=ACCUMULATORE*8+CIFRA;
 end;
writeln;
writeln('Il numero dato in base 10 Š uguale a ',ACCUMULATORE);
readln;
end.
