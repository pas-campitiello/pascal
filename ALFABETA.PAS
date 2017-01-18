Program Alfabeta;
uses CRT;
var a,b:string;
begin
clrscr;
writeln('Prima stringa');
readln(a);
writeln('Seconda stringa');
readln(b);
writeln;
If a>b then
        begin
         writeln('In ordine alfabetico');
         writeln(b);
         writeln(a);
        end
       else
        begin
         writeln('In ordine alfabetico');
         writeln(a);
         writeln(b);
        end;
readln;
end.
