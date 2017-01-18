Program matrix2;
uses CRT,graph;
var x,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,y,y2,Gd,Gm:integer;
    i:integer;

procedure MatDaSopra;
begin
    ClearDevice;
    setcolor(green);

    OutTextXY(x,y,chr(random(255)));
    OutTextXY(x,y-100,'7');
    OutTextXY(x,y-180,'#');
    OutTextXY(x,y-250,'4');

    OutTextXY(x2,y-10,chr(random(255)));
    OutTextXY(x2,y-180,'a');
    OutTextXY(x2,y-250,'');
    OutTextXY(x2,y-300,'b');

    OutTextXY(x3,y-30,chr(random(255)));
    OutTextXY(x3,y-50,'Z');
    OutTextXY(x3,y-80,'b');
    OutTextXY(x3,y-150,'$');

    OutTextXY(x4,y,chr(random(255)));
    OutTextXY(x4,y-30,'s');
    OutTextXY(x4,y-90,'N');
    OutTextXY(x4,y-150,'@');

    OutTextXY(x5,y,chr(random(255)));
    OutTextXY(x5,y-80,'h');
    OutTextXY(x5,y-100,'K');
    OutTextXY(x5,y-140,'í');

    OutTextXY(x6,y-40,chr(random(255)));
    OutTextXY(x6,y-50,'');
    OutTextXY(x6,y-100,'b');
    OutTextXY(x6,y-160,'ù');

    OutTextXY(x7,y-20,chr(random(255)));
    OutTextXY(x7,y-80,'P');
    OutTextXY(x7,y-120,'j');
    OutTextXY(x7,y-170,'∞');

    OutTextXY(x8,y,chr(random(255)));
    OutTextXY(x8,y-90,'w');
    OutTextXY(x8,y-120,'Q');
    OutTextXY(x8,y-160,'π');

    OutTextXY(x9,y-10,chr(random(255)));
    OutTextXY(x9,y-50,'i');
    OutTextXY(x9,y-90,'U');
    OutTextXY(x9,y-150,'æ');

    OutTextXY(x10,y-20,chr(random(255)));
    OutTextXY(x10,y-50,'G');
    OutTextXY(x10,y-100,'d');
    OutTextXY(x10,y-130,'–');

    OutTextXY(x11,y,chr(random(255)));
    OutTextXY(x11,y-70,'y');
    OutTextXY(x11,y-100,'V');
    OutTextXY(x11,y-150,'·');

    OutTextXY(x12,y-30,chr(random(255)));
    OutTextXY(x12,y-50,'Q');
    OutTextXY(x12,y-90,'z');
    OutTextXY(x12,y-160,'Á');

    OutTextXY(x13,y,chr(random(255)));
    OutTextXY(x13,y-100,'R');
    OutTextXY(x13,y-120,'ú');
    OutTextXY(x13,y-170,'˜');

    OutTextXY(x14,y-20,chr(random(255)));
    OutTextXY(x14,y-60,'á');
    OutTextXY(x14,y-150,'F');
    OutTextXY(x14,y-180,'<');

    OutTextXY(x15,y-10,chr(random(255)));
    OutTextXY(x15,y-70,';');
    OutTextXY(x15,y-100,'M');
    OutTextXY(x15,y-170,'#');

    OutTextXY(x,y-300,'4');
    OutTextXY(x,y-360,'7');
    OutTextXY(x,y-390,'@');
    OutTextXY(x,y-450,'4');

    OutTextXY(x2,y-320,'ú');
    OutTextXY(x2,y-360,'a');
    OutTextXY(x2,y-390,'');
    OutTextXY(x2,y-450,'b');

    OutTextXY(x3,y-190,'{');
    OutTextXY(x3,y-200,'Z');
    OutTextXY(x3,y-250,'b');
    OutTextXY(x3,y-260,'$');

    OutTextXY(x4,y-200,' ');
    OutTextXY(x4,y-290,'s');
    OutTextXY(x4,y-350,'N');
    OutTextXY(x4,y-450,'@');

    OutTextXY(x5,y-170,'œ');
    OutTextXY(x5,y-190,'h');
    OutTextXY(x5,y-220,'K');
    OutTextXY(x5,y-240,'í');

    OutTextXY(x6,y-180,'û');
    OutTextXY(x6,y-200,'');
    OutTextXY(x6,y-220,'b');
    OutTextXY(x6,y-240,'ù');

    OutTextXY(x7,y-190,'™');
    OutTextXY(x7,y-250,'P');
    OutTextXY(x7,y-270,'j');
    OutTextXY(x7,y-350,'∞');

    OutTextXY(x8,y-190,'≤');
    OutTextXY(x8,y-250,'w');
    OutTextXY(x8,y-280,'Q');
    OutTextXY(x8,y-360,'π');

    OutTextXY(x9,y-270,'Ω');
    OutTextXY(x9,y-300,'i');
    OutTextXY(x9,y-330,'U');
    OutTextXY(x9,y-350,'æ');

    OutTextXY(x10,y-150,'œ');
    OutTextXY(x10,y-170,'G');
    OutTextXY(x10,y-190,'d');
    OutTextXY(x10,y-230,'–');

    OutTextXY(x11,y-170,'—');
    OutTextXY(x11,y-290,'y');
    OutTextXY(x11,y-310,'V');
    OutTextXY(x11,y-350,'·');

    OutTextXY(x12,y-180,'Ê');
    OutTextXY(x12,y-230,'Q');
    OutTextXY(x12,y-290,'z');
    OutTextXY(x12,y-360,'Á');

    OutTextXY(x13,y-290,'Ë');
    OutTextXY(x13,y-310,'R');
    OutTextXY(x13,y-330,'ú');
    OutTextXY(x13,y-380,'˜');

    OutTextXY(x14,y-200,':');
    OutTextXY(x14,y-260,'á');
    OutTextXY(x14,y-290,'F');
    OutTextXY(x14,y-380,'<');

    OutTextXY(x15,y-290,'8');
    OutTextXY(x15,y-320,';');
    OutTextXY(x15,y-340,'M');
    OutTextXY(x15,y-490,'#');

    OutTextXY(x,y-490,chr(15));
    OutTextXY(x,y-540,'7');
    OutTextXY(x,y-600,chr(20));
    OutTextXY(x,y-700,'4');

    OutTextXY(x2,y-500,'');
    OutTextXY(x2,y-520,'a');
    OutTextXY(x2,y-590,'');
    OutTextXY(x2,y-650,'b');

    OutTextXY(x3,y-290,'#');
    OutTextXY(x3,y-350,'Z');
    OutTextXY(x3,y-380,'b');
    OutTextXY(x3,y-500,'$');

    OutTextXY(x4,y-470,'&');
    OutTextXY(x4,y-490,'s');
    OutTextXY(x4,y-500,'N');
    OutTextXY(x4,y-650,'@');

    OutTextXY(x5,y-270,'ë');
    OutTextXY(x5,y-290,'h');
    OutTextXY(x5,y-310,'K');
    OutTextXY(x5,y-640,'í');

    OutTextXY(x6,y-260,'û');
    OutTextXY(x6,y-290,'');
    OutTextXY(x6,y-310,'b');
    OutTextXY(x6,y-560,'ù');

    OutTextXY(x7,y-390,'™');
    OutTextXY(x7,y-480,'P');
    OutTextXY(x7,y-520,'j');
    OutTextXY(x7,y-570,'∞');

    OutTextXY(x8,y-380,'≤');
    OutTextXY(x8,y-410,'w');
    OutTextXY(x8,y-430,'Q');
    OutTextXY(x8,y-560,'π');

    OutTextXY(x9,y-390,'Ω');
    OutTextXY(x9,y-400,'i');
    OutTextXY(x9,y-450,'U');
    OutTextXY(x9,y-500,'æ');

    OutTextXY(x10,y-250,'œ');
    OutTextXY(x10,y-280,'G');
    OutTextXY(x10,y-300,'d');
    OutTextXY(x10,y-430,'–');

    OutTextXY(x11,y-380,'—');
    OutTextXY(x11,y-400,'y');
    OutTextXY(x11,y-420,'V');
    OutTextXY(x11,y-540,'·');

    OutTextXY(x12,y-400,'Ê');
    OutTextXY(x12,y-430,'Q');
    OutTextXY(x12,y-450,'z');
    OutTextXY(x12,y-570,'Á');

    OutTextXY(x13,y-400,'Ë');
    OutTextXY(x13,y-450,'R');
    OutTextXY(x13,y-470,'ú');
    OutTextXY(x13,y-600,'˜');

    OutTextXY(x14,y-420,':');
    OutTextXY(x14,y-440,'á');
    OutTextXY(x14,y-460,'F');
    OutTextXY(x14,y-680,'<');

    OutTextXY(x15,y-510,'8');
    OutTextXY(x15,y-570,';');
    OutTextXY(x15,y-600,'M');
    OutTextXY(x15,y-760,'#');

    delay(10000); { <-À Tempo, in millesimi di secondo, atteso tra i        }
end;              {   » movimenti dei caratteri in discesa (default = 4000) }

{MAIN}

begin
 Gd:=Detect;
 InitGraph(Gd, Gm, 'C:\Tp7\Bgi'); { <- Path della Borland Graphic Inteface}
 if GraphResult <> grOk then
                            begin
                             writeln('ERRORE DI INIZIALIZZAZIONE GRAFICA');
                             Halt(1);
                            end;

 SetTextStyle(3,HorizDir,4); { <-À Settaggio parametri del testo
                                 ∫ (font,direzione,size)
                                 » default = SetTextStyle(3,HorizDir,4) }
 randomize;
 repeat
  x:=random(30)+1;
  x2:=x+40;
  x3:=x2+30;
  x4:=x3+60;
  x5:=x4+30;
  x6:=x5+60;
  x7:=x6+30;
  x8:=x7+40;
  x9:=x8+30;
  x10:=x9+30;
  x11:=x10+60;
  x12:=x11+30;
  x13:=x12+40;
  x14:=x13+30;
  x15:=x14+60;
  y:=0;
  repeat
   y:=y+20;        { <- Spazio tra i movimenti dei caratteri. Default = 20  }
   MatDaSopra;
  until y=1200;    { <-À Lunghezza effettiva dello schermo per permettere   }
 until keypressed; {   ∫ la discesa "a scomparsa" dei caratteri. Con tutti  }
 readln;           {   ∫ i parametri impostati a default, qui il default ä  }
 CloseGraph;       {   » 1200.                                              }
end.