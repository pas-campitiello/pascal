Program ricerca_sonora;
uses CRT;
type vett=array[1..5] of integer;
var vettore:vett;
    i,trova,pos:integer;
    trovato:boolean;
begin
clrscr;
for i:=1 to 5 do
begin
 write('Elemento nø ',i,': ');
 readln(vettore[i]);
end;
writeln;
write('Numero da ricercare: ');
readln(trova);
writeln;
writeln('---- 1ø metodo ----');
writeln;
for i:=1 to 5 do
begin
 if vettore[i]=trova then writeln('Trovato')
                     else writeln('Non trovato');
end;
writeln;
writeln('---- 2ø metodo ----');
writeln;
trovato:=false;
for i:=1 to 5 do
begin
 if vettore[i]=trova then trovato:=true
end;
if trovato then writeln('Trovato')
           else writeln('Non trovato');
writeln;
writeln('---- 3ø metodo ----');
writeln;
for i:=1 to 5 do
 if vettore[i]=trova then
                         begin
                          trovato:=true;
                          pos:=i;
                         end;
 if trovato then writeln('Trovato alla posizione ',pos)
            else writeln('Non trovato');
for i:=1 to 100 do
begin
delay(50);
writeln(chr(7));
end;
writeln('---PREMERE UN TASTO PER TORNARE AL PROGRAMMA---');
readln;
end.