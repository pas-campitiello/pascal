Program OrdimentoNOMI;
var NUMALLIEVI,I: integer;
    NOMECLASSE,TRANSITO: string[30];
    NOMI:array[1..35] of string[30];
    FLAG:boolean;
begin
writeln('Programma per ordinare i nomi degli allievi');
writeln('Scrivere il nome della classe');
readln(NOMECLASSE);
writeln('Scrivere il numero degli allievi (35 max)');
readln(NUMALLIEVI);
for I:= 1 to NUMALLIEVI do
  begin
   writeln('Scrivere il nome del ',I,'ø allievo');
   readln(NOMI[I]);
  end;
 repeat
  FLAG:=true;
  for I:= 1 to NUMALLIEVI-1 do
  if NOMI[I] > NOMI[I+1] then
  begin
   TRANSITO:=NOMI[I];
   NOMI[I]:=NOMI[I+1];
   NOMI[I+1]:=TRANSITO;
   FLAG:=false;
  end;
  until FLAG;
 Writeln('Elenco ordinato degli allievi della classe ',NOMECLASSE);
 for I:=1 to NUMALLIEVI do writeln (NOMI[I]);
 readln;
end.