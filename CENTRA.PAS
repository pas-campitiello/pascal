Program Centra;
uses CRT;
var s:string;
procedure centrastringa(x:string);
var v:integer;
 begin
  v:=(80+length(x)) div 2;
  writeln(x:v);
 end;
begin
clrscr;
write('Scrivi una stringa: ');
readln(s);
centrastringa(s);
readln;
end.
