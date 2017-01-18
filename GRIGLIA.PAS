Program griglia;
uses crt,graph;
var t,gd,gm,num:integer;
begin
 clrscr;
 gd:=9;
 gm:=2;
 initgraph (gd,gm,'c:\language\pascal');

 setbkcolor (black);
 cleardevice;
 setfillstyle (solidfill,lightgray);
 bar (5,5,639,35);
 setfillstyle (solidfill,blue);
 bar (0,0,630,30);
 setfillstyle (solidfill,white);   {  per uscire  }
 bar (17,12,23,18);
 setlinestyle (solidln,0,normwidth);
 setcolor (white);
 rectangle (13,8,27,22);

 setcolor (green);
 settextstyle (triplexfont,horizdir,2);
 settextjustify (lefttext,centertext);
 outtextxy (100,430,'Testo scritto in Sans Serif Font');
 setcolor (yellow);
 settextstyle (sansseriffont,horizdir,4);
 outtextxy (250,10,'Griglia');
 setcolor (blue);
 setlinestyle (solidln,0,normwidth);
 for t:=0 to 15 do                     { griglia  }
   line (95+t*30,70,95+t*30,370);
 for t:=0 to 10 do
   line (95,70+t*30,545,70+t*30);

 readln;
 closegraph;
end.