Program prova_arcobaleno;
var coloretesto,coloresfondo : integer;
    i:byte;

procedure arcobaleno;
begin
 if coloretesto > 20 then begin
                           coloretesto:=0;
                           coloresfondo:=1;
                          end
                     else begin
                           coloretesto := coloretesto + 1;
                           coloresfondo := coloresfondo + 1;
                          end;
 textcolor(coloretesto);
 textbackground(coloresfondo);
 clrscr;
 writeln;
 writeln('               HELLO WORLD!!!');
 delay(10);
end;

begin
 coloretesto:=1;
 coloresfondo:=0;
 repeat
  arcobaleno;
 until keypressed;
 textcolor(15);
 textbackground(1);
 clrscr;
 writeln;
 writeln('               Tabella ASCII');
 writeln;
 writeln('   premi il pulsante PAUSA per bloccare la lista');
 writeln('   premi qualsiasi tasto per ricominciare a far scorrere la lista o per uscire');
 delay(2000);
 i:=0;
 readln;
 repeat
  writeln(i,' = ',chr(i));
  i:=i+1;
  delay(100);
 until keypressed;
end.
