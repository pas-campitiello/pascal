{ THIS IS A SIMPLE ROUTINE TO CALCULATE BEZIER CURVES  }
{ IT'S NOT OPTIMIZED! ==> JUST TO SHOW YOU THE FORMULA }
{ OF A BEZIER-CURVE WHICH GO THROUGH THE FOUR POINTS   }
{ B1 --> B4     ENJOY THEM.          -Lord Cyrix       }

{ QUESTO E' UN SEMPLICE ESEMPIO PER CALCOLARE LE CURVE DI BEZIER           }
{ NON E' OTTIMIZZATO! ==> GIUSTO PER MOSTRARVI LA FORMULA                  }
{ DI UNA CURVA BEZIER FRA QUATTRO PUNTI B1 --> B4  GODETEVELE. -Lord Cyrix }

uses crt;
var x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10:integer;
    t,xt:real;
    tel:integer;
    ta,ta2,ta3,ta4:array[0..500] of integer;
    ch:char;
    tab,tab2:array[0..255] of integer;
    b,b0,b1,b2,b3,b4,b5,b6:byte;



procedure vsync;assembler;
asm
             MOV      DX,3DAH
             MOV      AH,08H
 @WAIT1:     IN       AL,DX
             AND      AL,AH
             JNZ      @WAIT1
 @WAIT2:     IN       AL,DX
             AND      AL,AH
             JZ       @WAIT2
end;

procedure setrgb(nr,r,g,b:byte);assembler;
asm
 mov dx,3C8H
 mov al,nr
 out dx,al
 inc dx
 mov al,r
 out dx,al
 mov al,g
 out dx,al
 mov al,b
 out dx,al
end;

procedure bereken;
var r,i:real;
    tel3:word;
    tel,tel2:byte;
    nr:word;

begin
 randomize;
 i:=0;
 r:=pi/64;
 for tel:=0 to 255 do
 begin
  tab [tel]:=round(sin(i)*25)+20;
  tab2[tel]:=round(sin(i)*25)+20;
  i:=i+r;
 end;
end;


procedure p(x,y,c:integer); assembler;
asm
    mov     ax,y
    mov     bx,320
    mul     bx
    add     ax,x
    mov     di,ax

    mov     ax,0A000h
    mov     es,ax
    mov     ax,c
    stosb
end;

procedure start;
var a0,a1,a2,a3,a4,a5,a6,a7,a8,a9:byte;
    t1,t2,t3,t4:array[0..199] of integer;
    tt:integer;
begin
 randomize;
 b1:=random(255); b2:=random(255); b3:=random(255); b4:=random(255); b0:=random(255);
 a1:=50+random(60); a2:=50+random(60); a3:=50+random(60); a4:=50+random(60);
 a5:=50+random(60); a6:=50+random(60); a7:=50+random(60); a8:=50+random(60);
 a9:=50+random(60); a0:=50+random(60);
 for tel:=0 to 99 do
 begin
  t:=t+0.01;
  t1[tel]:=round((1-t)*(1-t)*(1-t)*256);
  t2[tel]:=round(3*t*(1-t)*(1-t)*256);
  t3[tel]:=round(3*t*t*(1-t)*256);
  t4[tel]:=round(t*t*t*256);
 end;
 asm
  mov ax,13h
  int 10h
 end;

repeat
 inc(b1); inc(b2); inc(b3); dec(b4); inc(b0);
 x0:=a0+tab2[b1]; x1:=a1+tab[b1];  x2:=a2+tab[b2];  x3:=a3+tab2[b4];
 x5:=a5+tab2[b2];  x6:=a6+tab[b0];  x8:=a8+tab2[b3]; x9:=a9+tab[b0];

 if x3>x2 then x4:=x3+(x3-x2) else x4:=x3-(x2-x3);
 if x6>x5 then x7:=x6+(x6-x5) else x7:=x6-(x5-x6);
 if x10>x9 then x10:=x9+(x9-x8) else x10:=x9-(x8-x9);

 t:=0;
 for tt:=0 to 99 do
 begin
  tel:=tt;
  ta [tel]:=(t1[tel]*x0+t2[tel]*x1+t3[tel]*x2+t4[tel]*x3) shr 8;
  ta2[tel]:=(t1[tel]*x3+t2[tel]*x4+t3[tel]*x5+t4[tel]*x6) shr 8;
  ta3[tel]:=(t1[tel]*x6+t2[tel]*x7+t3[tel]*x5+t4[tel]*x6) shr 8;
  p( 0+tt,ta [tel],28);
  p(100+tt,ta2[tel],28);
  p(200+tt,ta3[tel],28);
 end;
 setrgb(0,0,0,0);
 vsync;
 setrgb(0,60,0,0);
 for tt:=0 to 99 do
 begin
  tel:=tt;
  p( 00+tt,ta [tel],0);
  p(100+tt,ta2[tel],0);
  p(200+tt,ta3[tel],0);
 end;

until keypressed;
ch:=readkey;

end;


begin
 bereken;
 start;
 textmode(lastmode);
 readln;
end.