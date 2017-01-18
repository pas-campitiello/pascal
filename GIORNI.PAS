Program giorno;
uses CRT;
var giorn,mese:integer;
function calcologiorno(g,m:integer):string;
var a,c:integer;
 begin
  case m of
   1:a:=0;
   2:a:=31;
   3:a:=59;
   4:a:=90;
   5:a:=120;
   6:a:=151;
   7:a:=181;
   8:a:=212;
   9:a:=243;
   10:a:=273;
   11:a:=304;
   12:a:=334;
  end;
  a:=a+g;
  c:=a mod 7;
  case c of
   0:calcologiorno:='domenica';
   1:calcologiorno:='lunedç';
   2:calcologiorno:='martedç';
   3:calcologiorno:='mercoledç';
   4:calcologiorno:='giovedç';
   5:calcologiorno:='venerdç';
   6:calcologiorno:='sabato';
  end;
 end;
begin
 clrscr;
 writeln('Inserisci mese e giorno (separati da un invio): ');
 readln(giorn,mese);
 writeln;
 writeln('Se il primo giorno dell''anno (non bisestile) ä lunedç il ',giorn,'/',mese,' sarÖ ',calcologiorno(giorn,mese));
 readln;
end.