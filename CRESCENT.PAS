Program Ordinamento;
uses CRT;
var a,b,c,d,T:integer;
begin
clrscr;
writeln('Scrivere 4 numeri');
readln(a,b,c,d);
repeat
 if a>b then begin T:=a; a:=b; b:=T; end;
 if b>c then begin T:=b; b:=c; c:=T; end;
 if c>d then begin T:=c; c:=d; d:=T; end;
Until (a<b) and (b<c) and (c<d);
writeln('I quattro numeri ordinati sono ',a,' ',b,' ',c,' ',d);
readln;
end.
