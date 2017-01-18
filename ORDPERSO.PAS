Program persone_eta;
uses CRT;
var p1,p2,p3:string;
    e1,e2,e3:integer;
procedure ordinaalfabeta(var x1,x2,x3:string; var y1,y2,y3:integer);
var t:string;
    z:integer;
 begin
  repeat
   if x1>x2 then begin t:=x1; z:=y1; x1:=x2; y1:=y2; x2:=t; y2:=z; end;
   if x2>x3 then begin t:=x3; z:=y3; x3:=x2; y3:=y2; x2:=t; y2:=z; end;
  until (x1<=x2) and (x2<=x3);
  writeln('Nomi in ordine alfabetico:');
  writeln(x1,' et… ',y1);
  writeln(x2,' et… ',y2);
  writeln(x3,' et… ',y3);
 end;
procedure ordinanumeri(var x1,x2,x3:string; var y1,y2,y3:integer);
var t:integer;
    z:string;
 begin
  repeat
   if y1>y2 then begin t:=y1; z:=x1; y1:=y2; x1:=x2; y2:=t; x2:=z; end;
   if y2>y3 then begin t:=y3; z:=x3; y3:=y2; x3:=x2; y2:=t; x2:=z; end;
  until (y1<=y2) and (y2<=y3);
  writeln('Nomi in ordine di et…:');
  writeln(x1,' et… ',y1);
  writeln(x2,' et… ',y2);
  writeln(x3,' et… ',y3);
 end;

begin
 clrscr;
 write('Inserisci nome e et… della 1a persona (separati da INVIO): ');
 readln(p1,e1);
 write('Inserisci nome e et… della 2a persona (separati da INVIO): ');
 readln(p2,e2);
 write('Inserisci nome e et… della 3a persona (separati da INVIO): ');
 readln(p3,e3);
 writeln;
 ordinaalfabeta(p1,p2,p3,e1,e2,e3);
 writeln;
 ordinanumeri(p1,p2,p3,e1,e2,e3);
 readln;
end.

