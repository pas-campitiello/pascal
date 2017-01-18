Program Scrivi_File;
var FILEOUT:file of integer;
ELEMENTO:integer;
begin
assign(FILEOUT,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\POLLO.dat');
rewrite(FILEOUT);
writeln('File aperto in scrittura, inserire <0> per terminare');
writeln('Possono essere inseriti solo numeri interi');
write('Inserire il 1ø numero ');
readln(ELEMENTO);
while ELEMENTO <> 0 do
begin
write(FILEOUT,ELEMENTO);
write('Inserire un altro elemento ');
readln(ELEMENTO);
end;
close(FILEOUT);
readln;
end.
