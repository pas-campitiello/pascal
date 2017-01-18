Program jeufrase;
uses CRT;
var frase,fraseoscurata,soluzione:array[1..20] of char;
    c,i,a,n:integer;
    lettera:char;
begin
clrscr;
writeln('- - - INDOVINA LA FRASE - - -');
writeln;
writeln('Inserisci i 20 caratteri della frase separati da un INVIO');
writeln;
for i:=1 to 20 do
 begin
  readln(frase[i]);
  fraseoscurata[i]:=frase[i];
 end;
writeln;
write('Quante lettere vuoi oscurare? ');
readln(n);
clrscr;
writeln('Frase oscurata:');
randomize;
i:=1;
repeat
 a:=random(20)+1;
 if fraseoscurata[a] <> '*' then
                                begin
                                 fraseoscurata[a]:='*';
                                 i:=i+1;
                                end;
until i>n;
writeln;
for i:=1 to 20 do
 write(fraseoscurata[i],' ');
writeln;
writeln;
c:=0;
repeat
 c:=c+1;
 write('Lettera nø ',c,': ');
 readln(lettera);
 for i:=1 to 20 do
   if frase[i]=lettera then fraseoscurata[i]:=frase[i];
until c=5;
clrscr;
writeln('Frase disoscurata: ');
writeln;
for i:=1 to 20 do
 write(fraseoscurata[i],' ');
writeln;
writeln;
writeln('Inserisci la soluzione separando i vari caratteri con un INVIO');
writeln;
for i:=1 to 20 do
 readln(soluzione[i]);
writeln;
c:=0;
for i:=1 to 20 do
 if soluzione[i]=frase[i] then c:=c+1;
writeln;
if c=20 then
            begin
             write('COMPLIMENTI! Hai indovinato la frase: ');
             for i:=1 to 20 do
             write(frase[i],' ');
            end
        else
            writeln('HAI SBAGLIATO !!! Hai indovinato ',c,' lettere su 20');
readln;
end.
