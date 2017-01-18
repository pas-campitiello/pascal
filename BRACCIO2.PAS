program _braccio;

uses crt,graph;

const
  mp=50.5;
  lp=mp*2;
  attesa=2;
  brascolor=white;
  maskcolor=yellow;
  sottotitoli='Leggere nel sensore ...';

var
  sx1,sy1,sx,sy,incx,incy,j,k,i,gd,gm:integer;
  c:char;
  bptr:pointer;

{ INCX e INCY indicano la direzione del braccio: se sono a 0 il braccio
  Š fermo se sono >0 il braccio va a DX e GIU , se sono <0 il braccio va
  a SX e SU . Con la combinazione dei due si ottengono tutte le direzioni.
  La grandezza dei due indica la sensibilita'                                }

procedure generapezzo(x,y,x1,y1:integer);
begin
  setfillstyle(1,4);
  bar(x,y,x1,y1);
  setfillstyle(1,0);
  bar(round(x+(x1-x)/2)-20,y,round(x+(x1-x)/2)+20,round(y+(y1-y)/2));
end;

procedure maschera;
var
  x,y,x1,y1:integer;

{ Disegna il bordo e i sottotitoli }

begin
  randomize;
  x:=320-random(220);
  x1:=320+random(220);
  y:=175-random(100);
  y1:=175+random(100);
  x:=200; y:=100; x1:=440; y1:=250;
  setcolor(maskcolor);
  setactivepage(0);
  rectangle(0,0,639,326);
  outtextxy(10,335,sottotitoli);
  generapezzo(x,y,x1,y1);
  setactivepage(1);
  rectangle(0,0,639,326);
  outtextxy(10,335,sottotitoli);
  generapezzo(x,y,x1,y1);
  setcolor(brascolor);
end;

procedure salva(var p:pointer);

{ Salva le immagini del sensore e dei cerchi }

var
  size:word;
begin
  arc(0,5,270,360,8);
  arc(25,5,180,270,8);
  arc(25,20,90,180,12);
  arc(0,20,0,90,12);

  arc(13,4,90,180,4);
  arc(12,4,0,90,4);

  settextstyle(smallfont,0,2);
  outtextxy(11,1,'p');
  outtextxy(11,7,'d');
  settextstyle(0,0,1);

  size:=imagesize(0,0,25,20);
  getmem(p,size);
  getimage(0,0,25,20,p^);
  setfillstyle(1,0);
  bar(0,0,25,20);

end;

procedure braccio(x,y:integer;bptr:pointer);

{ Disegna il braccio in X,Y }

var
  bo:integer;
begin
  setfillstyle(1,15);
  if y>275 then y:=275;
  setfillstyle(1,black);
  bar(x-round(mp)-13,1,x+round(mp)+13,5);
  setcolor(brascolor);
  setfillstyle(1,brascolor);
  bar(x-round(mp)-3,1,x+round(mp)+3,5);
  moveto(x,5);
  lineto(x+round(sqrt((mp*mp)-(y/36)*y)),round(y/6)+1);
  lineto(x-round(sqrt((lp*lp)-(y/9)*y)/2),round((y/6)*3)-2);
  lineto(x+round(sqrt((lp*lp)-(y/9)*y)/2),round((y/6)*5)+1);
  lineto(x,y);
  lineto(x,y+30);
  putimage(x-12,y+29,bptr^,xorput);
end;



begin
  incx:=0;
  incy:=0;
  gd:=ega;
  gm:=egahi;
  initgraph(gd,gm,'');

  salva(bptr);

  maschera;

  j:=0;
  i:=0;
  k:=300;
  sx:=-100;
  sy:=-100;
  sx1:=-100;
  sy1:=-100;
  c:=' ';
  setwritemode(xorput);

  repeat

    inc(i,incy);
    inc(k,incx);

    setvisualpage(j mod 2);
    delay(attesa);
    setactivepage(1-j mod 2);

    braccio(sx,sy,bptr);
    braccio(k,i,bptr);
    sx:=k;
    sy:=i;

    setvisualpage(1-j mod 2);
    delay(attesa);
    setactivepage(j mod 2);

    inc(i,incy);
    inc(k,incx);

    if k<mp+22 then
      begin
        k:=round(mp)+22;
        incx:=0;
      end;

    if i<6 then
      begin
        incy:=0;
        i:=6;
      end;

    if k>617-mp then
      begin
        incx:=0;
        inc(j,2);
        k:=round(617-mp);
      end;

    if i>275 then
      begin
        incy:=0;
        inc(j,2);
        i:=275;
      end;

    braccio(sx1,sy1,bptr);
    braccio(k,i,bptr);
    sx1:=k;
    sy1:=i;

                                                    { Blocco di lettura }

    if keypressed then
      begin
        c:=readkey;
        if c=#0 then c:=readkey;
        case c of
          #72: dec(incy);
          #80: inc(incy);
          #75: dec(incx);
          #77: inc(incx);
        end;
      end;

                                                    { Fine lettura }

    if incy>3 then incy:=3;
    if incy<-3 then incy:=-3;
    if incy<=0 then inc(j,2);

    if incx>3 then incx:=3;
    if incx<-3 then incx:=-3;

  until c=#27;
  readln;
end.
