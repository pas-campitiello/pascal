Program poesia2;
uses CRT;
var verso:string;
    poema:text;
    v,i:integer;
begin
clrscr;
assign(poema,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\poefile2.dat');
rewrite(poema);
writeln('Quanti versi vuoi inserire? ');
readln(v);
writeln;
for i:=1 to v do
 begin
  write('Verso (* per terminare): ');
  readln(verso);
  writeln(poema,verso);
 end;
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