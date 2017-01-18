uses graph,crt;
   TYPE
       mat1=array[1..3,1..3] of boolean;
       mat2=array[1..3,1..3] of boolean;
       vet1=array[1..11] of integer;
 var gd,gm,CHI,n_partite,partite,parziale:integer;
 var coordinate:mat1;
 var coordinate2:mat2;
 var casella,cont_true,conta2:integer;
    vincite1,vincite2,code:integer;
 var  fine,giocatore,salta1,salta2,anima,chibool:boolean;
 var scelta:char;
     nome1,nome2:string[8];
     no_scelta:vet1;

 var punti_dado1,punti_dado2:integer;
     giocatoreb:boolean;

             (* INIZIO PROCEDURE DADI *)

  procedure prese_dadi;
    var
        spostax,spostay:integer;
    begin

      delay(1000);

      spostax:=170;
      setcolor(14);
                       (*dado di partenza, "4"*)
      line(200-spostax,400,270-spostax,400);
      ellipse(270-spostax,395,270,0,5,5);
      line(275-spostax,395,275-spostax,325);
      ellipse(270-spostax,324,0,90,5,5);
      line(270-spostax,319,200-spostax,319);
      ellipse(199-spostax,324,90,180,5,5);
      line(194-spostax,325,194-spostax,393);
      ellipse(199-spostax,395,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250-spostax,370,14);

                        (*disegno 4 su dado di partenza*)
      setcolor(8);
      circle(205-spostax,330,3);
      setfillstyle(solidfill,8);floodfill(205-spostax,330,8);
      circle(265-spostax,330,3);floodfill(265-spostax,330,8);
      circle(205-spostax,388,3);floodfill(205-spostax,388,8);
      circle(265-spostax,388,3);floodfill(265-spostax,388,8);
      delay(3800);
                       (* cancella *)
       setcolor(2);
       rectangle(5,300,115,400);setfillstyle(solidfill,2);
       floodfill(50,302,2);


                       (*dado2*)
      spostax:=75;
      setcolor(14);

      line(200-spostax,400,270-spostax,400);
      ellipse(270-spostax,395,270,0,5,5);
      line(275-spostax,395,275-spostax,325);
      ellipse(270-spostax,324,0,90,5,5);
      line(270-spostax,319,200-spostax,319);
      ellipse(199-spostax,324,90,180,5,5);
      line(194-spostax,325,194-spostax,393);
      ellipse(199-spostax,395,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250-spostax,370,14);
      setcolor(8);line(220-spostax,325,220-spostax,393);
       delay(390);
      setcolor(2);
       rectangle(118,300,200,400);setfillstyle(solidfill,2);
       floodfill(140,302,2);

                       (*dado3*)
      spostax:=-15;
      setcolor(14);

      line(200-spostax,400,270-spostax,400);
      ellipse(270-spostax,395,270,0,5,5);
      line(275-spostax,395,275-spostax,325);
      ellipse(270-spostax,324,0,90,5,5);
      line(270-spostax,319,200-spostax,319);
      ellipse(199-spostax,324,90,180,5,5);
      line(194-spostax,325,194-spostax,393);
      ellipse(199-spostax,395,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250-spostax,370,14);
      setcolor(8);line(250-spostax,325,250-spostax,393);
      delay(390);
      setcolor(2);
       rectangle(205,300,290,400);setfillstyle(solidfill,2);
       floodfill(250,302,2);

                     (*dado4*)
      spostax:=-100;
      setcolor(14);
      line(200-spostax,400,270-spostax,400);
      ellipse(270-spostax,395,270,0,5,5);
      line(275-spostax,395,275-spostax,325);
      ellipse(270-spostax,324,0,90,5,5);
      line(270-spostax,319,200-spostax,319);
      ellipse(199-spostax,324,90,180,5,5);
      line(194-spostax,325,194-spostax,393);
      ellipse(199-spostax,395,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250-spostax,370,14);
                         (*disegno 2 su dado4 *)
      setcolor(8);
      circle(205-spostax,330,4);
      setfillstyle(solidfill,8);floodfill(205-spostax,330,8);
      circle(265-spostax,388,4);floodfill(265-spostax,388,8);


  end;





  procedure animazione(var punti_dado1,punti_dado2:integer;
                       giocatoreb:boolean);
   var
      PUNTEGGIO:INTEGER;
      spostax,spostay:integer;
   begin

      randomize;
      punteggio:=random(6);
    if punteggio<>6 then
     begin

      if giocatoreb=true then
       punti_dado1:=punteggio
        else
          punti_dado2:=punteggio;

      cleardevice;
      setcolor(14);
                       (*dado di partenza, "4"*)
      line(200,400,270,400);
      ellipse(270,395,270,0,5,5);
      line(275,395,275,325);
      ellipse(270,324,0,90,5,5);
      line(270,319,200,319);
      ellipse(199,324,90,180,5,5);
      line(194,325,194,393);
      ellipse(199,395,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250,370,14);

                        (*disegno 4 su dado di partenza*)

      setcolor(8);
      circle(205,330,3);
      setfillstyle(solidfill,8);floodfill(205,330,8);
      circle(265,330,3);floodfill(265,330,8);
      circle(205,388,3);floodfill(205,388,8);
      circle(265,388,3);floodfill(265,388,8);
                        (*animazione dado che gira*)
      delay(1500);

      SETCOLOR(2);
      RECTANGLE(180,319,300,400);
      SETFILLSTYLE(SOLIDFILL,2);floodfill(200,395,2);


      spostax:=100;
      spostay:=90;
      setcolor(14);
      line(200+spostax,400-spostay,270+spostax,400-spostay);
      ellipse(270+spostax,395-spostay,270,0,5,5);
      line(275+spostax,395-spostay,275+spostax,325-spostay);
      ellipse(270+spostax,324-spostay,0,90,5,5);
      line(270+spostax,319-spostay,200+spostax,319-spostay);
      ellipse(199+spostax,324-spostay,90,180,5,5);
      line(194+spostax,325-spostay,194+spostax,393-spostay);
      ellipse(199+spostax,395-spostay,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250+spostax,370-spostay,14);

      setcolor(8);
      line(200+spostax,369-spostay,270+spostax,369-spostay);


      DELAY(280);  (*230*)

      SETCOLOR(2);
      RECTANGLE(180+spostax,319-spostay,300+spostax,400-spostay);
      SETFILLSTYLE(SOLIDFILL,2);floodfill(200+spostax,395-spostay,2);

      spostax:=100;spostay:=200;
      setcolor(14);
      line(200+spostax,400-spostay,270+spostax,400-spostay);
      ellipse(270+spostax,395-spostay,270,0,5,5);
      line(275+spostax,395-spostay,275+spostax,325-spostay);
      ellipse(270+spostax,324-spostay,0,90,5,5);
      line(270+spostax,319-spostay,200+spostax,319-spostay);
      ellipse(199+spostax,324-spostay,90,180,5,5);
      line(194+spostax,325-spostay,194+spostax,393-spostay);
      ellipse(199+spostax,395-spostay,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250+spostax,370-spostay,14);
      setcolor(8);
      line(200+spostax,359-spostay,270+spostax,359-spostay);


      DELAY(280);
      setcolor(2);
      RECTANGLE(180+spostax,319-spostay,300+spostax,400-spostay);
      SETFILLSTYLE(SOLIDFILL,2);floodfill(200+spostax,395-spostay,2);


      spostax:=150;spostay:=319;
      setcolor(14);
      line(200+spostax,400-spostay,270+spostax,400-spostay);
      ellipse(270+spostax,395-spostay,270,0,5,5);
      line(275+spostax,395-spostay,275+spostax,325-spostay);
      ellipse(270+spostax,324-spostay,0,90,5,5);
      line(270+spostax,319-spostay,200+spostax,319-spostay);
      ellipse(199+spostax,324-spostay,90,180,5,5);
      line(194+spostax,325-spostay,194+spostax,393-spostay);
      ellipse(199+spostax,395-spostay,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250+spostax,370-spostay,14);
      setcolor(8);
      line(200+spostax,339-spostay,270+spostax,339-spostay);


                    (*ЄDADO "FINALE E VISIBILE"*)

      DELAY(500);

      setcolor(2);
      RECTANGLE(180+spostax,319-spostay,300+spostax,400-spostay);
      SETFILLSTYLE(SOLIDFILL,2);floodfill(200+spostax,395-spostay,2);
      SPOSTAX:=250;SPOSTAY:=(220);
      setcolor(14);
      line(200+spostax,400-spostay,270+spostax,400-spostay);
      ellipse(270+spostax,395-spostay,270,0,5,5);
      line(275+spostax,395-spostay,275+spostax,325-spostay);
      ellipse(270+spostax,324-spostay,0,90,5,5);
      line(270+spostax,319-spostay,200+spostax,319-spostay);
      ellipse(199+spostax,324-spostay,90,180,5,5);
      line(194+spostax,325-spostay,194+spostax,393-spostay);
      ellipse(199+spostax,395-spostay,160,270,5,5);
      setfillstyle(solidfill,14);floodfill(250+spostax,370-spostay,14);

      setcolor(8);
      line(200+spostax,400-spostay,270+spostax,400-spostay);
      ellipse(270+spostax,395-spostay,270,0,5,5);
      line(275+spostax,395-spostay,275+spostax,325-spostay);
      ellipse(270+spostax,324-spostay,0,90,5,5);
      line(270+spostax,319-spostay,200+spostax,319-spostay);
      ellipse(199+spostax,324-spostay,90,180,5,5);
      line(194+spostax,325-spostay,194+spostax,393-spostay);
      ellipse(199+spostax,395-spostay,160,270,5,5);

                   (*disegno del punteggio*)

      setcolor(8);
      setfillstyle(solidfill,8);
     case punteggio of
      0 : begin
           circle(485,140,5);
           floodfill(485,140,8);
          end;

      1 : begin
           circle(460,115,5);
           circle(510,165,5);
           floodfill(460,115,8);
           floodfill(510,165,8);
          end;

      2 : begin
           circle(460,115,5);
           circle(510,165,5);
           circle(485,140,5);
           floodfill(460,115,8);
           floodfill(510,165,8);
           floodfill(485,140,8);
          end;

      3 : begin
           circle(460,115,5);
           floodfill(460,115,8);
           circle(510,115,5);
           floodfill(510,115,8);
           circle(510,165,5);
           floodfill(510,165,8);
           circle(460,165,5);
           floodfill(460,165,8);
          end;

       4 : begin
            circle(460,115,5);
            floodfill(460,115,8);
            circle(510,115,5);
            floodfill(510,115,8);
            circle(510,165,5);
            floodfill(510,165,8);
            circle(460,165,5);
            floodfill(460,165,8);
            circle(485,140,5);
            floodfill(485,140,8);
           end;

        5 : begin
             circle(460,115,5);
             floodfill(460,115,8);
             circle(510,115,5);
             floodfill(510,115,8);
             circle(510,165,5);
             floodfill(510,165,8);
             circle(460,165,5);
             floodfill(460,165,8);

             circle(460,140,5);
             floodfill(460,140,8);
             circle(510,140,5);
             floodfill(510,140,8);
            end;
     end;
  end;
   end;



  procedure tira_giocatore1(VAR punti_dado1:integer;
                            var giocatoreb:boolean);
    VAR
       CONTINUA:CHAR;
       ENTER:CHAR;
    begin
      giocatoreb:=true;     (*true=gioc1*)
      cleardevice;
      settextstyle(0,0,1);
       setcolor(12);
       outtextxy(150,200,'Giocatore n.1 premi >ENTER<  per tirare');
       delay(2000);
       REPEAT
        Setcolor(4);TEXTcolor(2);
        outtextxy(150,200,'Giocatore n.1 premi >ENTER<  per tirare');
        ENTER:=upcase(readkey);
          if ENTER=#0 then
           begin
            ENTER:=readkey;
            gotoxy(1,1);readln(ENTER);
           end;
        UNTIL (ENTER=CHR(13));

  animazione(punti_dado1,punti_dado2,giocatoreb);
       SETCOLor(15);
        REPEAT
         sound(3000);delay(1000);nosound;
         settextstyle(2,0,5);outtextxy(450,430,'PREMI >C< PER CONTNUARE');
                           outtextxy(450,440,'------------------------');
         CONTINUA:=upcase(readkey);
          if continua=#0 then
           begin
            continua:=readkey;
            gotoxy(1,1);readln(CONTINUA);
           end;
        UNTIL (CONTINUA=('C')) OR (continua=('c'));

     end;


    procedure tira_giocatore2( VAR punti_dado2:integer;
                               var giocatoreb:boolean);
     var
       ENTER2,CONTINUA2:char;

     begin
      giocatoreb:=false;       (*fALSE :gioc. 2*)
      cleardevice;

       settextstyle(0,0,1);
       setcolor(11);textcolor(2);
       outtextxy(150,200,'Giocatore n.2 premi >ENTER<  per tirare');
       delay(2000);
       repeat
        setcolor(1);
        outtextxy(150,200,'Giocatore n.2 premi >ENTER<  per tirare');
        ENTER2:=upcase(readkey);
          if ENTER2=#0 then
           begin
            ENTER2:=readkey;
            gotoxy(1,1);readln(ENTER2);
           end;
      UNTIL (ENTER2=CHR(13));


       animazione(punti_dado1,punti_dado2,giocatoreb);

       SETCOLor(15);
        REPEAT
         sound(3000);delay(1000);nosound;
         settextstyle(2,0,5);outtextxy(450,430,'PREMI >C< PER CONTNUARE');
                           outtextxy(450,440,'------------------------');
         CONTINUA2:=upcase(readkey);
          if continua2=#0 then
           begin
            continua2:=readkey;
            gotoxy(1,1);readln(CONTINUA2);
           end;
        UNTIL (CONTINUA2=('C')) OR (continua2=('c'));
     end;

                   (* FINE PROCEDURE DADI *)


   procedure faccette(anima:boolean);
      VAR
        A,B:INTEGER;
  begin
      gd:=detect;
  initgraph(gd,gm,' ');
  if graphresult <> grok then  halt(1);
            (*       C  E  R  C  H  I  O             *)
      setcolor(2);
      ellipse(150,200,0,360,145,183);
      ellipse(150,200,0,360,115,143);
      setfillstyle(solidfill,2);floodfill(150,200,2);
      setcolor(4);
      ellipse(150,200,0,360,145,183);
      ellipse(150,200,0,360,115,143);
       setfillstyle(solidfill,4);floodfill(50,100,4);

       SETCOLOR(15);
       ELLIPSE(110,140,0,360,30,10);
       ELLIPSE(190,140,0,360,30,10);
       SETFILLSTYLE(SOLIDFILL,15);
       FLOODFILL(120,140,15);FLOODFILL(210,140,15);

       SETCOLOR(6);
       CIRCLE(110,140,9);CIRCLE(190,140,9);
       setfillstyle(solidfill,6);floodfill(110,140,6);
       FLOODFILL(190,140,6);

       SETCOLOR(15);
       ELLIPSE(145,245,180,360,50,40);

       SETCOLOR(0);
       CIRCLE(110,140,3);CIRCLE(190,140,3);
       SETFILLSTYLE(SOLIDFILL,0);
       floodfill(110,140,0);
       FLOOdfill(190,140,0);


       SETCOLOR(0);
       ELLIPSE(110,140,0,360,30,10);
       ELLIPSE(190,140,0,360,30,10);
                         (*   X        X       X   *)

      SETCOLOR(2);LINE(630,20,330,380);
      LINE(630,20,525,20);LINE(330,380,225,380);
      LINE(525,20,225,380);

      LINE(230,20,530,380);
      LINE(230,20,335,20);LINE(530,380,635,380);
      LINE(335,20,635,380);
      SETFILLSTYLE(SOLIDFILL,2);
      FLOODFILL(563,25,2);FLOODFILL(500,300,2);FLOODFILL(450,200,2);
      FLOODFILL(310,50,2);FLOODFILL(300,330,2);

                (*OCCHI*)
      SETCOLOR(15);
      ELLIPSE(370,120,0,360,30,9);
      ELLIPSE(490,120,0,360,30,9);
      setfillstyle(solidfill,15);
       FLOODFILL(390,120,15);
      FLOODFILL(500,120,15);
      SETCOLOR(0);
      ELLIPSE(370,120,0,360,30,9);
      ELLIPSE(490,120,0,360,30,9);
      ELLIPSE(430,200,180,360,50,40);

      SETCOLOR(6);
       CIRCLE(110+263,120,8);CIRCLE(190+295,120,8);
       setfillstyle(solidfill,6);floodfill(110+263,120,6);
       FLOOdfill(190+295,120,6);

       SETCOLOR(0);
       CIRCLE(110+263,120,3);CIRCLE(190+295,120,3);
       SETFILLSTYLE(SOLIDFILL,0);
       floodfill(110+263,120,0);
       FLOOdfill(190+295,120,0);

                          (*non incazzati*)

       SETCOLOR(15);
       ELLIPSE(430,200,180,360,50,40);

       ELLIPSE(145,250,175,365,50,40);delay(3500);
       ELLIPSE(430,205,175,365,49,40);
       setfillstyle(solidfill,15);floodfill(430,242,15);
       floodfill(145,288,15);

       DELAY(8500);delay(1000);

      setbkcolor(0);
                        (*INCAZZATI*)

           (*cancellazione*)

       SETCOLOR(2);
      ELLIPSE(145,245,180,360,50,40);
      ellipse(430,200,180,360,50,40);
      ELLIPSE(145,245,180,360,50,60);
      ELLIPSE(430,200,180,360,50,60);

       ELLIPSE(430,200,180,360,50,40);

       ELLIPSE(145,250,175,365,50,40);delay(3500);
       ELLIPSE(430,205,175,365,49,40);
       setfillstyle(solidfill,2);floodfill(430,242,2);
       floodfill(145,288,2);

      (*ELLIPSE(145,250,175,365,50,40);
       ELLIPSE(430,205,175,365,50,40);*)

      SETCOLOR(15);
      CIRCLE(110,140,9);CIRCLE(190,140,9);
      setfillstyle(solidfill,15);floodfill(110,140,15);
      floodfill(190,140,15);

      CIRCLE(110+263,120,8);CIRCLE(190+295,120,8);
      SETFILLSTYLE(SOLIDFILL,15);
      floodfill(110+263,120,15);floodfill(190+295,120,15);

      SETCOLOR(15);
      ELLIPSE(370,120,0,360,30,9);
      ELLIPSE(490,120,0,360,30,9);
      setfillstyle(solidfill,15);
       FLOODFILL(390,120,15);
      FLOODFILL(500,120,15);

      SETCOLOR(6);
      ELLIPSE(370,120,0,360,30,9);
      ELLIPSE(490,120,0,360,30,9);

      SETCOLOR(6);
       ELLIPSE((110+263)-27,120,270,90,6,6);setfillstyle(solidfill,6);
       floodfill((110+263)-27,120,6);
       ELLIPSE((190+295)-19,120,270,90,6,6);
       FLOOdfill((190+295)-19,120,6);


      SETCOLOR(0);

       CIRCLE((110+263)-30,120,3);CIRCLE((190+295)-22,120,3);
       SETFILLSTYLE(SOLIDFILL,0);
       floodfill((110+263)-30,120,0);
       FLOOdfill((190+295)-22,120,0);


      ELLIPSE(370,120,0,360,29,10);
      ELLIPSE(490,120,0,360,29,10);

                    (*O*)

       SETCOLOR(6);
      ELLIPSE(110,140,0,360,30,9);
      ELLIPSE(190,140,0,360,30,9);


       SETCOLOR(0);
      ELLIPSE(370,120,0,360,30,9);
      ELLIPSE(490,120,0,360,30,9);


       SETCOLOR(6);
       ELLIPSE(110+23,140,90,270,6,6);setfillstyle(solidfill,6);

       ELLIPSE(190+23,140,90,270,6,6);
       FLOOdfill(190+23,140,6);
       floodfill(110+23,140,6);

       SETCOLOR(0);
       CIRCLE(110+25,140,3);CIRCLE(190+25,140,3);
       SETFILLSTYLE(SOLIDFILL,0);
       floodfill(110+25,140,0);
       FLOOdfill(190+25,140,0);

       SETCOLOR(0);
      ELLIPSE(110,140,0,360,29,10);
      ELLIPSE(190,140,0,360,29,10);

      setcolor(15);
      ellipse(115,265,90,270,20,20);
      line(115,245,200,270);line(200,270,115,285);
      SETFILLSTYLE(SOLIDFILL,15);FLOODFILL(115,265,15);

      (*denti*)
      SETCOLOR(0);
      line(100,252,100,278);
      line(115,245,115,285);
      line(115+15,249,115+15,283);
      line(115+30,254,115+30,280);
      line(115+45,258,115+45,278);
      line(115+60,262,115+60,274);

      setcolor(0);
      ellipse(115,265,90,270,20,20);
      line(115,245,200,270);line(200,270,115,285);


      setcolor(15);
      ellipse(455,230,270,90,20,20);
      line(455,210,400,230);line(400,230,455,250);
      FLOODFILL(455,230,15);

      (*denti*)
      SETCOLOR(0);
      line(455,210,455,250);line(455+15,217,455+15,243);
      line(455-15,216,455-15,244);
      line(455-30,221,455-30,239);
      line(455-45,227,455-45,233);

      setcolor(0);
      ellipse(455,230,270,90,20,20);
      line(455,210,400,230);line(400,230,455,250);
   end;

             (*RIDE o dopo la vittoria*)

  procedure RIDEO;
   begin
    setcolor(2);
   (*bocca*)
   ellipse(455,435,270,90,6,6);
   line(455,429,435,435);
   line(455,442,435,435);setfillstyle(solidfill,2);floodfill(455,435,2);

   line(457,430,457,440);
   line(453,430,453,440);
   line(449,430,449,440);
   line(445,432,445,438);
   line(442,434,442,437);

   setcolor(4);
   ellipse(445,435,180,0,9,7);
end;

 procedure  RIDEX;
   begin
    (*bocca*)
   setcolor(2);
   ellipse(85,420,90,270,6,6);
   (*denti*)
   line(100,420,85,415);line(100,420,85,425);
   setfillstyle(solidfill,2);floodfill(85,420,2);
   line(92,418,92,422);
   line(89,416,89,424);
   line(86,416,86,424);
   line(83,416,83,424);
   setcolor(4);
   ellipse(90,420,190,350,10,9);

  end;




   (*disegno tavolo da gioco*)

 PROCEDURE TAVOLO;
  begin

   setbkcolor(6);
   setcolor(2);
   line(150,307,180,100);line(180,100,450,100);line(450,100,475,307);
   line(475,300,150,300);
   setfillstyle(solidfill,2);floodfill(300,200,2);

    setcolor(2);
    line(150,307,150,320);line(150,320,475,320);line(475,320,475,307);
    setfillstyle(solidfill,2);floodfill(305,310,2);
    setcolor(8);line(150,305,475,305);line(150,307,180,100);
    line(180,100,450,100);
    line(450,100,475,307);line(475,305,150,305);line(150,307,150,320);
    line(150,320,475,320);line(475,320,475,307);

                               (*R E T I C O L O *)

     line(170,172,460,172);line(160,240,468,240);
     line(260,305,275,100);line(370,305,353,100);

       (* creaz. quadr. per i giocatori
    setlinestyle(dottedln,0,normwidth);*)
    setcolor(3);

    line(145,1,145,260);line(145,145,1,100);
    line(145,260,1,260);

    line(1,1,145,1);line(1,1,1,260);
     setfillstyle(widedotfill,3);floodfill(5,5,3);
     line(145,143,1,98);



       (* creaz. quadr. per i giocatori 2
    setlinestyle(dottedln,0,normwidth);*)
    setcolor(9);


    line(1,100,1,260);line(1,100,145,145);
    line(145,145,145,260);line(145,260,1,260);
    setfillstyle(widedotfill,9);floodfill(100,200,9);
        (* creazione tabella 3d con i GAME*)
    setcolor(7);
    line(200+15,40,400+15,40);
    line(200+15,90,400+15,90);

    line(200+15,40,200+15,90);
    line(400+15,40,400+15,90);
    (*3d*)
    line(200+15,40,210+15,30);
    line(400+15,40,390+15,30);
    line(210+15,30,390+15,30);
    setfillstyle(solidfill,7);
    floodfill(300,50,7);
    floodfill(300,32,7);


   setcolor(8);
    line(200+15,40,400+15,40);
    line(200+15,90,400+15,90);

    line(200+15,40,200+15,90);
    line(400+15,40,400+15,90);
    (*3d*)
    line(200+15,40,210+15,30);
    line(400+15,40,390+15,30);
    line(210+15,30,390+15,30);

    (*creazione assi tenuta*)
    line(250,30,250,1);line(270,30,270,1);
    line(250,1,270,1);

    line(350,30,350,1);line(370,30,370,1);
    line(350,1,370,1);
    setfillstyle(solidfill,8);
    floodfill(260,2,8);
    floodfill(360,2,8);

    (*CREAZIONE(bordi tondi*)
    setcolor(8);
    line(225,87,405,87);
    ellipse(224,82,160,270,5,5);
    ellipse(406,82,270,30,5,5);
    line(219,80,219,48);
    line(411,80,411,48);
    ellipse(224,48,90,180,5,5);
    ellipse(406,48,0,90,5,5);
    line(224,43,405,43);
    setfillstyle(solidfill,8);floodfill(300,75,8);
       (*SCRITTA TRIS3D*)

   SETCOLOR(5);
   SETTEXTSTYLE(1,1,6);
   OUTTEXTXY(580,5,'T  R  I  S   3 D');
 end;

  procedure o_presentazione;

  begin
   setcolor(2);
   ellipse(445,435,180,0,9,7);
   setcolor(2);
   ellipse(447,417,0,360,30,50);
   setcolor(2);
   ellipse(447,417,0,360,40,60);
   setfillstyle(solidfill,2);floodfill(447,417,2);
   setcolor(4);
   ellipse(447,417,0,360,30,50);
   ellipse(447,417,0,360,40,60);
   setcolor(8);
   setfillstyle(solidfill,4);
   floodfill(410,417,4);
    (*disegno lineam*)
  setcolor(8);
    (*occhi*)
   setcolor(15);
   ellipse(435,400,0,360,8,3);
   ellipse(460,400,0,360,8,3);
   setfillstyle(solidfill,15);floodfill(435,400,15);floodfill(460,400,15);

   setcolor(8);
   ellipse(435,400,0,360,8,3);
   ellipse(460,400,0,360,8,3);

   ellipse(430,400,0,360,3,2);setfillstyle(solidfill,8);floodfill(432,400,8);
   ellipse(455,400,0,360,3,2);floodfill(455,400,8);
   (*bocca*)
   setcolor(15);
   ellipse(455,435,270,90,6,6);
   line(455,429,435,435);
   line(455,442,435,435);setfillstyle(solidfill,15);floodfill(455,435,15);

   setcolor(8);
   ellipse(455,435,270,90,6,6);
   line(455,429,435,435);
   line(455,442,435,435);
   line(457,430,457,440);
   line(453,430,453,440);
   line(449,430,449,440);
   line(445,432,445,438);
   line(442,434,442,437);
   (*ciglia*)
   setcolor(8);
   line(430,383,445,395);
   line(450,395,463,384);

   ellipse(447,417,0,360,30,50);
   ellipse(447,417,0,360,40,60);

  end;

 Procedure X_PReSENTAZIONE;
  BEGIN
    setcolor(2);
    ellipse(90,420,178,2,10,9);
    setcolor(2);
    line(70,460,130,370);
    line(50,460,110,370);line(50,460,70,460);line(50,370,70,370);

    line(130,460,70,370);
    line(110,460,50,370);line(110,460,130,460);line(110,370,130,370);
    setfillstyle(solidfill,2);floodfill(65,459,2);
    floodfill(66,371,2);floodfill(115,371,2);
    floodfill(115,459,2);floodfill(90,410,2);
      (*contorno rosso*)
   setcolor(4);
    line(70,460,130,370);
    line(50,460,110,370);line(50,460,70,460);line(50,370,70,370);

    line(130,460,70,370);
    line(110,460,50,370);line(110,460,130,460);line(110,370,130,370);

    setcolor(2);
    line(90,430,99,416);
    setcolor(2);
    line(81,414,90,400);
    setcolor(2);
    line(81,416,90,430);
    line(101,417,90,400);

    (*occhi*)
    setcolor(15);
    ellipse(74,390,0,360,8,3);
    ellipse(108,390,0,360,8,3);
    setfillstyle(solidfill,15);floodfill(74,390,15);floodfill(108,390,15);
    setcolor(8);
    ellipse(74,390,0,360,8,3);
    ellipse(108,390,0,360,8,3);

    ellipse(80,390,0,360,3,2);setfillstyle(solidfill,8);floodfill(80,390,8);
   ellipse(113,390,0,360,3,2);floodfill(113,390,8);

   (*bocca*)
   setcolor(15);
   ellipse(85,420,90,270,6,6);
   line(100,420,85,415);line(100,420,85,425);
   setfillstyle(solidfill,15);floodfill(85,420,15);

   setcolor(8);
   (*denti*)
   ellipse(85,420,90,270,6,6);
   line(100,420,85,415);line(100,420,85,425);
   line(92,418,92,422);
   line(89,416,89,424);
   line(86,416,86,424);
   line(83,416,83,424);
   (*ciglia*)
   line(107,383,117,378);
   line(77,383,67,378);
  end;



 (* disegno delle x*)

 procedure X1;

 begin
  setcolor(4);
  (*prima parte*);
  line(250,113,185,157);line(250,113,255,117);line(255,117,190,163);line(190,163,185,157);
  setfillstyle(solidfill,4);floodfill(241,122,4);
   (*sec parte*);
   setcolor(4);
   line(200,117,240,162);line(200,117,207,113);line(207,113,248,157);
   line(248,157,240,162);setfillstyle(solidfill,4);
   floodfill(218,130,4);floodfill(225,142,4);
    (*3D*)
    line(185,157,185,165);line(190,163,190,168);line(190,168,185,165);
    line(190,168,220,147);  line(220,148,240,170)  ;line(248,157,248,165);
    line(240,162,240,170); line(240,170,248,165);
    line(200,117,200,126);line(200,126,211,138);
    line(255,117,255,125);line(255,125,230,143);
end;

procedure X2; (*+93*)
 begin
  setcolor(4);
  (*prima parte*)
  line(343,113,278,157);line(343,113,348,117);
  line(348,117,283,163);line(283,163,278,157);
  setfillstyle(solidfill,4);floodfill(334,122,4);
   (*sec parte*)
   setcolor(4);line(293,117,333,162);line(293,117,300,113);
   line(300,113,341,157);
   line(341,157,333,162);floodfill(311,130,4);floodfill(318,142,4);
    (*3d*)
    line(278,157,278,165);line(283,163,283,168);line(283,168,278,165);
    line(283,168,313,147);line(313,148,333,170);line(341,157,341,165);
    line(333,162,333,170);line(333,170,341,165);
    line(293,117,293,126);line(293,126,304,138);
    line(348,117,348,125);line(348,125,323,143);

end;

procedure X3; (*+93*)
 begin
  setcolor(4);
  (*prima parte*)
  line(436,113,371,157);line(436,113,441,117);line(441,117,376,163);line(376,163,371,157);
  setfillstyle(solidfill,4);floodfill(427,122,4);
   (*sec parte*)
   line(386,117,426,162);line(386,117,393,113);line(393,113,434,157);
   line(434,157,426,162);floodfill(405,130,4);floodfill(411,142,4);
    (*3d*)
    line(371,157,371,165);line(376,163,376,168);line(376,168,371,165);
    line(376,168,406,147);line(406,148,426,170);line(434,157,434,165);
    line(426,162,426,170);line(426,170,434,165);
    line(386,117,386,126);line(386,126,397,138);
    line(441,117,441,125);line(441,125,416,143);
 end;

procedure X4; (*y+70*)
 begin
  setcolor(4);
  (*prima parte*)
  line(250,183,185,157+70);line(250,113+70,255,117+70);line(255,117+70,190,163+70);
  line(190,163+70,185,157+70);setfillstyle(solidfill,4);floodfill(241,122+70,4);
   (*sec parte*)
   line(200,117+70,240,162+70);line(200,117+70,207,113+70);
   line(207,113+70,248,157+70);
   line(248,157+70,240,162+70);floodfill(218,200,4);floodfill(225,142+70,4);
    (*3d*)
    line(185,157+70,185,165+70);line(190,163+70,190,168+70);line(190,168+70,185,165+70);
    line(190,168+70,220,147+70);line(220,148+70,240,240);
    line(248,157+70,248,165+70);
    line(240,162+70,240,240);line(240,240,248,165+70);
    line(200,117+70,200,126+70);
    line(200,126+70,211,138+70);
    line(255,117+70,255,125+70);line(255,125+70,230,143+70);
end;

procedure X5; (*y+70*)
 begin
  setcolor(4);
  (*prima parte*)
  line(343,113+70,278,157+70);line(343,113+70,348,117+70);
  line(348,117+70,283,163+70);line(283,163+70,278,157+70);
  setfillstyle(solidfill,4);floodfill(334,122+70,4);
   (*sec parte*)
   line(293,117+70,333,162+70);line(293,117+70,300,113+70);
   line(300,113+70,341,157+70);line(341,157+70,333,162+70);
   floodfill(311,200,4);floodfill(318,142+70,4);
    (*3d*)
    line(278,157+70,278,165+70);line(283,163+70,283,168+70);
    line(283,168+70,278,165+70);line(283,168+70,313,147+70);
    line(313,148+70,333,170+70);line(341,157+70,341,165+70);
    line(333,162+70,333,170+70);line(333,170+70,341,165+70);
    line(293,117+70,293,126+70);line(293,126+70,304,138+70);
    line(348,117+70,348,125+70);line(348,125+70,323,143+70);
 end;

procedure X6;  (*y+70*)
 begin
  setcolor(4);
  (*prima parte*)
  line(436,183,371,227);line(436,183,441,187);line(441,187,376,233);
  line(376,233,371,227);
  setfillstyle(solidfill,4);floodfill(427,192,4);
   (*sec parte*)
   line(386,187,426,232);line(386,187,393,183);line(393,183,434,227);
   line(434,227,426,232);floodfill(405,200,4);floodfill(411,212,4);
    (*3d*)
    line(371,227,371,235);line(376,233,376,238);line(376,238,371,235);
    line(376,238,406,217);line(406,218,426,240);line(434,227,434,235);
    line(426,232,426,240);line(426,240,434,235);
    line(386,187,386,196);line(386,196,397,208);
    line(441,187,441,195);line(441,195,416,213);
 end;

 PROCEDURE X7;    (*y+130*)
 var
   y7:integer;
 begin
   y7:=129;
   setcolor(4);
   (*PRIMA PARTE*)
   line(250,113+y7,185,157+y7);line(250,113+y7,255,117+y7);
   line(255,117+y7,190,163+y7);line(190,163+y7,185,157+y7);
   setfillstyle(solidfill,4);floodfill(241,122+y7,4);
    (*sec parte*)
    line(200,117+y7,240,162+y7);line(200,117+y7,207,113+y7);
    line(207,113+y7,248,157+y7);line(248,157+y7,240,162+y7);
    floodfill(218,130+y7,4);floodfill(225,142+y7,4);
     (*3d*)
     line(185,157+y7,185,165+y7);line(190,163+y7,190,168+y7);
     line(190,168+y7,185,165+y7);line(190,168+y7,220,147+y7);
     line(220,148+y7,240,170+y7);
     line(248,157+y7,248,165+y7);line(240,162+y7,240,170+y7);
     line(240,170+y7,248,165+y7);line(200,117+y7,200,126+y7);
     line(200,126+y7,211,138+y7);line(255,117+y7,255,125+y7);
     line(255,125+y7,230,143+y7);
 end;

  procedure X8; (*y+129*)
   var
    y8:integer;
  begin
    y8:=129;
    (*prima parte*)
    setcolor(4);
    line(343,113+y8,278,157+y8);line(343,113+y8,348,117+y8);
    line(348,117+y8,283,163+y8);line(283,163+y8,278,157+y8);
    setfillstyle(solidfill,4);floodfill(338,122+y8,4);
     (*sec parte*)
     line(293,117+y8,333,162+y8);line(293,117+y8,300,113+y8);
     line(300,113+y8,341,157+y8);line(341,157+y8,333,162+y8);
     setfillstyle(solidfill,4);floodfill(322,130+y8,4);
     floodfill(322,142+y8,4);floodfill(310,130+y8,4);
      (*3d*)
      line(278,157+y8,278,165+y8);line(283,163+y8,283,168+y8);
      line(283,168+y8,278,165+y8);line(283,168+y8,313,147+y8);
      line(313,148+y8,333,170+y8);line(341,157+y8,341,165+y8);
      line(333,162+y8,333,170+y8);line(333,170+y8,341,165+y8);
      line(293,117+y8,293,126+y8);line(293,126+y8,304,138+y8);
      line(348,117+y8,348,125+y8);line(348,125+y8,323,143+y8);
  end;

 procedure X9; (*y+129*)
  var
   y9:integer;
 begin
   y9:=129;
   (*prima parte*)
   setcolor(4);
   line(436,113+y9,371,157+y9);line(436,113+y9,441,117+y9);
   line(441,117+y9,376,163+y9);line(376,163+y9,371,157+y9);
   setfillstyle(solidfill,4);floodfill(427,122+y9,4);
    (*sec. parte*)
    line(386,117+y9,426,162+y9);line(386,117+y9,393,113+y9);
    line(393,113+y9,434,157+y9);line(434,157+y9,426,162+y9);
    floodfill(405,130+y9,4);floodfill(411,142+y9,4);
     (*3d*)
     line(371,157+y9,371,165+y9);line(376,163+y9,376,168+y9);
     line(376,168+y9,371,165+y9);line(376,168+y9,406,147+y9);
     line(406,148+y9,426,170+y9);line(434,157+y9,434,165+y9);
     line(426,162+y9,426,170+y9);line(426,170+y9,434,165+y9);
     line(386,117+y9,386,126+y9);line(386,126+y9,397,138+y9);
     line(441,117+y9,441,125+y9);line(441,125+y9,416,143+y9);
 end;


 (*disegno delle o*)

procedure O1;   (*y-70,x-90*)
   var
    yo1:integer;
     xo1:integer;
begin
   yo1:=70;
   xo1:=10;
  setcolor(4);
  ellipse(210+xo1,200-yo1,0,360,23,12) ;ellipse(310-90,208-yo1,0,180,20,10);
  ellipse(310-90,200-yo1,0,360,35,26);setfillstyle(solidfill,4);floodfill(315-90,190-yo1,4);
  line(275-20,200-yo1,275-20,219-yo1);line(345-160,200-yo1,345-160,219-yo1  );
  ellipse(310-90,215-yo1,180,0,35,23);floodfill(300-90,235-yo1,4);
end;

procedure o2;
 var
   xo2:integer;
 begin
   xo2:=105;
   setcolor(4);
   ellipse(210+xo2,130,0,360,23,12);ellipse(315,138,0,180,20,10);
   ellipse(315,130,0,360,35,26);setfillstyle(solidfill,4);floodfill(300,125,4);
   line(245+xo2,130,245+xo2,149);line(280,130,280,148);
   ellipse(210+xo2,145,180,0,35,23);floodfill(210+xo2,235-70,4);
end;

procedure o3;
 var
   xo3:integer;
 begin
  xo3:=190;
  setcolor(4);
  ellipse(210+xo3,130,0,360,23,12);ellipse(210+xo3,138,0,180,20,10);
  ellipse(210+xo3,130,0,360,35,26);setfillstyle(solidfill,4);floodfill(400,125,4);
  line(245+xo3,130,245+xo3,149);line(175+xo3,130,175+xo3,148);
  ellipse(210+xo3,145,180,0,35,23);floodfill(210+xo3,235-70,4);
 end;

procedure o4;   (*y-140*)
 var
  yo4:integer;
   xo4:integer;
begin
 yo4:=20;
 xo4:=100;
  setcolor(4);
  ellipse(210,220-yo4,0,360,23,12);ellipse(310-xo4,208,0,180,20,10);
  ellipse(310-xo4,200,0,360,35,26);setfillstyle(solidfill,4);floodfill(315-xo4,190,4);
  line(275-xo4,200,275-100,219);line(345-xo4,200,345-xo4,219);
  ellipse(310-xo4,215,180,0,35,23);floodfill(300-xo4,235,4);
 end;

procedure o6;
 var
  yo6:integer;
   xo6:integer;
 begin
  yo6:=20;
  xo6:=200;
    setcolor(4);
    ellipse(210+xo6,220-yo6,0,360,23,12);ellipse(410,208,0,180,20,10);
    ellipse(410,200,0,360,35,26);setfillstyle(solidfill,4);floodfill(415,190,4);
    line(375,200,375,219);line(245+xo6,200,245+xo6,219);
    ellipse(410,215,180,0,35,23);floodfill(210+xo6,235,4);
 end;


procedure o7;(*y+70*)
 var
  yo7,xo7:integer;
begin
 yo7:=47;
 xo7:=100;
 setcolor(4);
 ellipse(205,220+yo7,0,360,23,12);ellipse(305-xo7,275,0,180,20,10);
 ellipse(305-xo7,267,0,360,35,26);setfillstyle(solidfill,4);floodfill(210,210+yo7,4);
 line(170,265,170,286);line(240,265,240,286);
 ellipse(305-xo7,281,180,0,35,23);floodfill(206,300,4);
end;

procedure o8;
 var
  yo8,xo8:integer;
 begin
  yo8:=47;
  xo8:=110;
  setcolor(4);
  ellipse(205+xo8,220+yo8,0,360,23,12);ellipse(315,275,0,180,20,10);
  ellipse(315,267,0,360,35,26);setfillstyle(solidfill,4);floodfill(210+xo8,210+yo8,4);
  line(170+xo8,265,170+xo8,286);line(240+xo8,265,240+xo8,286);
  ellipse(315,281,180,0,35,23);floodfill(206+xo8,300,4);
 end;

procedure o9;
 var
  yo9,xo9:integer;
 begin
  yo9:=47;
  xo9:=210;
  setcolor(4);
  ellipse(205+xo9,220+yo9,0,360,23,12);ellipse(415,275,0,180,20,10);
  ellipse(415,267,0,360,35,26);setfillstyle(solidfill,4);floodfill(210+xo9,210+yo9,4);
  line(170+xo9,265,170+xo9,286);line(240+xo9,265,240+xo9,286);
  ellipse(415,281,180,0,35,23);floodfill(206+xo9,300,4);
end;

procedure o5;
 begin
  setcolor(4);
  ellipse(310,200,0,360,23,12); ellipse(310,208,0,180,20,10) ;
  ellipse(310,200,0,360,35,26);setfillstyle(solidfill,4);floodfill(315,190,4);
  line(275,200,275,219); line(345,200,345,219);
  ellipse(310,215,180,0,35,23);setfillstyle(solidfill,4);floodfill(300,235,4);
 end;

 PROCEDURE CHI_INIZIA(VAR CHI:INTEGER;
                      punti_dado1,puntidado2:integer);
 BEGIN
                   (*chi=0 => gioc.1*)
    if (punti_dado1=punti_dado2) then
     begin
      RANDOMIZE ;
      CHI:=RANDOM(2);
     end;

     if (punti_dado1<>punti_dado2) then
      begin
       if (punti_dado1>punti_dado2)then
        chi:=0
         else
          chi:=1;
      end;
 END;

 procedure carica(var coordinate:mat1);

  var
    i,j:integer;
 begin

  for i:=1 to 3  do
    for j:=1 to 3   do
     begin
      coordinate[i,j]:=false;
    end;
 end;

 procedure carica_2(var coordinate2:mat2);

  var
    x,k:integer;
 begin
  for x:=1 to 3  do
    for k:=1 to 3   do
     begin
      coordinate2[x,k]:=false;
    end;
 end;

 procedure comunica_vincita(giocatore:boolean);

    VAR COLORE:INTEGER;
  begin
     settextstyle(0,0,2);

     SETCOLOR(6);
     outtextxy(35,330,'GIOC.Ы Ы CASELLA [1-9],zero=EXIT?:');

     IF GIOCATORE=TRUE THEN
     BEGIN
      ridex;
      COLORE:=0;
      REPEAT
       COLORE:=COLORE+1;
       SETCOLOR(COLORE);
         outtextxy(55+120,335,' HA VINTO ');
         OUTTEXTXY(210+130,335,NOME1);
       DELAY(1000);
      UNTIL COLORE=11;
    END;
    IF GIOCATORE=FALSE THEN
     BEGIN
      rideo;
      COLORE:=0;
      REPEAT
       COLORE:=COLORE+1;
       SETCOLOR(COLORE);
         outtextxy(55+120,335,' HA VINTO ');
         OUTTEXTXY(210+130,335,NOME2);
       DELAY(1000);
      UNTIL COLORE=11;
    END;
  END;

  procedure aggiorna_tabellone(vincite1,vincite2:integer);

  var
      vincite1str,vincite2str:string[5];

  begin
    SETTEXTSTYLE(0,0,1);
    str(vincite2,vincite2str);
    str(vincite1,vincite1str);
    setcolor(10);outtextxy(240,68,'Vittorie gioc. 1');
    setcolor(8);outtextxy(385,68,'ЫЫЫ');
    SETTEXTSTYLE(0,0,1);
    setcolor(12);outtextxy(385,68,vincite1str);
    setcolor(10);outtextxy(240,78,'Vittorie gioc. 2');
    setcolor(8);outtextxy(385,78,'ЫЫЫ');
    setcolor(12);outtextxy(385,78,vincite2str);
  end;

 PROCEDURE GIOCO1(var COORDINATE:MAT1; var fine:boolean;
                   var cont_true:integer;
                   var giocatore:boolean;nome1:string;
                   var no_scelta:vet1;var conta2:integer;
                   var salta1:boolean;var vincite1:integer;
                   partite,parziale,VINCITE2:integer);


   VAR j,casella:integer;
       partitestr,parzialestr:string[5];
       vincite1str,vincite2str:string[5];
 begin

   SETTEXTSTYLE(0,0,1);
   str(partite,partitestr);
   str(parziale,parzialestr);
   SETCOLOR(10);
   outtextxy(240,47,'Game totali ');
   setcolor(12);outtextxy(385,47,partitestr);
   setcolor(10);outtextxy(240,58,'Game attuale ');
   setcolor(12);outtextxy(385,58,parzialestr);

  SETTEXTSTYLE(0,0,1);
  str(vincite1,vincite1str);
  str(vincite2,vincite2str);
  setcolor(10);outtextxy(240,68,'Vittorie gioc. 1');
  setcolor(8);outtextxy(385,68,'ЫЫЫ');
  SETTEXTSTYLE(0,0,1);
  setcolor(12);outtextxy(385,68,vincite1str);
  setcolor(10);outtextxy(240,78,'Vittorie gioc. 2');
  setcolor(8);outtextxy(385,78,'ЫЫЫ');

  setcolor(12);outtextxy(385,78,vincite2str);

  if fine=false then

  begin
    setcolor(7);
    settextstyle(2,0,8);
    outtextxy(1,150,'Giocatore2');
    outtextxy(25,175,nome2);
   setcolor(15);
   settextstyle(2,0,8);
   outtextxy(1,5,'Giocatore1');
   outtextxy(25,30,nome1);
   SETCOLOR(14);
   OUTTEXTXY(5,219,'0');
   OUTTEXTXY(5,73,'X');
    SETCOLOR(7);


   SETCOLOR(9);
   settextstyle(0,0,2);
   outtextxy(35,330,'GIOC.1 Ы CASELLA [1-9],zero=EXIT?:');
    repeat
     settextstyle(0,0,2);
     setcolor(0);outtextxy(50,80,'ЫЫЫ');
     sound(1700); delay(150);nosound;
     gotoxy(9,6);textcolor(11);READLN(casella);
    until (casella=1) or   (casella=2) or    (casella=3) or  (casella=4) or
      (casella=5) or    (casella=6) or    (casella=7) or    (casella=8) or
        (casella=9) or (casella=0);
        if casella=0 then
         begin
          closegraph;
           textmode(2);
          textcolor(14);textbackground(1);
          write(' T   r  i  s  3D V2.0');
          textcolor(15);write('    w r i t t e n  By     ');
          textcolor(14);write('M a r c o  M o r n a t i ');
          textcolor(15);write(' 1995 ');
          HALT;
        end;

  conta2:=conta2+1;
   settextstyle(0,0,2);
   j:=0;
 if conta2>1 then
  begin
   repeat
    j:=j+1;
    if (no_scelta[j]=casella) then
     salta1:=true;
  until j=conta2-1;
 end;

 if salta1=false then
  begin

   CASE casella OF
   1 : begin
        coordinate[1,1]:=true;x1;
        cont_true:=cont_true+1;
       end;
   2:  begin
        coordinate[1,2]:=true;x2;
        cont_true:=cont_true+1;
       end;
   3 : begin
        coordinate[1,3]:=true;x3;
        cont_true:=cont_true+1;
       end;
   4 : begin
        coordinate[2,1]:=true;x4;
        cont_true:=cont_true+1;
       end;
   5 : begin
         coordinate[2,2]:=true;x5;
         cont_true:=cont_true+1;
       end;
   6 : begin
        coordinate[2,3]:=true;x6;
        cont_true:=cont_true+1;
       end;
   7 : begin
         coordinate[3,1]:=true;x7;
        cont_true:=cont_true+1;
       end;
   8 : begin
        coordinate[3,2]:=true; x8;
        cont_true:=cont_true+1;
       end;
   9 : begin
        coordinate[3,3]:=true;x9;
        cont_true:=cont_true+1;
       end;
    end;
 END;
end;
  if salta1=false then
   no_scelta[conta2]:=casella;
  if (conta2>1) and (fine=false) then
  begin
   j:=0;
   repeat
    j:=j+1;
    if (no_scelta[j]=casella) then
     BEGIN
     settextstyle(0,0,2);
     setcolor(0);outtextxy(50,80,'ЫЫЫ');
     setcolor(10);outtextxy(50,80,'err');
     delay(500);

      salta1:=false;
      conta2:=(conta2)-1;
      gioco1(coordinate,fine,cont_true,giocatore,nome1,NO_SCELTA,
      conta2,salta1,vincite1,partite,parziale,VINCITE2);
     end;

   until j=(conta2)-1;
 end;


                  (*comunicazione vincita *)
       if (coordinate[1,1]=true) and (coordinate[1,2]=true) and
         (coordinate[1,3]=true) then
           begin
             vincite1:=vincite1+1;
             giocatore:=true;
             comunica_vincita(giocatore);
             fine:=true;
           end;

             if (coordinate[2,1]=true) and (coordinate[2,2]=true) and
                 (coordinate[2,3]=true) then
                 begin
                   vincite1:=vincite1+1;
                   giocatore:=true;
                   comunica_vincita(giocatore);
                   fine:=true;
                  end;

           if (coordinate[3,1]=true) and (coordinate[3,2]=true) and
              (coordinate[3,3]=true) then
             begin
                  vincite1:=vincite1+1;
                  giocatore:=true;
                  comunica_vincita(giocatore);
                  fine:=true;
              end;

            if (coordinate[1,1]=true) and (coordinate[2,1]=true) and
               (coordinate[3,1]=true) then
               begin
                  vincite1:=vincite1+1;
                  giocatore:=true;
                   comunica_vincita(giocatore);
                  fine:=true;
              end;


              if (coordinate[1,2]=true) and (coordinate[2,2]=true) and
                 (coordinate[3,2]=true) then
               begin
                   vincite1:=vincite1+1;
                   giocatore:=true;
                   comunica_vincita(giocatore);
                  fine:=true;
              end;


               if (coordinate[1,3]=true) and (coordinate[2,3]=true) and
                  (coordinate[3,3]=true) then
                begin
                   vincite1:=vincite1+1;
                   giocatore:=true;
                   comunica_vincita(giocatore);
                  fine:=true;
                end;

                 if (coordinate[1,1]=true) and (coordinate[2,2]=true) and
                    (coordinate[3,3]=true) then
                  begin
                    vincite1:=vincite1+1;
                    giocatore:=true;
                   comunica_vincita(giocatore);
                   fine:=true;
                  end;

                   if (coordinate[1,3]=true) and (coordinate[2,2]=true) and
                      (coordinate[3,1]=true) then
                     begin
                       vincite1:=vincite1+1;
                       giocatore:=true;
                       comunica_vincita(giocatore);
                       fine:=true;
                     end;
       if cont_true=9 then
         begin
           fine:=true;
           exit;
         end;
  end;


  PROCEDURE GIOCO2(var COORDINATE2:MAT2; var fine:boolean;
                   var cont_true:integer;
                   var giocatore:boolean;nome2:string;
                   VAR NO_SCELTA:VET1;var conta2:integer;
                   var salta2:boolean;var vincite2:integer;
                   partite,parziale,VINCITE1:integer);

   VAR i,j,casella:integer;
       partitestr,parzialestr:string[5];
       vincite2str,vincite1str:string[5];
 begin
   setcolor(10);
   SETTEXTSTYLE(0,0,1);
   str(partite,partitestr);
   str(parziale,parzialestr);

   outtextxy(240,47,'Game totali ');
   setcolor(12);outtextxy(385,47,partitestr);
   setcolor(10);outtextxy(240,58,'Game attuale ');
   setcolor(12);outtextxy(385,58,parzialestr);

   SETTEXTSTYLE(0,0,1);
   str(vincite2,vincite2str);
   str(vincite1,vincite1str);
    setcolor(10);outtextxy(240,68,'Vittorie gioc. 1');
    setcolor(8);outtextxy(385,68,'ЫЫЫ');
   SETTEXTSTYLE(0,0,1);
   setcolor(12);outtextxy(385,68,vincite1str);
   setcolor(10);outtextxy(240,78,'Vittorie gioc. 2');
   setcolor(8);outtextxy(385,78,'ЫЫЫ');
   setcolor(12);outtextxy(385,78,vincite2str);


   (*inizio*)

   if fine=false then
    begin
    setcolor(7);
   settextstyle(2,0,8);
   outtextxy(1,5,'Giocatore1');
   outtextxy(25,30,nome1);

    setcolor(15);
    settextstyle(2,0,8);
   outtextxy(1,150,'Giocatore2');
   outtextxy(25,175,nome2);
   SETCOLOR(14);
   OUTTEXTXY(5,219,'0');
   OUTTEXTXY(5,73,'X');


   settextstyle(0,0,2);

    outtextxy(35,330,'GIOC.Ы 2 CASELLA [1-9],zero=EXIT?:');
    repeat
     settextstyle(0,0,2);
     setcolor(0);outtextxy(50,225,'ЫЫЫ');
     sound(700); delay(150);nosound;
     gotoxy(9,15);textcolor(11);READLN(casella);
    until (casella=1) or   (casella=2) or    (casella=3) or  (casella=4) or
      (casella=5) or    (casella=6) or    (casella=7) or    (casella=8) or
        (casella=9) or (casella=0);
        if casella=0 then
         begin
           closegraph;
           textmode(2);
           textcolor(14);textbackground(1);
           write(' T   r  i  s  3D V2.0');
           textcolor(15);write('    w r i t t e n  By     ');
           textcolor(14);write('M a r c o  M o r n a t i  ');
           textcolor(15);write(' 1995 ');
           HALT;
         end;

   conta2:=conta2+1;
   settextstyle(0,0,2);
 if conta2>1 then
 begin
  j:=0;
  repeat
    j:=j+1;
    if (no_scelta[j]=casella)  then
     salta2:=true;
  until j=(conta2)-1;
 end;

 if (salta2=false)  then
  begin

  CASE casella OF
   1 : begin
        coordinate2[1,1]:=true;o1;
        cont_true:=cont_true+1;
       end;
   2:  begin
        coordinate2[1,2]:=true;o2;
        cont_true:=cont_true+1;
       end;
   3 : begin
        coordinate2[1,3]:=true;o3;
        cont_true:=cont_true+1;
       end;
   4 : begin
        coordinate2[2,1]:=true;o4;
        cont_true:=cont_true+1;
       end;
   5 : begin
         coordinate2[2,2]:=true;o5;
        cont_true:=cont_true+1;
       end;
   6 : begin
        coordinate2[2,3]:=true;o6;
        cont_true:=cont_true+1;
       end;
   7 : begin
         coordinate2[3,1]:=true;o7;
        cont_true:=cont_true+1;
       end;
   8 : begin
        coordinate2[3,2]:=true; o8;
        cont_true:=cont_true+1;
       end;
   9 : begin
        coordinate2[3,3]:=true;o9;
        cont_true:=cont_true+1;
       end;
  end;

END;
END;
  if salta2=false then
   no_scelta[conta2]:=casella;

 if (conta2>1) and (fine=false) then
 begin
  j:=0;
   repeat
    j:=j+1;
    if (no_scelta[j]=casella) then
    BEGIN

     settextstyle(0,0,2);
     setcolor(0);outtextxy(50,225,'ЫЫЫ');
     setcolor(10);outtextxy(50,225,'err');
      delay(500);
      salta2:=false;
      conta2:=conta2-1;
     gioco2(coordinate2,fine,cont_true,giocatore,nome2,NO_SCELTA,
     conta2,salta2,vincite2,partite,parziale,VINCITE1);

    end;
  until j=(conta2)-1;
 end;


                        (*comunicazione vincita  *)
       if (coordinate2[1,1]=true) and (coordinate2[1,2]=true) and
         (coordinate2[1,3]=true) then
           begin
            vincite2:=vincite2+1;
            comunica_vincita(giocatore);
             fine:=true;
            end;

             if (coordinate2[2,1]=true) and (coordinate2[2,2]=true) and
                 (coordinate2[2,3]=true) then
                 begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                   fine:=true;
                  end;

           if (coordinate2[3,1]=true) and (coordinate2[3,2]=true) and
             (coordinate2[3,3]=true) then
             begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                  fine:=true;
              end;

            if (coordinate2[1,1]=true) and (coordinate2[2,1]=true) and
               (coordinate2[3,1]=true) then
               begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                  fine:=true;
               end;


              if (coordinate2[1,2]=true) and (coordinate2[2,2]=true) and
                 (coordinate2[3,2]=true) then
               begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                  fine:=true;
               end;


               if (coordinate2[1,3]=true) and (coordinate2[2,3]=true) and
                  (coordinate2[3,3]=true) then
                begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                  fine:=true;
                end;

                 if (coordinate2[1,1]=true) and (coordinate2[2,2]=true) and
                    (coordinate2[3,3]=true) then
                  begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                   fine:=true;
                  end;

                   if (coordinate2[1,3]=true) and (coordinate2[2,2]=true) and
                 (coordinate2[3,1]=true) then
                  begin
                   vincite2:=vincite2+1;
                   comunica_vincita(giocatore);
                   fine:=true;
                  end;

      if cont_true=9 then
        begin
         fine:=true;
         exit;
        end;
 end;

     (*      M     A    I    N             P    R    O    G    R    A    M   *)

 begin
   anima:=true;
  gd:=detect;
  initgraph(gd,gm,' ');
  if graphresult <> grok then  halt(1);
  setbkcolor(0);cleardevice;
                          (*PRESE*)
   SETCOLOR(4);
   SETtextstyle(3,0,8);
   outtextxy(10,50,'M');
   delay (100);
   Outtextxy(10,50,' A');
   Delay (100);
   Outtextxy(10,50,'  R');
   Delay (100);
   Outtextxy(10,50,'   C');
   Delay (100);
   Outtextxy(10,50,'    O');
   Delay (100);
   Outtextxy(10,50,'      M');
   Delay (100);
   Outtextxy(10,50,'       O');
   Delay (100);
   Outtextxy(10,50,'        R');
   Delay (100);
   Outtextxy(10,50,'         N');
   Delay (100);
   Outtextxy(10,50,'          A');
   Delay (100);
   Outtextxy(10,50,'           T');
   Delay (100);
   Outtextxy(10,50,'            I');
   Delay (100);
   SETCOLOR(15);
   OUTTEXTXY(160,180,'Presenta');
   delay(400);
   setcolor(4);
   OUTtextxy(00,300,' T R I S  3D V2.0');
   setcolor(14);
   delay(900);
   SETTEXTSTYLE(2,0,5);OUTTEXTXY(530,460,'Premere ENTER');
                       OUTTEXTXY(530,470,'-------------');


  readln;

 repeat
  faccette(anima);

  textbackground(0);
  SETCOLOR(15);
      SETTEXTSTYLE(2,0,5);
      OUTTEXTXY(347,140,'NOME PRIMO GIOCATORE ? ');
      TEXTCOLOR(14);
      repeat
       GOTOXY(51,11);READLN(NOME1);
       if nome1=('') then sound(500);delay(1000);nosound;
      until nome1<>('') ;

      SETCOLOR(1);
      OUTTEXTXY(60,180,'NOME SECONDO GIOCATORE ?');
      TEXTCOLOR(14);

      repeat
       GOTOXY(15,14);READLN(NOME2);
        if nome2=('') then sound(500);delay(1000);nosound;
      until nome2<>('') ;

      {If nome1 or nome2 = ('computer') then goto 15;}

 repeat
  SETCOLOR(1);
      SETTEXTSTYLE(0,0,2);
      OUTTEXTXY(347,368,'ЫЫЫЫЫЫЫЫЫЫ');
      sound(700);delay(1000);nosound;
      SETCOLOR(14);
      SETTEXTSTYLE(2,0,5);

      outtextxy(350,370,'Quanti GAME ?  -> ');
      TEXTCOLOR(14);

           GOTOXY(63,24);readln(n_partite);


 until n_partite>0;

 cleardevice;
 setcolor(15);
 SETBKCOLOR(0);CLEARDEVICE;
 settextstyle(2,0,9);
 bar3d(100,200,500,250,10,topon);
  gd:=0;
   repeat
    setcolor(15);
    outtextxy(150,210,'A t t e n d e r e');

    delay(1500);
    setcolor(0);
    outtextxy(150,210,'A t t e n d e r e');
     delay(700);
     gd:=gd+1;
   until gd=3;

 vincite1:=0;
 vincite2:=0;
 parziale:=1;
 partite:=n_partite;


 gd:=detect;
  initgraph(gd,gm,' ');
  if graphresult <> grok then  halt(1);
  SETBKCOLOR(2);
  cleardevice;
                 (* INIZIO DADI NEL  MAIN *)

  SETCOLOR(5);
  SETTEXTSTYLE(2,0,10);OUTTEXTXY(80,100,'A T T E N Z I O N E !!');
  settextstyle(2,0,6);
  outtextxy(100,140,'QUESTA SEZIONE E'' DEDICATA AL GIOCO DEI DADI');
  SETCOLOR(4);
  outtextxy(130,200,'chi fara'' piu'' punti lanciando il dado');
  outtextxy(140,230,'POTRA'' INIZIARE PER PRIMO A GIOCARE');
  DELAY(1500);setcolor(14);

  settextstyle(0,0,1);OUTTEXTXY(520,440,'PREMERE ENTER');
                      OUTTEXTXY(520,450,'-------------');
  READLN;
  setcolor(2);
  settextstyle(0,0,1);OUTTEXTXY(520,440,'PREMERE ENTER');
                      OUTTEXTXY(520,450,'-------------');
  prese_dadi;delay(7000);
  CLEARDEVICE;

  tira_giocatore1(punti_dado1,giocatoreb);
  tira_giocatore2(punti_dado2,giocatoreb);
  SETBKCOLOR(1);CLEARDEVICE;
  setcolor(15);
  settextstyle(0,0,2);
  if punti_dado1>punti_dado2 then
   begin
      outtextxy(170,180,' ------------------');
      outtextxy(170,200,'| HA VINTO         |');OUTTEXTXY(340,200,NOME1);
      OUTTEXTxy(170,220,' ------------------');
  END;

 if punti_dado2>punti_dado1 then
   begin
      outtextxy(170,180,' ------------------');
      outtextxy(170,200,'| HA VINTO         |');OUTTEXTXY(340,200,NOME2);
      OUTTEXTxy(170,220,' ------------------');
  END;

   if punti_dAdo1=punti_dado2 then
     begin
      outtextxy(165,200,'  P  A  R  I  T  A''');
      OUTTEXTXY(130,150,'Ora sceglier… il computer');
     end;
  setcolor(14);
  settextstyle(0,0,1);OUTTEXTXY(520,440,'PREMERE ENTER');
                      OUTTEXTXY(520,450,'-------------');
  delay(2000);
  readln;

              (*      FINE DADI NEL  MAIN      *)
  if anima=true then
    begin
     CHI_INIZIA(CHI,punti_dado1,punti_dado2);
    end;
  cleardevice;
 repeat
                              (*R  E  P  E  A  T *)
  cleardevice;

 SETTEXTSTYLE(5,0,5);
 SETCOLOR(15);
 outtextxy(505,460,'M  A  R  C  K');
 OUTTEXTXY(505,470,'S o f t  w a r e');

  tavolo;
  o_presentazione;
  x_presentazione;
  SETCOLOR(15);
  SETTEXTSTYLE(5,0,5);
  outtextxy(183,103,'1           2         3');
  outtextxy(173,175,'4            5          6');
  outtextxy(163,243,'7            8            9');
  SETCOLOR(14);

  SETCOLOR(15);
 outtextxy(505,460,'M  A  R  C  K');
 OUTTEXTXY(505,470,'S o f t  w a r e');
  conta2:=0;
  cont_true:=0;
  fine:=false;
  giocatore:=false;
  CARICA(COORDINATE);
  carica_2(coordinate2);
  salta1:=false;
  salta2:=false;

  if chi=0 then
  begin
   REPEAT
    gioco1(coordinate,fine,cont_true,giocatore,nome1,NO_SCELTA,
          conta2,salta1,vincite1,partite,parziale,VINCITE2);
    gioco2(coordinate2,fine,cont_true,giocatore,nome2,NO_SCELTA,
           conta2,salta2,vincite2,partite,parziale,VINCITE1);

   until fine=true;
   chibool:=true;
  end;
  if chi=1 then
  begin
    REPEAT
      gioco2(coordinate2,fine,cont_true,giocatore,nome2,NO_SCELTA,
          conta2,salta2,vincite2,partite,parziale,VINCITE1);
      gioco1(coordinate,fine,cont_true,giocatore,nome1,NO_SCELTA,
          conta2,salta1,vincite1,partite,parziale,VINCITE2);
    UNTIL FINE=TRUE;
    chibool:=false;
  end;
  N_partite:=n_partite-1;
  parziale:=parziale+1;
  aggiorna_tabellone(vincite1,vincite2);
    if CHIBOOL=TRUE THEN
      CHI:=1
       ELSE CHI:=0;



UNTIL N_PARTITE=0;


 settextstyle(0,0,3);
 sETCOLOR(0);OUTTEXTXY(35,330,'ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ');
 settextstyle(0,0,2);
 SETCOLOR(11);
 IF VINCITE1>VINCITE2 THEN
  BEGIN
    setcolor(11);
         outtextxy(55+90,335,'PARTITA VINTA DA');
         OUTTEXTXY(220+200,335,NOME1);
         RIDEX;
        END;
 IF VINCITE2>VINCITE1 THEN
   BEGIN
       rideo;
       setcolor(11);
         outtextxy(55+90,335,'PARTITA VINTA DA');
         OUTTEXTXY(220+200,335,NOME2);
         RIDEO;
  END;
  IF VINCITE2=VINCITE1 THEN
  BEGIN
    OUTTEXTXY(45+90,335,' P  A  R  I  T  A''!!!');

  END;
 REPEAT
  settextstyle(0,0,2);
  setcolor(0);outtextxy(155,368,'ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ');
  setcolor(15);
  settextstyle(2,0,6);
  outtextxy(188,368,'ALTRA PARTITA (S/N)');
  TEXTCOLOR(14);
  GOTOXY(48,24);readln(scelta);
 until  (scelta=('n')) OR ((SCELTA=('N')) OR (scelta=('S'))
   OR (SCELTA=('s')));

until  (scelta=('n')) OR (SCELTA=('N'));

 closegraph;
 textmode(2);
 textcolor(14);textbackground(1);
 write(' T   r  i  s  3D V2.0');
 textcolor(15);write('    w r i t t e n  By     ');
 textcolor(14);write('M a r c o  M o r n a t i ');
 textcolor(15);write(' 1995 ');

 end.



