Program crescente;
uses CRT;
var a,b,c,t:integer;
begin
 clrscr;
 writeln('Scrivi 3 numeri');
 readln(a,b,c);
  Repeat
   If a>b then begin t:=b; b:=a; a:=t; end;
   If b>c then begin t:=c; c:=b; b:=t; end;
  Until (a<b) and (b<c);
 writeln;
 writeln('I numeri in ordine crescente sono ',a,' ',b,' ',c);
readln;
end.