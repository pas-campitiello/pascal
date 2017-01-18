program _braccio;

uses crt,graph;

const
  attesa=5;
  brascolor=white;
  maskcolor=yellow;
  sottotitoli='...';

var
  sx,sy,sx1,sy1,incx,incy,j,k,i,gd,gm:integer;
  c:char;
  cptr,bptr:pointer;

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

{ Disegna il bordo e i sottotitoli }

var
  x,y,x1,y1:integer;
begin
  randomize;
  x:=random(220)+100;
  x1:=random(220)+320;
  y:=175-random(100);
  y1:=175+random(100);

  x:=100;
  y:=75;
  x1:=540;
  y1:=275;

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

procedure braccio(x,y:integer;b:boolean;bptr,cptr:pointer);

{ Disegna il braccio in X,Y }

begin

  if y>=320 then y:=320;

  setfillstyle(1,0);
  bar(x-40,1,x+40,5);
  setfillstyle(1,15);
  bar(x-30,1,x+30,5);

  if b then setfillstyle(1,brascolor)
       else setfillstyle(1,black);

  bar(x-10,1,x+10,1+round(y/6));
  bar(x-5,1+round(y/6),x+5,1+round(y/2));
  bar(x-1,1+round(y/2),x+1,y+1);
  bar(x-5,y+1,x+5,y+1);

end;

procedure spigolo(var k,i,incx,incy:integer);
begin

  if (getpixel(k-5-abs(incx),i+1+abs(incy))=4) or
     (getpixel(k+5+abs(incx),i+1+abs(incy))=4) or
     (getpixel(k-5-abs(incx),round(i/2)+2+abs(incy))=4) or
     (getpixel(k+5+abs(incx),round(i/2)+2+abs(incy))=4) then
       begin
         if (getpixel(k+5+abs(incx),i+1+abs(incy))=4) and (incx>0) then incx:=0;
         if (getpixel(k-5-abs(incx),i+1+abs(incy))=4) and (incx<0) then incx:=0;
         if (getpixel(k+5+abs(incy),i+2+abs(incy))=4) and (incy>0) then incy:=0;
         if (getpixel(k-5-abs(incy),i+2+abs(incy))=4) and (incy>0) then incy:=0;

         if (getpixel(k+5+abs(incx),round(i/2)+2+abs(incy))=4) and (incx>0) then incx:=0;
         if (getpixel(k-5-abs(incx),round(i/2)+2+abs(incy))=4) and (incx<0) then incx:=0;
         if (getpixel(k+5+abs(incy),round(i/2)+2+abs(incy))=4) and (incy>0) then incy:=0;
         if (getpixel(k-5-abs(incy),round(i/2)+2+abs(incy))=4) and (incy>0) then incy:=0;
       end;

end;

begin
  c:=#0;
  incx:=0;
  incy:=0;
  sx:=-100;
  sy:=-100;
  sx1:=-100;
  sy1:=-100;
  gd:=ega;
  gm:=egahi;
  initgraph(gd,gm,'C:\TP7\BGI');

  maschera;

  setwritemode(xorput);

  j:=0;
  i:=0;
  k:=300;

  repeat

    inc(i,incy);
    inc(k,incx);

    setvisualpage(j mod 2);
    delay(attesa);
    setactivepage(1-j mod 2);

    spigolo(k,i,incx,incy);

    braccio(sx,sy,false,bptr,cptr);
    braccio(k,i,true,bptr,cptr);
    sx:=k;
    sy:=i;

    setvisualpage(1-j mod 2);
    delay(attesa);
    setactivepage(j mod 2);

    inc(i,incy);
    inc(k,incx);

    if k<=72 then
      begin
        k:=72;
        incx:=0;
      end;

    if i<=6 then
      begin
        incy:=0;
        i:=6;
      end;

    if k>=567 then
      begin
        incx:=0;
        inc(j,2);
        k:=567;
      end;

    if i>=320 then
      begin
        incy:=0;
        inc(j,2);
        i:=320;
      end;

    braccio(sx1,sy1,false,bptr,cptr);
    braccio(k,i,true,bptr,cptr);
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

    spigolo(k,i,incx,incy);

    if incy>3 then incy:=3;
    if incy<-3 then incy:=-3;
    if incy<=0 then inc(j,2);

    if incx>3 then incx:=3;
    if incx<-3 then incx:=-3;

  until c=#27;
end.
