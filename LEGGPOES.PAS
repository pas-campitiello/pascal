Program leggipoesia;
uses CRT;
var verso:string;
    poema:text;
    v,i:integer;
begin
clrscr;
assign(poema,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\poesfile.dat');
writeln;
writeln('Primo e ultimo verso:');
writeln;
reset(poema);
readln(poema,verso);
writeln(verso);
while not eof(poema) do
 begin
  readln(poema,verso);
  if eof(poema) then writeln(verso);
 end;
close(poema);
readln;
end.