Program sfondo;
uses crt;
var x:integer;
begin
clrscr;
for x:=0 to 15 do
begin
  textbackground(x);
  clrscr;
  write('prova',x);
  readln;
end;
end.

