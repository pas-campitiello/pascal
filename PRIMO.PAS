Program primo;
uses CRT;
var n,i,c:longint;
begin
clrscr;
writeln(':::::::: Programma per verificare se un numero Š primo ::::::::');
writeln(':::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::');
writeln;
write('Inserisci il numero: ');
readln(n);
i:=1;
c:=0;
repeat
 if n mod i = 0 then c:=c+1;
 i:=i+1;
until i>n;
writeln;
if c=2 then writeln(n,' Š un numero primo')
       else writeln(n,' non Š un numero primo');
readln;
end.