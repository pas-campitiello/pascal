
{$M $1000,2,10 }   { 2K stack, no heap }
uses crt,dos;
var
  oldInt8 : Procedure;
{$F+}
procedure NewInt8; interrupt;
 var  h, m, s, hund : Word;
begin
   GotoXY(62,1);TextColor(LightGreen);

   gettime(h,m,s,hund);write(h:3,':',m:3,':',s:3,':',hund:3);

    gotoxy(78,1);textcolor(LightRed+blink);

     if h>12 then Write('PM')
     else         write('AM');
   inline ($9C);
   oldInt8;
end;
{$F-}
begin
 ClrScr;
  GetIntVec($8,@oldInt8);
  SetIntVec($8,Addr(newint8));
gotoxy(10,10);
  write('ษอออออออออออออออออออออออป');
gotoxy(10,11);
  write('บ  Time Show Program!   บ');
gotoxy(10,12);
  write('บ  Afshin Zavar Kabeh   บ');
gotoxy(10,13);
  write('บ  Afshin_Z@Yahoo.com   บ');
gotoxy(10,14);
  write('ศอออออออออออออออออออออออผ ');

  repeat
  until keypressed;

  SetIntVec($8,Addr(OldInt8));  (* reimposta INT 8h *)

end.
