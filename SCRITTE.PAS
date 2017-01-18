PROGRAM scritte_che_scorrono;
 uses crt,graph;
   VAR frasenew,frase:string;
       riga:integer;
       velox,vidcol,colonne:integer;

   Procedure ErrorBeep;
   BEGIN
    SOUND (150);
    delay (100);
    nosound;
   END;

   Procedure InputDati (VAR fras:string; VAR vcol,col,vel:integer);
   VAR l:integer;
   BEGIN
    repeat
     CLRSCR;
     WRITELN ('Inserisci il numero di colonne del video (min.40):'); READLN (vcol);
     IF (vcol<40) then ErrorBeep;
    until (vcol >39);
    repeat
     CLRSCR;
     WRITELN ('Inserisci una frase (Max.',vcol,' caratteri):');READLN (fras);
     l:=length(fras);
     IF (l<=0) OR (l>vcol) THEN ErrorBeep;
    until (l>0) AND (l<vcol);
    repeat
     CLRSCR;
     WRITELN ('Inserisci il numero di colonne della schermata (Max.',vcol-2,'):');READLN (col);
     IF (col<3) OR (col>vcol-2) THEN ErrorBeep;
    until (col>2) AND (col<=vcol-2);
    repeat
     CLRSCR;
     WRITELN ('Inserisci la riga di posizionamento (6-19):');READLN (riga);
     IF (riga<6) OR (riga>19) THEN ErrorBeep;
    until (riga>5) AND (riga<=19);
    repeat
     CLRSCR;
     WRITE ('Inserisci la velocit… (1-10):');READLN (vel);
     IF (vel<1) OR (vel>10) THEN ErrorBeep;
    until (vel>0) AND (vel<11);
   END;
   Procedure Schermata (numcol:integer);
   VAR y:integer;

     Procedure ScriviCentrato (ncol:integer; checosa:string);
     VAR l,n,i:integer;
     BEGIN
      l:=length(checosa);
      n:=(ncol-l) div 2;
      FOR i:=1 TO n DO
        WRITE('');
       WRITELN (checosa);
     END;

  BEGIN
   CLRSCR;
   gotoxy(1,riga-5);
   ScriviCentrato(numcol,'Programma a cura di Mornati Marco');
   gotoxy(1,riga+5);
   ScriviCentrato(numcol,'Premi un tasto qualsiasi per finire');
  END;

  Procedure MuoviFrase (fraselab:string; vcol,ncol,velo:integer);
  VAR col,halfncol,lung,lunfrasnew,margsx,x1,x2:integer;
      frasenew,str1,str2,dastampa:string;

  Procedure Linea (vc,origine,modulo:integer);
  VAR i:integer;
  BEGIN
   FOR i:=origine to origine + modulo do
     BEGIN
      gotoxy(i,riga-1);
      IF (i=vc div 2) THEN WRITE ('-')
                      ELSE WRITE ('-');
      gotoxy (i, riga+1);
      IF (i=vc div 2) THEN WRITE ('-')
                      ELSE WRITE ('-');
     END;
  END;

  BEGIN
   frasenew:='*'+fraselab+'*';
   delay(100);
   lunfrasnew:=length(frasenew);
   x1:=1; x2:=2;
   str1:=frasenew; str2:=frasenew;
   halfncol:=ncol div 2;
   margsx:=(vcol div 2)-halfncol;
   IF (margsx<1) THEN margsx:=1;
   IF (lunfrasnew>=halfncol) THEN BEGIN
                                    Linea (vcol,margsx,2*halfncol);
                                    x1:=x2;
                                  END;
   repeat
    lung:=length(str1);
    col:=(vcol div 2)-lung;
    If (col<margsx) THEN col:=margsx;
    gotoxy(col,riga);
    dastampa:=copy(str1,1,halfncol)+'l'+copy(str2,1,halfncol);
    WRITE (dastampa);
    IF (x2>x1) THEN linea(vcol,col,2*lung);
    x1:=length(str1);
    str1:=str1+copy(str1,lung-lunfrasnew+1,1);
    IF (col=margsx) THEN str1:=copy(str1,2,lung);
    x2:=length(str1);
    str2:=copy(str2,lunfrasnew,1)+str2;
    delay((11-velo)*50);
   until keypressed;
  END;

 BEGIN {--------- MAIN ---------}
  CLRSCR;
  TextBackground (0); TextColor (14);
  InputDati(frase,vidcol,colonne,velox);
  Schermata(colonne);
  Muovifrase(frase,vidcol,colonne,velox);
  CLRSCR;
 END.