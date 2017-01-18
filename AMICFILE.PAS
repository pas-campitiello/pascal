Program amici;
uses CRT;
var nome:string;
    testo:text;
procedure chiedinome;
begin
 write('Inserici il nome dell''amico (* per finire)');
 readln(nome);
end;
begin
clrscr;
assign(testo,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\Amici.DAT');
rewrite(testo);
chiedinome;
while nome <> '*' do
 begin
  writeln(testo,nome);
  chiedinome;
 end;
close(testo);
readln;
end.