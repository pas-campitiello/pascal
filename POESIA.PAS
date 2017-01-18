Program poesia;
uses CRT;
var verso:string;
    poema:text;
    v,i:integer;
begin
clrscr;
assign(poema,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\poesfile.dat');
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
i:=1;
while not eof(poema) do
 begin
  i:=i+1;
  readln(poema,verso);
  if i=v then writeln(verso);
 end;
close(poema);
readln;
end.