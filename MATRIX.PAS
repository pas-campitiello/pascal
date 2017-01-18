Program matrix;
uses CRT;
var x,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,
    x14,x15,x16,x17,x18,x19,x20,y,y2:integer;

procedure MatDaSopra;
begin
    clrscr;
    textcolor(green);

    gotoxy(x,y);
    writeln(chr(15));
    gotoxy(x,y-4);
    writeln('7');
    gotoxy(x,y-8);
    writeln(chr(20));
    gotoxy(x,y-16);
    writeln('4');

    gotoxy(x2,y);
    writeln('');
    gotoxy(x2,y-6);
    writeln('a');
    gotoxy(x2,y-10);
    writeln('');
    gotoxy(x2,y-18);
    writeln('b');

    gotoxy(x3,y-1);
    writeln('#');
    gotoxy(x3,y-5);
    writeln('Z');
    gotoxy(x3,y-8);
    writeln('b');
    gotoxy(x3,y-15);
    writeln('$');

    gotoxy(x4,y-1);
    writeln('&');
    gotoxy(x4,y-3);
    writeln('s');
    gotoxy(x4,y-9);
    writeln('N');
    gotoxy(x4,y-15);
    writeln('@');

    gotoxy(x5,y-1);
    writeln('ë');
    gotoxy(x5,y-8);
    writeln('h');
    gotoxy(x5,y-10);
    writeln('K');
    gotoxy(x5,y-14);
    writeln('í');

    gotoxy(x6,y);
    writeln('û');
    gotoxy(x6,y-5);
    writeln('');
    gotoxy(x6,y-10);
    writeln('b');
    gotoxy(x6,y-16);
    writeln('ù');

    gotoxy(x7,y-5);
    writeln('™');
    gotoxy(x7,y-8);
    writeln('P');
    gotoxy(x7,y-12);
    writeln('j');
    gotoxy(x7,y-17);
    writeln('∞');

    gotoxy(x8,y-3);
    writeln('≤');
    gotoxy(x8,y-9);
    writeln('w');
    gotoxy(x8,y-12);
    writeln('Q');
    gotoxy(x8,y-16);
    writeln('π');

    gotoxy(x9,y-2);
    writeln('Ω');
    gotoxy(x9,y-5);
    writeln('i');
    gotoxy(x9,y-9);
    writeln('U');
    gotoxy(x9,y-15);
    writeln('æ');

    gotoxy(x10,y);
    writeln('œ');
    gotoxy(x10,y-5);
    writeln('G');
    gotoxy(x10,y-10);
    writeln('d');
    gotoxy(x10,y-13);
    writeln('–');

    gotoxy(x11,y-1);
    writeln('—');
    gotoxy(x11,y-7);
    writeln('y');
    gotoxy(x11,y-10);
    writeln('V');
    gotoxy(x11,y-15);
    writeln('·');

    gotoxy(x12,y);
    writeln('Ê');
    gotoxy(x12,y-3);
    writeln('Q');
    gotoxy(x12,y-9);
    writeln('z');
    gotoxy(x12,y-16);
    writeln('Á');

    gotoxy(x13,y-4);
    writeln('Ë');
    gotoxy(x13,y-10);
    writeln('R');
    gotoxy(x13,y-12);
    writeln('ú');
    gotoxy(x13,y-17);
    writeln('˜');

    gotoxy(x14,y-2);
    writeln(':');
    gotoxy(x14,y-6);
    writeln('á');
    gotoxy(x14,y-15);
    writeln('F');
    gotoxy(x14,y-18);
    writeln('<');

    gotoxy(x15,y-5);
    writeln('8');
    gotoxy(x15,y-7);
    writeln(';');
    gotoxy(x15,y-10);
    writeln('M');
    gotoxy(x15,y-17);
    writeln('#');

    gotoxy(x16,y-1);
    writeln('0');
    gotoxy(x16,y-7);
    writeln('2');
    gotoxy(x16,y-10);
    writeln('5');
    gotoxy(x16,y-15);
    writeln('9');

    gotoxy(x17,y);
    writeln('1');
    gotoxy(x17,y-3);
    writeln('3');
    gotoxy(x17,y-9);
    writeln('6');
    gotoxy(x17,y-16);
    writeln('7');

    gotoxy(x18,y-4);
    writeln('9');
    gotoxy(x18,y-10);
    writeln('8');
    gotoxy(x18,y-12);
    writeln('6');
    gotoxy(x18,y-17);
    writeln('4');

    gotoxy(x19,y-2);
    writeln('3');
    gotoxy(x19,y-6);
    writeln('2');
    gotoxy(x19,y-15);
    writeln('4');
    gotoxy(x19,y-18);
    writeln('0<');

    gotoxy(x20,y-5);
    writeln('8');
    gotoxy(x20,y-7);
    writeln('7');
    gotoxy(x20,y-10);
    writeln('5');
    gotoxy(x20,y-17);
    writeln('1');

    delay(7000);
end;

{MAIN}

begin
 textbackground(black);
 clrscr;
 randomize;
 repeat
  x:=random(80)+1;
  x2:=random(80)+1;
  x3:=random(80)+1;
  x4:=random(80)+1;
  x5:=random(80)+1;
  x6:=random(80)+1;
  x7:=random(80)+1;
  x8:=random(80)+1;
  x9:=random(80)+1;
  x10:=random(80)+1;
  x11:=random(80)+1;
  x12:=random(80)+1;
  x13:=random(80)+1;
  x14:=random(80)+1;
  x15:=random(80)+1;
  x16:=random(80)+1;
  x17:=random(80)+1;
  x18:=random(80)+1;
  x19:=random(80)+1;
  x20:=random(80)+1;
  for y:=1 to 40 do MatDaSopra;
 until keypressed;
 readln;
end.