Program tabella_caratteri;
uses printer,crt;
var a,b,c,k,scel:integer;
    r,car:char;
    num:integer;

Begin
 clrscr;
 scel:=0;
 textcolor (red);
 textbackground (green);
 Gotoxy (15,10);
 Write ('Programma tabella caratteri del sistema operativo');
 Gotoxy (24,11);
 Write ('Programmato da Mornati Marco');
 Gotoxy (24,20);
 textbackground (white);
 textcolor (black);
 Write ('Premere INVIO per continuare');
 readln;
 textbackground (black);
 textcolor (white);
 clrscr;
 writeln ('Scegliere una delle seguenti opzioni ');Writeln;
 Writeln ('1 - Vedere l''intera tabella caratteri su monitor');
 Writeln ('2 - Stampare l''intera tabella caratteri su stampante');
 writeln ('3 - Digitare il carattere e verificare il numero');
 Writeln ('4 - Digitare un numero per verificare a quale carattere corrisponde');
 Writeln;Writeln ('N.B.  Per ottenere i caratteri basta tenere premuto il tasto ALT e battere');
 Writeln ('      il numero (solo da tastierino numerico) corrispondente al carattere');
 Writeln;Writeln;
 Write ('ÄÄ> ');readln (scel);
 If scel=1 then
 begin
  clrscr;
  for k:=32 to 255 do
   begin
    if k<100 then write (k,' = ',(chr(k)),'    ');
    if k>=100 then write (k,' = ',(chr(k)),'   ');
    if k=199 then
       begin
        writeln;
        write ('Premere un tasto per continuare');
        r:=readkey;
        clrscr;
       end;
    delay (10);
   end;
  readln;
 end;
 if scel=2 then
 begin
  for k:=32 to 255 do
   begin
    write(lst,k,' = ',chr(k),'    ');
    if (k mod 10)=0 then writeln;
   end;
  end;
   if scel=3 then
    begin
     clrscr;
     Writeln ('Inserire il carattere del quale si vuole sapere il numero ');
     Write ('ÄÄ> ');Readln (car);
     Writeln;writeln;writeln;
     Write (car,' = ',ord(car));
    end;
  if scel=4 then
   Begin
    clrscr;
    Writeln ('Inserire il numero del carattere da testare:');
    Write ('--> '); Readln (num);
    Writeln;Writeln;Writeln;
    Write (num,' = ',chr(num));
   end;
   readln;
  end.