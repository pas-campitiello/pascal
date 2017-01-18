PROGRAM calendario_perpetuo;
USES crt,printer;
VAR
 gi,mi,ai:      LONGINT;          (*Giorno mese e anno inserito*)
 da:            LONGINT;          (*Differenza anni*)
 bis:           LONGINT;          (*Anni bisestili*)
 k:             INTEGER;          (*Contatore*)
 gsp:           LONGINT;          (*Giorni settimana passati*)
 gp:            LONGINT;          (*Giorni passati*)
 gmes:ARRAY [1..12] OF INTEGER;   (*Array giorni mese*)
 gset:ARRAY [0..6] OF STRING;     (*Array giorni settimana*)
 nmes:ARRAY [1..12] OF STRING;    (*Array nome dei mesi*)
 scelta:        CHAR;             (*Continuare ?*)
 gi2:           INTEGER;          (*Contatore giorni per calendario*)
 y:             INTEGER;          (*Posizionameto verticale con il GOTOXY*)
 stampa:        CHAR;             (*Scelta del mezzo Output*)

CONST
 gb=1;                            (*Giorno mese base*)
 mb=1;                            (*Mese base*)
 ab=-116;                         (*Anno Base*)
 gs=0;                            (*Giorno della settimana base*)





PROCEDURE init;                   (*Assegnamento array*)
BEGIN
 gset[0]:='Lunedç';
 gset[1]:='Martedç';
 gset[2]:='Mercoledç';
 gset[3]:='Giovedç';
 gset[4]:='Venerdç';
 gset[5]:='Sabato';
 gset[6]:='Domenica';
 nmes[1]:='Gennaio';
 nmes[2]:='Febbraio';
 nmes[3]:='Marzo';
 nmes[4]:='Aprile';
 nmes[5]:='Maggio';
 nmes[6]:='Giugno';
 nmes[7]:='Luglio';
 nmes[8]:='Agosto';
 nmes[9]:='Settembre';
 nmes[10]:='Ottobre';
 nmes[11]:='Novembre';
 nmes[12]:='Dicembre';
 gmes[1]:=31;
 gmes[2]:=28;
 gmes[3]:=31;
 gmes[4]:=30;
 gmes[5]:=31;
 gmes[6]:=30;
 gmes[7]:=31;
 gmes[8]:=31;
 gmes[9]:=30;
 gmes[10]:=31;
 gmes[11]:=30;
 gmes[12]:=31;
END;





PROCEDURE beeper;                 (*Souno di errore*)
BEGIN
   sound (900);
   delay (300);
   nosound;
END;

PROCEDURE calcolo;                (*Prima parte calcolo giorni passati
                                    comune alla scrittura dei giorni nel
                                    calendario e all'identificazione del
                                    giorno della settimana*)
 BEGIN
  da:=abs(ai-ab);
  IF ai MOD 100 = 0 THEN bis:=trunc(da DIV 4)+1    (*Calcolo anno bisestile
                                                     per i centenari*)
                    ELSE bis:=trunc(da DIV 4);     (*Calcolo anno bisistile
                                                     per qualsiasi altro
                                                     anno*)
  IF (ai MOD 4=0) AND (mi<=2) THEN bis:=bis-1;     (*Non viene aggiunto il
                                                     29 febbraio se l'anno ä
                                                     bisestile ma il mese
                                                     inserito ä minore o
                                                     uguale a febbraio*)
  gp:=(da*365)+bis;                                (*Calcolo dei giorni
                                                     passati in base alla
                                                     differenza tra l'anno
                                                     inserito e l'anno base,
                                                     con l'eventuale aggiunta
                                                     dei 29 febbraio per ogni
                                                     anno bisestile*)
  FOR k:=1 TO mi-1 DO gp:=gp+gmes[k];               (*Calcolo dei giorni
                                                      passati dal 1 gennaio
                                                      dell'anno inserito fino
                                                      al 31 del mese
                                                      precedente a quello
                                                      inserito*)
 END;






PROCEDURE disegna_calenda;                         (*Parte che disegna
                                                     l'intero calendario del
                                                     mese dell'anno immesso
                                                     su monitor*)
 BEGIN
  TextColor (red);
  GotoXY (29,16);
  WRITE (nmes[mi],' ',ai);
  WRITELN;WRITELN;
  TextColor (7);
  GotoXY (10,30);Write ('      Lun');
  GotoXY (10,32);Write ('      Mar');
  GotoXY (10,34);Write ('      Mer');
  GotoXY (10,36);Write ('      Gio');
  GotoXY (10,38);Write ('      Ven');
  GotoXY (10,40);Write ('      Sab');
  GotoXY (10,42);Write ('      Dom');
  WRITELN;
  gi2:=0;
  y:=19;
  init;
   REPEAT
    gi2:=gi2+1;
    IF gi2=gi THEN TextColor (blue);
    calcolo;
    gp:=gp+(gi2-1);
    gsp:=(gp MOD 7);
    CASE gsp OF
    0: BEGIN
        GotoXY (8,y);
        WRITE (gi2);
       END;
    1: BEGIN
        GotoXY (17,y);
        WRITE (gi2);
       END;
    2: BEGIN
        GotoXY (26,y);
        WRITE (gi2);
       END;
    3: BEGIN
        GotoXY (35,y);
        WRITE (gi2);
       END;
    4: BEGIN
        GotoXY (44,y);
        WRITE (gi2);
       END;
    5: BEGIN
        GotoXY (53,y);
        WRITE (gi2);
       END;
    6: BEGIN
        GotoXY (62,y);
        WRITE (gi2);
       END;
    END;
    TextColor (7);
    IF gsp=6 THEN y:=y+1;
    IF (mi=2) AND (ai MOD 4=0) AND (ai MOD 100<> 0) OR (ai MOD 4 = 0) AND
       (ai MOD 1000=0) AND (gi2=gmes[2]) THEN gmes[2]:=29;
   UNTIL gi2=gmes[mi];
 END;





PROCEDURE stampa_calenda;                          (*Parte che disegna
                                                     l'intero calendario del
                                                     mese dell'anno immesso
                                                     su stampante*)
 BEGIN
  WRITELN (lst,' ');
  WRITE (lst,nmes[mi],' ',ai);
  WRITELN (lst,' ');
  WRITELN (lst,' ');
  WRITELN (lst,' ');
  Write (lst,'Lun':10);
  Write (lst,'Mar':10);
  Write (lst,'Mer':10);
  Write (lst,'Gio':10);
  Write (lst,'Ven':10);
  Write (lst,'Sab':10);
  Write (lst,'Dom':10);
  WRITELN (lst,' ');
  WRITELN (lst,' ');
  gi2:=0;
  y:=17;
  init;
  gi2:=gi2+1;
  calcolo;
  gp:=gp+(gi2-1);
  gsp:=(gp MOD 7);
  CASE gsp OF
  0: BEGIN
      WRITE (lst,gi2:10);
     END;
  1: BEGIN
      WRITE (lst,gi2:20);
     END;
  2: BEGIN
        WRITE (lst,gi2:30);
     END;
  3: BEGIN
       WRITE (lst,gi2:40);
     END;
  4: BEGIN
       WRITE (lst,gi2:50);
     END;
  5: BEGIN
       WRITE (lst,gi2:60);
     END;
  6: BEGIN
      WRITE (lst,gi2:70);
     END;
  END;
  IF gsp=6 THEN WRITELN (lst,' ');
  REPEAT
   gi2:=gi2+1;
   calcolo;
   gp:=gp+(gi2-1);
   gsp:=(gp MOD 7);
   CASE gsp OF
    0: BEGIN
         WRITE (lst,gi2:10);
        END;
    1: BEGIN
        WRITE (lst,gi2:10);
       END;
    2: BEGIN
         WRITE (lst,gi2:10);
        END;
    3: BEGIN
         WRITE (lst,gi2:10);
        END;
    4: BEGIN
         WRITE (lst,gi2:10);
        END;
    5: BEGIN
          WRITE (lst,gi2:10);
        END;
    6: BEGIN
         WRITE (lst,gi2:10);
        END;
    END;
    IF gsp=6 THEN WRITELN (lst,' ');
    IF (mi=2) AND (ai MOD 4=0) AND (ai MOD 100<> 0) OR (ai MOD 4 = 0) AND
       (ai MOD 1000=0) AND (gi2=gmes[2]) THEN gmes[2]:=29;
   UNTIL gi2=gmes[mi];
  END;




                                (*M A I N   P R O G R A M*)




BEGIN
 REPEAT                                            (*Ciclo per la richiesta
                                                     di ripetizione*)
  REPEAT                                           (*Ciclo per controllare
                                                     se il giorno inserito
                                                     ä presente nel mese
                                                     inserito*)
   ClrScr;
   init;
   WRITELN ('                              Calendario Perpetuo ');
   WRITELN;
   WRITELN;
   WRITE ('Inserire il giorno: ');
   READLN (gi);;
   WRITELN;WRITE ('Inserire il mese: ');
   READLN (mi);
   WRITELN;WRITE ('Inserire l''anno: ');
   READLN (ai);
   IF (ai MOD 4 = 0) AND (ai MOD 100 <> 0) OR (ai MOD 4 = 0) AND
      (ai MOD 1000 = 0) THEN gmes[2]:=29;
   IF (gi<1) OR (gi>gmes[mi]) THEN beeper;
  UNTIL (gi>=1) AND (gi<=gmes[mi]);
  gmes[2]:=28;
  calcolo;
  gp:=gp+(gi-1);
  gsp:=(gp MOD 7);
  WRITELN;WRITELN;
  WRITE ('Il giorno della settimana corrispondenede al ',gi,
          ' ',nmes[mi],' ',ai,' ä ');
  TextColor (white);
  WRITELN (gset[gsp]);
  WRITELN;WRITELN;
  TextColor (7);
  WRITE ('Stampare il calendario su (M)onitor, su (S)tampante o ');
  WRITE ('(N)on stampare: ');
  READLN (stampa);
  IF Upcase(stampa)='S' THEN stampa_calenda;
  IF Upcase(stampa)='M' THEN Disegna_calenda;
  WRITELN;
  WRITELN;WRITELN;WRITELN;
  WRITE ('Desideri continuare (S/N): ');
  READLN (scelta);
 UNTIL UpCase(scelta)='N';
END.