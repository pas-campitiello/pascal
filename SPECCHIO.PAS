Program specchio;
uses CRT;
var c:integer;
Procedure sispecchia;
var car:char;
 begin
  read(car);
  if car <> '*' then sispecchia;
  write(car);
 end;
begin
clrscr;
writeln('Inserisci i caratteri (* = per finire)');
sispecchia;
readln;
readln;
end.