{$M 8192,0,16000}
program now;
uses graph,Crt,Dos;
const
  vers=31;
var
  opt:string;
  I,J,Gd,Gm: Integer;
  S: PathStr;
  ore,min,sec,hund:word;
  y,m,date,dow:word;
  primo:string[2];
  oranuova:string[8];
  datanuova:string[10];
  aug:string[15];
  msg,bool:boolean;

const
  days:array [0..6] of string[9]=
    ('domenica','lunedç','martedç','mercoledç','giovedç','venerdç','sabato');
  mese :array [1..12] of string[9]=
    ('gennaio','febbraio','marzo','aprile','maggio','giugno','luglio','agosto',
     'settembre','ottobre','novembre','dicembre');
  rmin=100;
  rsec=108;
  rore=80;
  rquad=130;
  rnum=120;
  centerx=320;
  centery=240;
  bary=390;

procedure nowgrafico;
var
  orev,minv,secv,min,ore,sec,cent:word;

function add0(n:word):string;
var s:string;
begin
  str(n,s);
  if length(s)=1 then s:='0'+s;
  add0:=s;
end;

procedure disegna_ore(var ore:word);
var
  x,y:integer;
  angolo:real;
begin

  setlinestyle(0,0,3);

  if min<>0 then angolo:=-ore*30+90-7.5*(min div 15-1)
            else angolo:=-(ore-1)*30+90-7.5*3;

  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rore);
  y:=centery-round(sin(angolo)*rore);
  if getpixel(x,y)=white then line(centerx,centery,x,y);

  angolo:=-ore*30+90-7.5*(min div 15);
  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rore);
  y:=centery-round(sin(angolo)*rore);
  line(centerx,centery,x,y);
  setlinestyle(0,0,1);
  setfillstyle(1,0);
  setwritemode(normalput);
  bar(180,bary,265,bary+80);
  setwritemode(xorput);
  setcolor(white);
end;

procedure disegna_sec(sec:word);
var
  x,y:integer;
  angolo:real;
begin
  angolo:=-sec*6+96;
  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rsec);
  y:=centery-round(sin(angolo)*rsec);
  if getpixel(x,y)=white then line(centerx,centery,x,y);

  angolo:=-sec*6+90;
  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rsec);
  y:=centery-round(sin(angolo)*rsec);
  line(centerx,centery,x,y);

  setfillstyle(1,0);
  setwritemode(normalput);
  bar(380,bary,465,bary+80);
  setwritemode(xorput);
  setcolor(white);
end;

procedure disegna_min(min:word);
var
  x,y:integer;
  angolo:real;
begin

  if min in [15,30,45] then disegna_ore(ore);

  angolo:=-min*6+96;
  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rmin);
  y:=centery-round(sin(angolo)*rmin);
  if getpixel(x,y)=white then line(centerx,centery,x,y);

  angolo:=-min*6+90;
  angolo:=angolo*pi / 180;
  x:=centerx+round(cos(angolo)*rmin);
  y:=centery-round(sin(angolo)*rmin);
  line(centerx,centery,x,y);
  setfillstyle(1,0);
  setwritemode(normalput);
  bar(280,bary,365,bary+80);
  setwritemode(xorput);
  setcolor(white);
  if (min=0) and (sec=0) then
    begin
      disegna_sec(59);
      disegna_min(59);
    end;
end;

procedure quadrante;
var
  i,x,y,v:integer;
  angolo:real;
begin
  settextjustify(centertext,centertext);
  settextstyle(3,0,4);
  v:=vers div 10;
  v:=vers-v*10;
  circle(centerx,centery,rquad);
  settextstyle(1,0,1);
  for i:=1 to 12 do
    begin
      angolo:=-i*30+90;
      angolo:=angolo*pi/180;
      x:=centerx+round(cos(angolo)*rnum);
      y:=centery-round(sin(angolo)*rnum);
    end;
end;

begin
  Gd := Detect;
  InitGraph(Gd,Gm,'c:\tp7\bgi');
  if GraphResult<>grOk then Halt(1);
  quadrante;
  gettime(ore,min,sec,cent);
  orev:=ore+1;
  minv:=min+1;
  setwritemode(xorput);
  repeat
    gettime(ore,min,sec,cent);
    if ore<>orev then disegna_ore(ore);
    if min<>minv then disegna_min(min);
    if sec<>secv then disegna_sec(sec);
    orev:=ore;
    minv:=min;
    secv:=sec;
  until keypressed;
  closegraph;
end;

function leadingzero(w:word) : string;
var
 s:string;
begin
 str(w:0,s);
 if length(s) = 1 then s:= '0' +s;
 leadingzero:=s;
end;

procedure leggimsg(giorno,mese:word);
var
  f:text;
  s:string;
begin
    begin
      assign(f,'c:\now.msg');
      reset(f);
      while not eof(f) do
        begin
          readln(f,s);
            begin
              writeln('* ',copy(s,5,length(s)),' *');
              close(f);
              exit;
            end;
        end;

      close(f);
    end;
end;

procedure oracorrente(ora,min,sec:word);
begin
  writeln('Sono le ',leadingzero(ore),':',leadingzero(min),'''',leadingzero(sec),'"                  ',aug);
end;

procedure data(y,m,date,dow:word);
begin
  writeln('Oggi ä ',days[dow],' , ',date,primo,mese[m],' ',y,'  ');
end;

procedure versione(vers:integer);
begin
  writeln('** NOW   v',vers/10:0:1,' **');
end;

begin
  clrscr;
  bool:=false;
  msg:=false;
  aug:='';
  getdate(y,m,date,dow);
  gettime(ore,min,sec,hund);

  if date=1 then
             primo:='¯ '
            else
             primo:=' ';

  if (date=25) and (m=12) then aug:='BUON NATALE !!!';

  for I := 1 to ParamCount do
  begin
    S := ParamStr(I);
    if S[1] = '/' then
      for J := 2 to Length(S) do
        case UpCase(S[J]) of
          'T': begin
                 writeln;
                 oracorrente(ore,min,sec);
                 bool:=true;
               end;
          'V': begin
                 writeln;versione(vers);
                 bool:=true;
               end;
          'H': begin
                 writeln;versione(vers);
                 writeln;writeln('Uso : NOW [Opzioni]');
                 writeln('Opzioni:');
                 writeln;writeln('/D : Mostra solo la data.');
                 writeln('/T : Mostra solo l''ora.');
                 writeln('/C : Mostra il cronometro di NOW.');
                 writeln('/V : Mostra la versione corrente di NOW.');
                 writeln('/G : Mostra l''orologio in grafica.');
                 writeln('/H : Mostra questo testo di aiuti.');
                 writeln('/S : Permette di settare ora e data.');
                 writeln('/M : Legge il messaggio del giorno dal file C:\NOW.MSG');
                 writeln(' NOW  senza parametri visualizza versione, data e ora corrente.');
                 bool:=true;
               end;
          'D': begin
                 writeln;data(y,m,date,dow);
                 bool:=true;
               end;
          'C': begin
                 writeln;
                 repeat
                   repeat
                     gotoxy(1,wherey);
                     gettime(ore,min,sec,hund);
                     write('Sono le ',leadingzero(ore),':',leadingzero(min),'''',leadingzero(sec),'"');
                   until keypressed;
                 until readkey=#13;
                 writeln;
                 bool:=true;
               end;
           'S': begin
                  writeln;
                  versione(vers);
                  writeln;
                  oracorrente(ore,min,sec);
                  repeat
                    write('Inserisci l''ora (HH:MM:SS) : ');
                    readln(oranuova);
                  until (oranuova<>'') and (length(oranuova)=8);
                  data(y,m,date,dow);
                  repeat
                    write('Inserisci la data (GG/MM/AAAA) : ');
                    readln(datanuova);
                  until (datanuova<>'') and (length(datanuova)=10);
                  bool:=true;
                end;
           'G': begin
                  nowgrafico;
                  bool:=true;
                end;
           'M': msg:=true;
          else
          begin
            WriteLn('Opzione errata : ', upcase(S[J]));
            bool:=true;
          end;
        end;

  end;
  if bool=false then
    begin
      writeln;versione(vers);
      writeln;data(y,m,date,dow);
      oracorrente(ore,min,sec);
      writeln;
      if msg then leggimsg(date,m);
    end;
    readln;
end.