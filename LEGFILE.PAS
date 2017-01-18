Program Leggi_File;
var FILEIN:file of integer;
ELEMENTO:integer;
begin
assign(FILEIN,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\POLLO.dat');
reset(FILEIN);
writeln('File aperto in lettura, segue elenco dati contenuti');
while not eof(FILEIN) do
begin
read(FILEIN,ELEMENTO);
writeln('Dato: ',ELEMENTO);
end;
close(FILEIN);
readln;
end.
