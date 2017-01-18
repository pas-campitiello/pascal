Program tabellaASCII;
uses CRT;
var i:integer;
begin
textcolor(15);
textbackground(1);
clrscr;
writeln('------------------ Tabella ASCII -------------------');
writeln;
writeln('Premi il pulsante PAUSA per bloccare la lista');
writeln('Premi qualsiasi tasto per ricominciare a far scorrere la lista o per uscire');
delay(2000);
i:=0;
readln;
repeat
writeln(i,' = ',chr(i));
i:=i+1;
delay(1000);
if i=256 then begin writeln; i:=0; end;
until keypressed;
end.
