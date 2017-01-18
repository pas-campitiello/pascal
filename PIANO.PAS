PROGRAM piano;
Uses Crt,Graph;

Procedure Inizializzazione;
VAR gdriver,gmode,grapherror:integer;
BEGIN
 gdriver:=detect;
 gmode:=detect;
 Initgraph(gdriver,gmode,'c:\tp7\bgi');
 grapherror:=graphresult;
 IF grapherror>0 THEN BEGIN
                        WRITE ('Errore di inizializzazione grafica');
                        halt (1);
                      END;
END;

Procedure Lamp(q:string; x,c1,c2:integer);
BEGIN
 Setcolor(c1);             {procedura per la scrittura}
 Outtextxy(x,270,'___');   {della nota sui tasti bianchi}
 Outtextxy(x,275,'___');
 Outtextxy(x,280,'___');
 Setcolor(c2);
 Outtextxy(x,235,q);
END;

Procedure Tastiera;       {procedura che garantisce la parte grafica}
VAR i:integer;            {della schermata con la tastiera}
BEGIN
 Setcolor(15);
 Rectangle(20,180,635,360);
 Bar(20,260,635,360);
 Bar(20,180,60,360);
 Bar(90,180,115,360);
 Bar(145,180,225,360);
 Bar(255,180,280,360);
 Bar(310,180,335,360);
 Bar(365,180,445,360);
 Bar(475,180,500,360);
 Bar(530,180,610,360);
 Setcolor(0);
 Line(75,190,75,360);
 Line(130,190,130,360);
 Line(185,180,185,360);
 Line(240,190,240,360);
 Line(295,190,295,360);
 Line(350,190,350,360);
 Line(405,190,405,360);
 Line(460,109,460,360);
 Line(515,190,515,360);
 Line(570,190,570,360);
 Line(625,190,625,360);
 Setcolor(6);
 Outtextxy(20,350,'   a      s      d      f      g      h     j      k      l      •      …');
 Outtextxy(73,183,'w      e            t      y      u             o      p            +');
 Lamp('do',32,15,7);
 Lamp(' re',87,15,7);
 Lamp('  mi',142,15,7);
 Lamp('fa',197,15,7);
 Lamp(' sl',252,15,7);
 Lamp(' la',307,15,7);
 Lamp('  si',362,15,7);
 Lamp('do',417,15,7);
 Lamp(' re',472,15,7);
 Lamp('  mi',527,15,7);
 Lamp('fa',582,15,7);
 Lamp('do#',64,0,7);
 Lamp('re#',119,0,7);
 Lamp('fa#',229,0,7);
 Lamp('sl#',284,0,7);
 Lamp('la#',339,0,7);
 Lamp('do#',449,0,7);
 Lamp('re#',504,0,7);
 Lamp('fa#',611,0,7);
  for i:=8 to 14 do
   begin
    delay(150);
    Setcolor(i);
    Outtextxy(300,50,'PLAY IT NOW !!');
   end;
  Setcolor(1);
 Outtextxy(50,100,'1)Suonando non Š possibile comporre accordi, solo note singole');
 Outtextxy(50,130,'2)Premuto un tasto si consiglia di lasciar•o: la nota continua');
 Outtextxy(50,160,'3)Per uscire, premere il tasto *');
end;

Procedure Nota (e:char;s:integer;r:string;y,d1,d2:integer);
Begin
 nosound;
 delay(20);
 sound(s);
  if e='n'then Lamp(r,y,d1,d2)
          else Lamp(r,y,d1,d2);
 delay(20);
  if e='n' then Lamp(r,y,15,7)
           else lamp(r,y,0,7);
End;

Procedure Suono;
 var a:char;
Begin
 a:='@';
 Repeat
  a:=readkey;
  Case a of
   'a': Nota('n',262,'do',32,7,8);
   'w': Nota('d',277,'do#',64,7,8);
   's': Nota('n',294,' re',87,7,8);
   'e': Nota('d',311,'re#',119,7,8);
   'd': Nota('n',330,'  mi',142,7,8);
   'f': Nota('n',349,'fa',197,7,8);
   't': Nota('d',370,'fa#',229,7,8);
   'g': Nota('n',392,' sl',252,7,8);
   'y': Nota('d',415,'sl#',284,7,8);
   'h': Nota('n',440,' la',307,7,8);
   'u': Nota('d',466,'la#',339,7,8);
   'j': Nota('n',492,'  si',362,7,8);
   'k': Nota('n',523,'do',417,7,8);
   'o': Nota('d',554,'do#',449,7,8);
   'l': Nota('n',587,' re',472,7,8);
   'p': Nota('d',622,'re#',504,7,8);
   '•': Nota('n',659,'  mi',527,7,8);
   '…': Nota('n',698,'fa',582,7,8);
   '+': Nota('d',740,'fa#',611,7,8);
  end;
 Until a='*';
End;


Begin
 inizializzazione;
 Tastiera;
 Suono;
 Closegraph;
 Nosound;
End.