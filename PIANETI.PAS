program pianeti;
uses crt,graph;
const
  centrox=320;
  centroy=240;
var
  x1sa,y1sa,xsa,ysa,x1,y1,z1,x,y,i,j,k,k1,gd,gm,r1,sx,sy:integer;
  wt,wl,xl,yl,zl,Rst,rtl,xt,yt,zt:real;
  is:string;
  pl,pt:pointer;
  moto:boolean;
  ch:char;

procedure getcursor(x,y,x1,y1:integer;var p:pointer);
var
  size:word;
begin
  size:=imagesize(x,y,x1,y1);
  getmem(p,size);
  getimage(x,y,x1,y1,p^);
end;

begin
  clrscr;
  gd:=detect;
  initgraph(gd,gm,'');
  Rst:=1.495*exp(ln(10)*6);
  Rtl:=0.38*exp(ln(10)*6);

  i:=0;                                                 { STELLE }
  repeat
    inc(i);
    sx:=random(640);  sy:=random(480);
    putpixel(sx,sy,white);
  until i=50;

  settextstyle(3,0,4);
  settextjustify(centertext,centertext);
  outtextxy(320,30,'Moto TERRA-LUNA');
  settextstyle(3,0,3);
  outtextxy(40,450,'Giorni :');

  setcolor(yellow);                                     { SOLE }
  setfillstyle(solidfill,yellow);
  circle(centrox,centroy,27);
  floodfill(centrox,centroy,yellow);

  moto:=false;
  i:=0;
  k:=0;
  x1sa:=-1000;
  xsa:=-1000;
  y1sa:=-1000;
  ysa:=-1000;

  repeat
    i:=i+1;
    wt:=2*pi/365;
    wl:=2*pi/28;
    xt:=rst*cos(wt*i);
    yt:=rst*sin(wt*i);
    zt:=0;
    xl:=rtl*cos(wl*i)*cos(6)+rst*cos(wt*i);
    yl:=rtl*sin(wl*i)+rst*sin(wt*i);
    zl:=rtl*cos(wl*i)*sin(6);
    x:=round(xt/10000);
    y:=round(yt/10000);
    x1:=round(xl/10000);
    y1:=round(yl/10000);
    z1:=round(zl/10000);

    if (i=1) and (moto=false) then
      begin
        setfillstyle(1,1);                                   { TERRA }
        setcolor(1);
        circle(x+centrox,centroy-y,7);
        floodfill(x+centrox,centroy-y,1);
        setcolor(white);

        putpixel(x+centrox-3,centroy-y-6,15);  { POLO N }
        putpixel(x+centrox-2,centroy-y-6,15);
        putpixel(x+centrox-1,centroy-y-7,15);
        putpixel(x+centrox+3,centroy-y+6,15);  { POLO S }
        putpixel(x+centrox+2,centroy-y+6,15);
        putpixel(x+centrox+1,centroy-y+7,15);

        setcolor(brown);

        line(x+centrox-2,centroy-y-5,x+centrox+1,centroy-y-5);  { CONT. N }
        line(x+centrox-3,centroy-y-4,x+centrox,centroy-y-4);
        line(x+centrox-4,centroy-y-3,x+centrox,centroy-y-3);
        putpixel(x+centrox-3,centroy-y-2,brown);
        putpixel(x+centrox-2,centroy-y-1,brown);

        putpixel(x+centrox,centroy-y,brown);                    { CONT. S }
        line(x+centrox-1,centroy-y+1,x+centrox+1,centroy-y+1);
        line(x+centrox-1,centroy-y+2,x+centrox+2,centroy-y+2);
        line(x+centrox,centroy-y+3,x+centrox+2,centroy-y+3);
        line(x+centrox,centroy-y+4,x+centrox+1,centroy-y+4);

        putpixel(x+centrox-4,centroy-y+2,brown);                { HAWAII }

        setfillstyle(1,15);                                     { LUNA  }
        setcolor(15);
        circle(x1+centrox,centroy -y1,3);
        floodfill(x1+centrox,centroy -y1,15);

        repeat until readkey=' ';

        getcursor(x+centrox-7,centroy-y-7,
                  x+centrox+7,centroy-y+7,pt);
        getcursor(x1+centrox-3,centroy-y1-3,
                  x1+centrox+3,centroy-y1+3,pl);
        setfillstyle(1,0);
        bar(x+centrox-7,centroy-y-7,
            x+centrox+7,centroy-y+7);
        bar(x1+centrox-3,centroy-y1-3,
            x1+centrox+3,centroy-y1+3);
        i:=0;
        moto:=true;
      end;
                                                    { CANCELLA  }
                                                    { E DISEGNA }

    putimage(xsa+centrox-7,centroy-ysa-7,pt^,xorput);
    putimage(x+centrox-7,centroy-y-7,pt^,xorput);
    putimage(x1sa+centrox-3,centroy -y1sa-3,pl^,xorput);
    putimage(x1+centrox-3,centroy -y1-3,pl^,xorput);

    delay(10);

    xsa:=x;
    ysa:=y;
    y1sa:=y1;
    x1sa:=x1;

                                                  { ANELLI SOLE }
    k:=k+1;
    if k mod 10=0 then
      begin
        k1:=k div 10;
        setcolor(yellow);
        circle(centrox,centroy,27+k1);
        setcolor(0);
        circle(centrox,centroy,27+k1-1);
        circle(centrox,centroy,27+k1+1);
        setcolor(15);
      end;
    if k=30 then k:=0;
                                                        { GIORNI }
    str(i,is);
    setfillstyle(1,0);
    bar(85,440,150,460);
    outtextxy(110,450,is);

  until keypressed;
  closegraph;
end.
