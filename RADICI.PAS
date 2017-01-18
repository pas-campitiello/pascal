Program radici;
uses CRT;
var rad,indrad:integer;
    con,pot:real;
function potenza(b:real;e:integer):real;
var p:real;
    c:integer;
 begin
  p:=b*b;
  for c:=1 to (e-2) do p:=p*b;
  potenza:=p;
 end;
begin
clrscr;
writeln('     ::: PROGRAMMA PER IL CALCOLO DI RADICI IN VARI INDICI :::');
writeln('             (arrotondamento alla terza cifra decimale)');
writeln;
write('Inserisci il radicando: ');
readln(rad);
write('Inserisci l''indice di radice: ');
readln(indrad);
writeln;
if indrad=1 then writeln('La radice con indice 1 Š uguale al radicando: ',rad)
            else
             begin
              con:=0;
              repeat
               con:=con+0.0001;
               pot:=potenza(con,indrad);
              until pot>=rad;
              writeln('Radice ',indrad,'¦ di ',rad,' = ',con:0:3);
             end;
readln;
end.