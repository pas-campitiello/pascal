Program Cronometro;
Uses Crt;
label 1;
Var i,m,s,d,a,f:integer;
    r:char;
Const t=100;
Begin
 m:=0;
 s:=0;
 d:=0;
 Clrscr;
 textcolor (yellow);
 gotoxy (35,15);
 Write (m,':',s,':',d);
 Gotoxy (10,25);
 textcolor (red);
 Write ('Premere S per iniziare il conteggio e ripremere per fermarlo');
 r:=readkey;
 if (r='s') or (r='S') then
 begin
  textcolor (red);
  Repeat
   d:=d+1;
   If d=10 then
            Begin
             d:=0;
             s:=s+1;
            End;
   If s=60 then
            Begin
             d:=0;
             s:=0;
             m:=m+1;
            end;
   delay (t);
   clrscr;
   gotoxy (35,15);
   delay(2500);
   Write (m,':',s,':',d);
   gotoxy (26,50);
  Until keypressed;
  Clrscr;
  Gotoxy (10,10);
  Delay (1000);
  clrscr;
  For i:=1 to 15 do
   begin
    textcolor (i);
    Gotoxy (1,1);
    if d=0 then f:=9
           else f:=d-1;
    Write ('Il tempo cronometrato Š:');
    Textcolor (white);
    Gotoxy (25,15);
    Write (m);
    textcolor(yellow);
    write(' minut');
    If m=1 then write ('o, ')
           else write ('i, ');
    textcolor(white);
    Write (s);
    textcolor(yellow);
    write(' second');
    if s=1 then write ('o, ')
           else write ('i, ');
    textcolor(white);
    Write (f);
    textcolor(yellow);
    write(' decim');
    If f=1 then write ('o')
           else write ('i');
    delay (500);
   end;
   delay (1000)
 end;
readln;
End.
