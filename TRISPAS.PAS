Program trisPAS;
uses crt,graph;
var Gd,Gm,c,x,y,cx,cy,code,i,j,gioca,posY,lin:integer;
    p1,p2:string;
    x1,y1,x2,y2,ris:char;
    mat:array[1..3,1..3] of char;
    vittX,vittY,coordX,coordY:boolean;

procedure inizializza;
begin
 Gd:=Detect;                          {Dimensioni risoluzione: 479x639}
 InitGraph(Gd,Gm,'C:\Tp7\Bgi');       {Cartella BGI}
 if GraphResult <> grOk then
                            begin
                             writeln('ERRORE DI INIZIALIZZAZIONE GRAFICA');
                             readln;
                             Halt(1);
                            end;
end;

procedure SETschermata;
begin
 setcolor(blue);                 {<- Inizio intestazione}
 Rectangle(0,0,GetMaxX,GetMaxY);
 setcolor(yellow);
 SetTextStyle(3,HorizDir,6);
 OutTextXY(120,0,'***');
 setcolor(red);
 OutTextXY(210,0,'T R I S');
 setcolor(yellow);
 OutTextXY(410,0,'***');
 setcolor(10);
 line(10,60,630,60);             {<- Fine intestazione}

 setcolor(white);                { <- Tris }
 line(150,100,150,400);          {   |     }
 line(250,100,250,400);          {      |  }
 line(50,200,350,200);           {    -    }
 line(50,300,350,300);           {    _    }
 SetTextStyle(0,HorizDir,1);
 OutTextXY(100,80,'1');
 OutTextXY(200,80,'2');
 OutTextXY(300,80,'3');
 OutTextXY(30,140,'a');
 OutTextXY(30,250,'b');
 OutTextXY(30,350,'c');

 setcolor(10);                 {<- Linea laterale}
 line(370,70,370,450);
end;

procedure disegna;
begin
 case gioca of
  1:begin
     setcolor(6);
     case cx of
      1: case cy of
          1:begin                           {a1}
             line(60,110,140,190);
             line(60,190,140,110);
            end;
          2:begin                           {a2}
             line(160,110,240,190);
             line(160,190,240,110);
            end;
          3:begin                           {a3}
             line(260,110,340,190);
             line(260,190,340,110);
            end;
         end;
      2: case cy of
          1:begin                           {b1}
             line(60,210,140,290);
             line(60,290,140,210);
            end;
          2:begin                           {b2}
             line(160,210,240,290);
             line(160,290,240,210);
            end;
          3:begin                           {b3}
             line(260,210,340,290);
             line(260,290,340,210);
            end;
         end;
      3: case cy of
          1:begin                           {c1}
             line(60,310,140,390);
             line(60,390,140,310);
            end;
          2:begin                           {c2}
             line(160,310,240,390);
             line(160,390,240,310);
            end;
          3:begin                           {c3}
             line(260,310,340,390);
             line(260,390,340,310);
            end;
         end;
     end;
    end;
  2:begin
     setcolor(cyan);
     case cx of
      1: case cy of
          1:circle(100,150,40);             {a1}
          2:circle(200,150,40);             {a2}
          3:circle(300,150,40);             {a3}
         end;
      2: case cy of
          1:circle(100,250,40);             {b1}
          2:circle(200,250,40);             {b2}
          3:circle(300,250,40);             {b3}
         end;
      3: case cy of
          1:circle(100,350,40);             {c1}
          2:circle(200,350,40);             {c2}
          3:circle(300,350,40);             {c3}
         end;
     end;
    end;
 end;
end;

procedure verificaVITT;
begin
 if (mat[1,1]='x') and (mat[1,2]='x') and (mat[1,3]='x') then begin
                                                               vittX:=true;
                                                               lin:=123;
                                                              end;
 if (mat[2,1]='x') and (mat[2,2]='x') and (mat[2,3]='x') then begin
                                                               vittX:=true;
                                                               lin:=456;
                                                              end;
 if (mat[3,1]='x') and (mat[3,2]='x') and (mat[3,3]='x') then begin
                                                               vittX:=true;
                                                               lin:=789;
                                                              end;
 if (mat[1,1]='x') and (mat[2,1]='x') and (mat[3,1]='x') then begin
                                                               vittX:=true;
                                                               lin:=147;
                                                              end;
 if (mat[1,2]='x') and (mat[2,2]='x') and (mat[3,2]='x') then begin
                                                               vittX:=true;
                                                               lin:=258;
                                                              end;
 if (mat[1,3]='x') and (mat[2,3]='x') and (mat[3,3]='x') then begin
                                                               vittX:=true;
                                                               lin:=369;
                                                              end;
 if (mat[1,1]='x') and (mat[2,2]='x') and (mat[3,3]='x') then begin
                                                               vittX:=true;
                                                               lin:=159;
                                                              end;
 if (mat[1,3]='x') and (mat[2,2]='x') and (mat[3,1]='x') then begin
                                                               vittX:=true;
                                                               lin:=357;
                                                              end;
 { 11 12 13    1 2 3
   21 22 23    4 5 6
   31 32 33    7 8 9 }

 if (mat[1,1]='o') and (mat[1,2]='o') and (mat[1,3]='o') then begin
                                                               vittY:=true;
                                                               lin:=123;
                                                              end;
 if (mat[2,1]='o') and (mat[2,2]='o') and (mat[2,3]='o') then begin
                                                               vittY:=true;
                                                               lin:=456;
                                                              end;
 if (mat[3,1]='o') and (mat[3,2]='o') and (mat[3,3]='o') then begin
                                                               vittY:=true;
                                                               lin:=789;
                                                              end;
 if (mat[1,1]='o') and (mat[2,1]='o') and (mat[3,1]='o') then begin
                                                               vittY:=true;
                                                               lin:=147;
                                                              end;
 if (mat[1,2]='o') and (mat[2,2]='o') and (mat[3,2]='o') then begin
                                                               vittY:=true;
                                                               lin:=258;
                                                              end;
 if (mat[1,3]='o') and (mat[2,3]='o') and (mat[3,3]='o') then begin
                                                               vittY:=true;
                                                               lin:=369;
                                                              end;
 if (mat[1,1]='o') and (mat[2,2]='o') and (mat[3,3]='o') then begin
                                                               vittY:=true;
                                                               lin:=159;
                                                              end;
 if (mat[1,3]='o') and (mat[2,2]='o') and (mat[3,1]='o') then begin
                                                               vittY:=true;
                                                               lin:=357;
                                                              end;
 c:=c+1;
end;

procedure verificaCOORDx(coX:char);
begin
 coordX:=false;
 if coX='a' then cx:=1;
 if coX='b' then cx:=2;
 if coX='c' then cx:=3;
 if ((coX='a') or (coX='b') or (coX='c')) and
    ( ((mat[cx,1]<>'o') and (mat[cx,1]<>'x')) or
      ((mat[cx,2]<>'o') and (mat[cx,2]<>'x')) or
      ((mat[cx,3]<>'o') and (mat[cx,3]<>'x')) ) then coordX:=true;
end;

procedure verificaCOORDy(coY:char);
begin
 coordY:=false;
 val(coY,cy,code);
 if ((coY='1') or (coY='2') or (coY='3')) and
    ((mat[cx,cy]<>'o') and (mat[cx,cy]<>'x')) then coordy:=true;
end;

procedure azzeraMAT;
begin
 for i:=1 to 3 do
  for j:=1 to 3 do
   mat[i,j]:=' ';
end;

{ M A I N }

begin
 clrscr;
 textcolor(yellow);
 writeln;
 writeln('              ****************************');
 writeln;
 textcolor(red);
 writeln('               ±±±±±±±  ±±±±±   ±   ±±±±±');
 writeln('                  ±     ±    ±  ±  ±');
 writeln('                  ±     ±±±±±±  ±  ±±±±±');
 writeln('                  ±     ±   ±   ±       ±');
 writeln('                  ±     ±    ±  ±  ±±±±±');
 writeln;
 textcolor(yellow);
 writeln('              ****************************');
 textcolor(green);
 gotoxy(50,2);
 writeln('       º      º');
 gotoxy(50,3);
 writeln('       º      º');
 gotoxy(50,4);
 writeln('       º      º');
 gotoxy(50,5);
 writeln('ÍÍÍÍÍÍÍÎÍÍÍÍÍÍÎÍÍÍÍÍÍÍ');
 gotoxy(50,6);
 writeln('       º      º');
 gotoxy(50,7);
 writeln('       º      º');
 gotoxy(50,8);
 writeln('       º      º');
 gotoxy(50,9);
 writeln('ÍÍÍÍÍÍÍÎÍÍÍÍÍÍÎÍÍÍÍÍÍÍ');
 gotoxy(50,10);
 writeln('       º      º');
 gotoxy(50,11);
 writeln('       º      º');
 gotoxy(50,12);
 writeln('       º      º');
 textcolor(white);
 gotoxy(59,6);
 writeln('*');
 gotoxy(62,6);
 writeln('*');
 gotoxy(60,7);
 writeln('*');
 gotoxy(61,7);
 writeln('*');
 gotoxy(59,8);
 writeln('*');
 gotoxy(62,8);
 writeln('*');
 gotoxy(5,13);
 write('Nome del giocatore nø 1: ');
 textcolor(6);
 readln(p1);
 textcolor(white);
 gotoxy(5,15);
 write('Nome del giocatore nø 2: ');
 textcolor(6);
 readln(p2);
 writeln;
 textcolor(blue);
 writeln('--> Inizia a giocare ',p1,' con segno X');
 readln;

 repeat
  inizializza;
  cleardevice;
  azzeraMAT;
  SETschermata;

  setcolor(12);
  SetTextStyle(0,HorizDir,1);
  OutTextXY(380,75,'- MOSSE (');
  setcolor(14);
  OutTextXY(450,75,'lettera,numero');
  setcolor(12);
  OutTextXY(565,75,') -');

  SetTextStyle(2,HorizDir,6);

  c:=0;
  gioca:=1;
  posY:=110;
  lin:=0;
  vittX:=false;
  vittY:=false;

  repeat
   if gioca=1 then begin
                    setcolor(6);
                    OutTextXY(390,posY-15,'Coordinate '+p1+':')
                   end
              else begin
                    setcolor(cyan);
                    OutTextXY(390,posY-15,'Coordinate '+p2+':');
                   end;
   setcolor(white);

   repeat
    x1:=ReadKey;
    verificaCOORDx(x1);
   until coordX=true;
   OutTextXY(400,posY,x1);

   repeat
    y1:=ReadKey;
    verificaCOORDy(y1);
   until coordY=true;
   OutTextXY(410,posY,y1);
   readln;

   disegna;

   if gioca=1 then
                  begin
                   mat[cx,cy]:='x';
                   gioca:=2;
                  end
              else
                  begin
                   mat[cx,cy]:='o';
                   gioca:=1;
                  end;
   verificaVITT;

   posY:=posY+35;

  until vittX or vittY or (c=9);

  setcolor(yellow);
  case lin of
   123:line(50,150,350,150);
   456:line(50,250,350,250);
   789:line(50,350,350,350);
   147:line(100,100,100,400);
   258:line(200,100,200,400);
   369:line(300,100,300,400);
   159:line(50,100,350,400);
   357:line(350,100,50,400);
  end;

  SetColor(12);
  SetTextStyle(0,HorizDir,1);
  if vittX then begin
                 OutTextXY(380,420,p1+' ha vinto!');
                 OutTextXY(380,430,'COMPLIMENTI!');
                end;
  if vittY then begin
                 OutTextXY(380,420,p2+' ha vinto!');
                 OutTextXY(380,430,'COMPLIMENTI!');
                end;
  if not(vittX) and not(vittY) then OutTextXY(380,420,'PAREGGIO!');

  OutTextXY(380,450,'Nuova partita (s/n)?');
  repeat
   ris:=ReadKey;
  until (ris='s') or (ris='n') or (ris='S') or (ris='N');
  OutTextXY(550,450,ris);
  readln;

 until (ris='n') or (ris='N');

 CloseGraph;
end.

