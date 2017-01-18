Program Maggiore;
var a,b,e:integer;
Procedure magg (c,d:integer);
begin
if c>d then e:=c
else e:=d;
end;
begin
writeln('Scrivi due numeri separati da uno spazio');
readln(a,b);
magg(a,b);
writeln('Il numero maggiore Š ',e);
readln;
end.


