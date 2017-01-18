{ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
 บ Û฿฿฿ Û  Û Û Û฿฿Û . . *อน_____/๎๎๎๎๎๎/___  Û฿Û  Û฿฿Û ฿฿Û฿฿ ฿฿Û฿฿ Û    Û฿฿฿ บ');
 บ ฿฿฿Û Û฿฿Û Û Û฿฿฿  . .*อนอ  o o o o o   /  Û฿฿Û Û฿฿Û   Û     Û   Û    Û฿฿  บ');
 บ ฿฿฿฿ ฿  ฿ ฿ ฿            \____________/   ฿฿฿฿ ฿  ฿   ฿     ฿   ฿฿฿฿ ฿฿฿฿ บ');
 ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');

 by Pasquale Campitiello 26/11/2003 ธ

 ----------------------------------------------------------------------------

 Si ringraziano per la collaborazione gli amici Abbatessa Emanuele,
 Cresciullo Giovanni e il prof. Raffaele Tortora dell'ITCG "E. Cenni"
 di Vallo della Lucania (SA)
}

Program battaglia_navale;
uses CRT;
const max=15;
      num_n=10; {numero navette}
      num_i=7;  {numero incrociatori <-บ la somma di questi 2 valori }
      num_p=5;  {numero portaerei    <-บ non deve superare 15        }
type matrice=array[1..max,1..max] of string[3];
type matrice2=array[1..max,1..max] of char;
var mat1,mat2Computer:matrice;
    mat1video,mat2videoComputer:matrice2;
    regnavi1,regnavi1MIO:array[1..15] of string;
    regnavi2,regnavi2MIO:array[1..15] of byte;
    a,b,c,k,x,y,i,j,d,cx,cy,cx2,cy2,colpiUtente,colpiComputer:integer;
    ki,px,py, ki2,px2,py2, kpi,ppx,ppy:integer;
    ppx1,ppy1,kx,ky,ei:integer;
    s,z:string[3];
    cap:string;
    vitUt,vitCom,orizz,vert:boolean;

procedure caricaRegNavi;
begin
                         {Carica delle i di Capitan COMPUTER}
 for i:=1 to num_i do
  begin
   str(i,z);
   regnavi1[i]:='i'+z;
   regnavi2[i]:=2;
  end;
                         {Carica delle p di Capitan COMPUTER}
 for i:=(num_i+1) to (num_i + num_p) do
  begin
   str(i-num_i,z);
   regnavi1[i]:='p'+z;
   regnavi2[i]:=3;
  end;
                         {Carica delle i di Capitan UTENTE}
 for i:=1 to num_i do
  begin
   str(i,z);
   regnavi1MIO[i]:='i'+z;
   regnavi2MIO[i]:=2;
  end;
                         {Carica delle p di Capitan UTENTE}
 for i:=(num_i+1) to (num_i + num_p) do
  begin
   str(i-num_i,z);
   regnavi1MIO[i]:='p'+z;
   regnavi2MIO[i]:=3;
  end;
end;

procedure casoxy;
begin
 x:=random(max)+1;
 y:=random(max)+1;
end;

procedure caricaNavette(var m:matrice;var m2:matrice2);
begin
 for i:=1 to num_n do
  begin
   repeat
    casoxy;
   until m2[x,y]<>'n';
   str(i,s);
   m[x,y]:='n'+s;
   m2[x,y]:='n';
  end;
end;

procedure caricaIncroc(var m:matrice;var m2:matrice2);
begin
 a:=0;
 s:='';
 repeat
  repeat
   casoxy;
  until (m2[x+1,y]<>'n') or (m2[x+1,y]<>'i') or (m2[x,y+1]<>'n') or (m2[x,y+1]<>'i') or
        (m2[x-1,y]<>'n') or (m2[x-1,y]<>'i') or (m2[x,y-1]<>'n') or (m2[x,y-1]='i');
  if (m2[x,y]<>'n') and (m2[x,y]<>'i') then
                                         begin
                                          a:=a+1;
                                          str(a,s);
                                          m[x,y]:='i'+s;
                                          m2[x,y]:='i';
                                          c:=1;
                                          repeat
                                           b:=random(4)+1;
                                           case b of
                                            1:begin
                                               if (x-1>0) and (m2[x-1,y]<>'n') and (m2[x-1,y]<>'i') then
                                                                                                        begin
                                                                                                         m[x-1,y]:='i'+s;
                                                                                                         m2[x-1,y]:='i';
                                                                                                         c:=c+1;
                                                                                                        end;
                                              end;
                                            2:begin
                                               if (y+1<=max) and (m2[x,y+1]<>'n') and (m2[x,y+1]<>'i') then
                                                                                                            begin
                                                                                                             m[x,y+1]:='i'+s;
                                                                                                             m2[x,y+1]:='i';
                                                                                                             c:=c+1;
                                                                                                            end;
                                              end;
                                            3:begin
                                               if (x+1<=max) and (m2[x+1,y]<>'n') and (m2[x+1,y]<>'i') then
                                                                                                            begin
                                                                                                             m[x+1,y]:='i'+s;
                                                                                                             m2[x+1,y]:='i';
                                                                                                             c:=c+1;
                                                                                                            end;
                                              end;
                                            4:begin
                                               if (y-1>0) and (m2[x,y-1]<>'n') and (m2[x,y-1]<>'i') then
                                                                                                        begin
                                                                                                         m[x,y-1]:='i'+s;
                                                                                                         m2[x,y-1]:='i';
                                                                                                         c:=c+1;
                                                                                                        end;
                                              end;
                                           end;
                                          until c=2;
                                         end;
 until a=num_i;
end;

procedure caricaPortaerei(var m:matrice; var m2:matrice2);
begin
 a:=0;
 b:=0;
 c:=0;
 s:='';
 repeat
  repeat
   casoxy;
  until ((m2[x-2,y]<>'n') and (m2[x-2,y]<>'i') and (m2[x-2,y]<>'p')
     and (m2[x-1,y]<>'n') and (m2[x-1,y]<>'i') and (m2[x-1,y]<>'p') ) OR

        ((m2[x,y+1]<>'n') and (m2[x,y+1]<>'i') and (m2[x,y+1]<>'p')
     and (m2[x,y+2]<>'n') and (m2[x,y+2]<>'i') and (m2[x,y+2]<>'p') ) OR

        ((m2[x+1,y]<>'n') and (m2[x+1,y]<>'i') and (m2[x+1,y]<>'p')
     and (m2[x+2,y]<>'n') and (m2[x+2,y]<>'i') and (m2[x+2,y]<>'p') ) OR

        ((m2[x,y-1]<>'n') and (m2[x,y-1]<>'i') and (m2[x,y-1]<>'p')
     and (m2[x,y-2]<>'n') and (m2[x,y-2]<>'i') and (m2[x,y-2]<>'p') );

  if (m2[x,y]<>'n') and (m2[x,y]<>'i') and (m2[x,y]<>'p') then
                                           begin
                                            a:=a+1;
                                            str(a,s);
                                            m[x,y]:='p'+s;
                                            m2[x,y]:='p';
                                            c:=1;
                                            repeat
                                             b:=random(4)+1;
                                             case b of
                                              1:begin
                                                 if (x-2>0) and (m2[x-1,y]<>'n') and (m2[x-1,y]<>'i')
                                                                                  and (m2[x-1,y]<>'p') and
                                                                 (m2[x-2,y]<>'n') and (m2[x-2,y]<>'i')
                                                                                  and (m2[x-2,y]<>'p') then
                                                                                                        begin
                                                                                                         m[x-1,y]:='p'+s;
                                                                                                         m[x-2,y]:='p'+s;
                                                                                                         m2[x-1,y]:='p';
                                                                                                         m2[x-2,y]:='p';
                                                                                                         c:=c+1;
                                                                                                        end;
                                                end;
                                              2:begin
                                                 if (y+2<=max) and (m2[x,y+1]<>'n') and (m2[x,y+1]<>'i')
                                                                                  and (m2[x,y+1]<>'p') and
                                                                 (m2[x,y+2]<>'n') and (m2[x,y+2]<>'i')
                                                                                  and (m2[x,y+2]<>'p') then
                                                                                                        begin
                                                                                                         m[x,y+1]:='p'+s;
                                                                                                         m[x,y+2]:='p'+s;
                                                                                                         m2[x,y+1]:='p';
                                                                                                         m2[x,y+2]:='p';
                                                                                                         c:=c+1;
                                                                                                        end;
                                                end;
                                              3:begin
                                                 if (x+2<=max) and (m2[x+1,y]<>'n') and (m2[x+1,y]<>'i')
                                                                                  and (m2[x+1,y]<>'p') and
                                                                 (m2[x+2,y]<>'n') and (m2[x+2,y]<>'i')
                                                                                  and (m2[x+2,y]<>'p') then
                                                                                                        begin
                                                                                                         m[x+1,y]:='p'+s;
                                                                                                         m[x+2,y]:='p'+s;
                                                                                                         m2[x+1,y]:='p';
                                                                                                         m2[x+2,y]:='p';
                                                                                                         c:=c+1;
                                                                                                        end;
                                                end;
                                              4:begin
                                                 if (y-2>0) and (m2[x,y-1]<>'n') and (m2[x,y-1]<>'i')
                                                                                  and (m2[x,y-1]<>'p') and
                                                                 (m2[x,y-2]<>'n') and (m2[x,y-2]<>'i')
                                                                                  and (m2[x,y-2]<>'p') then
                                                                                                        begin
                                                                                                         m[x,y-1]:='p'+s;
                                                                                                         m[x,y-2]:='p'+s;
                                                                                                         m2[x,y-1]:='p';
                                                                                                         m2[x,y-2]:='p';
                                                                                                         c:=c+1;
                                                                                                        end;
                                                end;
                                             end;
                                            until c=2;
                                           end;
 until a=num_p;
end;

Procedure azzeraTutto;
begin
 cx2:=0;
 cy2:=0;
 kpi:=0;
 ppx:=0;
 ppy:=0;
 ppx1:=0;
 ppy1:=0;
 kx:=0;
 ky:=0;
 ei:=0;
 vitUt:=false;
 vitCom:=false;
 orizz:=false;
 vert:=false;
end;

procedure stampa(m:matrice2);
begin
 write('  ');
 textcolor(green);
 for k:=1 to max do
  write(' ',k);
 writeln;
 for i:= 1 to max do
  begin
   textcolor(green);
   write(i:2);
   for j:=1 to max do
    begin
     case m[i,j] of
      'n':begin
           textcolor(red);
           if j>=10 then write('  ',m[i,j])
                    else write(' ',m[i,j]);
          end;
      'i':begin
           textcolor(white);
           if j>=10 then write('  ',m[i,j])
                    else write(' ',m[i,j]);
          end;
      'p':begin
           textcolor(magenta);
           if j>=10 then write('  ',m[i,j])
                    else write(' ',m[i,j]);
          end;
      '*':begin
           textcolor(cyan);
           if j>=10 then write('  ',m[i,j])
                    else write(' ',m[i,j]);
          end;
      'ฐ':begin
           textcolor(6);
           if j>=10 then write('  ',m[i,j])
                    else write(' ',m[i,j]);
          end;
     else
        begin
         if j>=10 then write('   ')
                  else write('  ');
        end;
     end;
    end;
   writeln;
  end;
end;

procedure stampavideo(m:matrice);
begin
 textcolor(7);
 write('  ');
 for k:=1 to max do
  write(k:3);
 writeln;
 for i:= 1 to max do
  begin
   write(i:2);
   for j:=1 to max do
    write(m[i,j]:3);
   writeln;
  end;
end;

procedure stampaNsVisioneCampo(m2:matrice2);
begin
 textcolor(green);
 write('  ');
 for k:=1 to max do
  write(' ',k);
 writeln;
 for i:= 1 to max do
  begin
   textcolor(green);
   write(i:2);
   for j:=1 to max do
    case m2[i,j] of
     '*':begin
          textcolor(cyan);
          if j>=10 then write('  ',m2[i,j])
                   else write(' ',m2[i,j]);
         end;
     'ฐ':begin
          textcolor(6);
          if j>=10 then write('  ',m2[i,j])
                   else write(' ',m2[i,j]);
         end;
    else
       begin
        if j>=10 then write('   ')
                 else write('  ');
       end;
    end;
   writeln;
  end;
end;

Procedure sparaUtente;
begin
 textcolor(7);
 cx:=0;
 cy:=0;
 writeln('Colpo n๘ ',d,' di Capitan ',cap,' --- ');
 write('Coordinata x del colpo: ');
 readln(cx);
 write('Coordinata y del colpo: ');
 readln(cy);
 writeln;
 if (cx>max) or (cy>max) then
                            begin
                             textcolor(red);
                             writeln('Coordinate fuori dal campo di battaglia! Hai sprecato un colpo!');
                             writeln;
                            end
                         else
 case mat2videoComputer[cx,cy] of
  'n':begin
       textcolor(6);
       writeln('Colpita e affondata una navetta!');
       writeln;
       mat2videoComputer[cx,cy]:='ฐ';
       colpiUtente:=colpiUtente+1;
      end;
  'i':begin
       for i:=1 to num_i do
        if mat2Computer[cx,cy]=regnavi1[i] then
                                       begin
                                        textcolor(6);
                                        if regnavi2[i]=2 then
                                                            begin
                                                             regnavi2[i]:=regnavi2[i]-1;
                                                             writeln('Colpito incrociatore n๘ ',i,'!');
                                                             colpiUtente:=colpiUtente+1;
                                                            end
                                               else
                                                   begin
                                                    colpiUtente:=colpiUtente+1;
                                                    writeln('Colpito e affondato incrociatore n๘ ',i,'!');
                                                   end;
                                        end;
       writeln;
       mat2videoComputer[cx,cy]:='ฐ';
      end;
  'p':begin
       for i:=(num_i+1) to (num_i + num_p) do
        begin
         if mat2Computer[cx,cy]=regnavi1[i] then
                                     begin
                                      textcolor(6);
                                      if (regnavi2[i]=3) or (regnavi2[i]=2) then
                                                                             begin
                                                                              regnavi2[i]:=regnavi2[i]-1;
                                                                              writeln('Colpita portaerei n๘ ',i-num_i,'!');
                                                                              colpiUtente:=colpiUtente+1;
                                                                             end
                                                              else
                                                                  begin
                                                                   colpiUtente:=colpiUtente+1;
                                                                   writeln('Colpita e affondata portaerei n๘ ',i-num_i,'!');
                                                                  end;
                                     end;
        end;
       writeln;
       mat2videoComputer[cx,cy]:='ฐ';
      end
 else
    begin
     textcolor(cyan);
     writeln('Acqua!');
     writeln;
     mat2videoComputer[cx,cy]:='*';
    end;
 end;
  textcolor(7);
  writeln('Capitan ',cap,' ha colpito le navi di Capitan COMPUTER per ',colpiUtente,' volte:');
  writeln;
  stampaNsVisioneCampo(mat2videoComputer);
  readln;
  clrscr;
end;

Procedure giraIncroc;
begin
 textcolor(7);
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 x:=0;
 repeat
  cx:=px;
  cy:=py;
  x:=random(4)+1;
  case x of
   1: cx:=px-1;
   2: cy:=py+1;
   3: cx:=px+1;
   4: cy:=py-1;
  end;
 until (cx>0) and (cy>0) and (cx<=max) and (cy<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy);
 writeln;
 if mat1[cx,cy]=regnavi1MIO[ki] then
                                   begin
                                    textcolor(6);
                                    writeln;
                                    writeln('L''incrociatore n๘ ',ki,'  stato colpito e affondato da Capitan COMPUTER!');
                                    mat1video[cx,cy]:='ฐ';
                                    colpiComputer:=ColpiComputer+1;
                                    px:=0; py:=0;
                                   end
         else
          case mat1video[cx,cy] of
           'n':begin
                textcolor(6);
                writeln;
                writeln('Una navetta  stata colpita e affondata da Capitan COMPUTER!');
                mat1video[cx,cy]:='ฐ';
                colpiComputer:=colpiComputer+1;
               end;
           'i':begin
                for i:=1 to num_i do
                 if mat1[cx,cy]=regnavi1MIO[i] then
                  begin
                   textcolor(6);
                   if regnavi2MIO[i]=2 then
                     begin
                      regnavi2MIO[i]:=regnavi2MIO[i]-1;
                      colpiComputer:=colpiComputer+1;
                      writeln;
                      writeln('L''incrociatore n๘ ',i,'  stato colpito da Capitan COMPUTER!');
                      ki2:=i; px2:=cx; py2:=cy;
                     end
                     else
                      begin
                       colpiComputer:=colpiComputer+1;
                       writeln;
                       writeln('L''incrociatore n๘ ',i,'  stato colpito e affondato da Capitan COMPUTER!');
                      end;
                  end;
                mat1video[cx,cy]:='ฐ';
               end;
           'p':begin
                for i:=(num_i+1) to (num_i + num_p) do
                 begin
                  if mat1[cx,cy]=regnavi1MIO[i] then
                    begin
                     textcolor(6);
                     if (regnavi2MIO[i]=3) or (regnavi2MIO[i]=2) then
                      begin
                        regnavi2MIO[i]:=regnavi2MIO[i]-1;
                        writeln;
                        writeln('La portaerei n๘ ',i-num_i,'  stata colpita da Capitan COMPUTER!');
                        colpiComputer:=colpiComputer+1;
                       end
                       else
                        begin
                         writeln;
                         writeln('La portaerei n๘ ',i-num_i,'  stata colpita e affondata da Capitan COMPUTER!');
                         colpiComputer:=colpiComputer+1;
                        end;
                      end;
                    end;
                  mat1video[cx,cy]:='ฐ';
                 end
          else
           begin
            textcolor(cyan);
            writeln;
            writeln('Capitan COMPUTER ha sparato in acqua!');
            mat1video[cx,cy]:='*';
           end;
          end;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 readln;
 clrscr;
end;

Procedure giraIncroc2;
begin
 textcolor(7);
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 x:=0;
 repeat
  cx:=px2;
  cy:=py2;
  x:=random(4)+1;
  case x of
   1: cx:=px2-1;
   2: cy:=py2+1;
   3: cx:=px2+1;
   4: cy:=py2-1;
  end;
 until (cx>0) and (cy>0) and (cx<=max) and (cy<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy);
 writeln;
 if mat1[cx,cy]=regnavi1MIO[ki2] then
                                   begin
                                    textcolor(6);
                                    writeln;
                                    writeln('L''incrociatore n๘ ',ki2,'  stato colpito e affondato da Capitan COMPUTER!');
                                    mat1video[cx,cy]:='ฐ';
                                    colpiComputer:=ColpiComputer+1;
                                    px2:=0; py2:=0;
                                   end
         else
          case mat1video[cx,cy] of
           'n':begin
                textcolor(6);
                writeln;
                writeln('Una navetta  stata colpita e affondata da Capitan COMPUTER!');
                mat1video[cx,cy]:='ฐ';
                colpiComputer:=colpiComputer+1;
               end;
           'i':begin
                for i:=1 to num_i do
                 if mat1[cx,cy]=regnavi1MIO[i] then
                  begin
                   textcolor(6);
                   if regnavi2MIO[i]=2 then
                     begin
                      regnavi2MIO[i]:=regnavi2MIO[i]-1;
                      colpiComputer:=colpiComputer+1;
                      writeln;
                      writeln('L''incrociatore n๘ ',i,'  stato colpito da Capitan COMPUTER!');
                      ki:=i; px:=cx; py:=cy;
                     end
                     else
                      begin
                       colpiComputer:=colpiComputer+1;
                       writeln;
                       writeln('L''incrociatore n๘ ',i,'  stato colpito e affondato da Capitan COMPUTER!');
                      end;
                  end;
                mat1video[cx,cy]:='ฐ';
               end;
           'p':begin
                for i:=(num_i+1) to (num_i + num_p) do
                 begin
                  if mat1[cx,cy]=regnavi1MIO[i] then
                    begin
                     textcolor(6);
                     if (regnavi2MIO[i]=3) or (regnavi2MIO[i]=2) then
                      begin
                        regnavi2MIO[i]:=regnavi2MIO[i]-1;
                        writeln;
                        writeln('La portaerei n๘ ',i-num_i,'  stata colpita da Capitan COMPUTER!');
                        colpiComputer:=colpiComputer+1;
                       end
                       else
                        begin
                         writeln;
                         writeln('La portaerei n๘ ',i-num_i,'  stata colpita e affondata da Capitan COMPUTER!');
                         colpiComputer:=colpiComputer+1;
                        end;
                      end;
                    end;
                  mat1video[cx,cy]:='ฐ';
                 end
          else
           begin
            textcolor(cyan);
            writeln;
            writeln('Capitan COMPUTER ha sparato in acqua!');
            mat1video[cx,cy]:='*';
           end;
          end;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 readln;
 clrscr;
end;

Procedure giraPort;
begin
 textcolor(7);
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 x:=0;
 repeat
  cx:=ppx;
  cy:=ppy;
  x:=random(4)+1;
  case x of
   1: cx:=ppx-1;
   2: cy:=ppy+1;
   3: cx:=ppx+1;
   4: cy:=ppy-1;
  end;
 until (cx>0) and (cy>0) and (cx<=max) and (cy<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy);
 writeln;
 if mat1[cx,cy]=regnavi1MIO[kpi] then
                                   begin
                                    textcolor(6);
                                    if regnavi2MIO[kpi]=2 then
                                      begin
                                       ppx:=cx; ppy:=cy;
                                       ppx1:=cx; ppy1:=cy;
                                       regnavi2MIO[kpi]:=regnavi2MIO[kpi]-1;
                                       writeln;
                                       writeln('La portaerei n๘ ',kpi-num_i,'  stata colpita da Capitan COMPUTER!');
                                       mat1video[cx,cy]:='ฐ';
                                       colpiComputer:=ColpiComputer+1;
                                      end
                                   else
                                    begin
                                     writeln;
                                     writeln('La portaerei n๘ ',kpi-num_i,'  stata colpita e affondata da Capitan COMPUTER!');
                                     mat1video[cx,cy]:='ฐ';
                                     colpiComputer:=ColpiComputer+1;
                                     azzeraTutto;
                                    end
                                   end
         else
          case mat1video[cx,cy] of
           'n':begin
                textcolor(6);
                writeln;
                writeln('Una navetta  stata colpita e affondata da Capitan COMPUTER!');
                mat1video[cx,cy]:='ฐ';
                colpiComputer:=colpiComputer+1;
               end;
           'i':begin
                for i:=1 to num_i do
                 if mat1[cx,cy]=regnavi1MIO[i] then
                  begin
                   textcolor(6);
                   if regnavi2MIO[i]=2 then
                     begin
                      regnavi2MIO[i]:=regnavi2MIO[i]-1;
                      colpiComputer:=colpiComputer+1;
                      writeln;
                      writeln('L''incrociatore n๘ ',i,'  stato colpito da Capitan COMPUTER!');
                      ki:=i; px:=cx; py:=cy;
                     end
                     else
                      begin
                       colpiComputer:=colpiComputer+1;
                       writeln;
                       writeln('L''incrociatore n๘ ',i,'  stato colpito e affondato da Capitan COMPUTER!');
                      end;
                  end;
                mat1video[cx,cy]:='ฐ';
               end;
           'p':begin
                for i:=(num_i+1) to (num_i + num_p) do
                 begin
                  if mat1[cx,cy]=regnavi1MIO[i] then
                    begin
                     textcolor(6);
                     if (regnavi2MIO[i]=3) or (regnavi2MIO[i]=2) then
                      begin
                        regnavi2MIO[i]:=regnavi2MIO[i]-1;
                        writeln;
                        writeln('La portaerei n๘ ',i-num_i,'  stata colpita da Capitan COMPUTER!');
                        colpiComputer:=colpiComputer+1;
                       end
                       else
                        begin
                         writeln;
                         writeln('La portaerei n๘ ',i-num_i,'  stata colpita e affondata da Capitan COMPUTER!');
                         colpiComputer:=colpiComputer+1;
                        end;
                      end;
                    end;
                  mat1video[cx,cy]:='ฐ';
                 end
          else
           begin
            textcolor(cyan);
            writeln;
            writeln('Capitan COMPUTER ha sparato in acqua!');
            mat1video[cx,cy]:='*';
           end;
          end;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 if ( (mat1video[ppx1,ppy1-1]='ฐ') or (mat1video[ppx1,ppy1-1]='*') or (ppy1-1=0)   ) and
    ( (mat1video[ppx1,ppy1+1]='ฐ') or (mat1video[ppx1,ppy1+1]='*') or (ppy1+1>max) ) and
    ( (mat1video[ppx1-1,ppy1]='ฐ') or (mat1video[ppx1-1,ppy1]='*') or (ppx1-1=0)   ) and
    ( (mat1video[ppx1+1,ppy1]='ฐ') or (mat1video[ppx1+1,ppy1]='*') or (ppx1+1>max) ) then
                                                begin
                                                 if kx=ppx1 then orizz:=true
                                                            else vert:=true;
                                                 ppx:=0; ppy:=0;
                                                end;
 if ( (mat1video[ppx,ppy-1]='ฐ') or (mat1video[ppx,ppy-1]='*') or (ppy-1=0)   ) and
    ( (mat1video[ppx,ppy+1]='ฐ') or (mat1video[ppx,ppy+1]='*') or (ppy+1>max) ) and
    ( (mat1video[ppx-1,ppy]='ฐ') or (mat1video[ppx-1,ppy]='*') or (ppx-1=0)   ) and
    ( (mat1video[ppx+1,ppy]='ฐ') or (mat1video[ppx+1,ppy]='*') or (ppx+1>max) ) then
                                                begin
                                                 ppx:=0; ppy:=0;
                                                end;
 writeln;
 readln;
 clrscr;
end;

Procedure affondaPortOrizz;
begin
 textcolor(7);
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 x:=0;
 if ky<ppy1 then
   repeat
    cx:=kx;
    cy:=ky;
    cx2:=ppx1;
    cy2:=ppy1;
    x:=random(2)+1;
    case x of
     1: cy:=cy-1;
     2: cy:=cy2+1;
    end;
   until (cy>0) and (cy<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*')
  else
   repeat
    cx:=kx;
    cy:=ky;
    cx2:=ppx1;
    cy2:=ppy1;
    x:=random(2)+1;
    case x of
     1: cy:=cy2-1;
     2: cy:=cy+1;
    end;
   until (cy>0) and (cy<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy);
 writeln;
 textcolor(6);
 writeln;
 writeln('La portaerei n๘ ',ei,'  stata colpita e affondata da Capitan COMPUTER!');
 mat1video[cx,cy]:='ฐ';
 colpiComputer:=ColpiComputer+1;
 azzeraTutto;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 readln;
 clrscr;
end;

Procedure affondaPortVert;
begin
 textcolor(7);
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 x:=0;
 if kx<ppx1 then
   repeat
    cx:=kx;
    cy:=ky;
    cx2:=ppx1;
    cy2:=ppy1;
    x:=random(2)+1;
    case x of
     1: cx:=cx-1;
     2: cx:=cx2+1;
    end;
   until (cx>0) and (cx<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*')
  else
   repeat
    cx:=kx;
    cy:=ky;
    cx2:=ppx1;
    cy2:=ppy1;
    x:=random(2)+1;
    case x of
     1: cx:=cx2-1;
     2: cx:=cx+1;
    end;
   until (cx>0) and (cx<=max) and (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy);
 writeln;
 textcolor(6);
 writeln;
 writeln('La portaerei n๘ ',ei,'  stata colpita e affondata da Capitan COMPUTER!');
 mat1video[cx,cy]:='ฐ';
 colpiComputer:=ColpiComputer+1;
 azzeraTutto;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 readln;
 clrscr;
end;

Procedure sparaComputer;
begin
 if (px<>0) or (py<>0) then giraIncroc else
 if (px2<>0) or (py2<>0) then giraIncroc2 else
 if (ppx<>0) or (ppy<>0) then giraPort else
 if orizz then affondaPortOrizz else
 if vert then affondaPortVert else
 begin
 textcolor(7);
 cx:=0;
 cy:=0;
 write('Colpo n๘ ',d,' di Capitan COMPUTER --- ');
 repeat
  cx:=random(max)+1;
  cy:=random(max)+1;
 until (mat1video[cx,cy]<>'ฐ') and (mat1video[cx,cy]<>'*');
 write('x=',cx,' y=',cy,' ');
 writeln;
 case mat1video[cx,cy] of
  'n':begin
       textcolor(6);
       writeln;
       writeln('Una navetta  stata colpita e affondata da Capitan COMPUTER!');
       mat1video[cx,cy]:='ฐ';
       colpiComputer:=colpiComputer+1;
      end;
  'i':begin
       for i:=1 to num_i do
        if mat1[cx,cy]=regnavi1MIO[i] then
                                  begin
                                   textcolor(6);
                                   if regnavi2MIO[i]=2 then
                                    begin
                                     regnavi2MIO[i]:=regnavi2MIO[i]-1;
                                     colpiComputer:=colpiComputer+1;
                                     writeln;
                                     writeln('L''incrociatore n๘ ',i,'  stato colpito da Capitan COMPUTER!');
                                     ki:=i; px:=cx; py:=cy;
                                    end
                                    else
                                     begin
                                      colpiComputer:=colpiComputer+1;
                                      writeln;
                                      writeln('L''incrociatore n๘ ',i,'  stato colpito e affondato da Capitan COMPUTER!');
                                     end;
                                  end;
       mat1video[cx,cy]:='ฐ';
      end;
  'p':begin
       for i:=(num_i+1) to (num_i + num_p) do
       begin
        if mat1[cx,cy]=regnavi1MIO[i] then
                                    begin
                                     textcolor(6);
                                     if (regnavi2MIO[i]=3) or (regnavi2MIO[i]=2) then
                                      begin
                                       regnavi2MIO[i]:=regnavi2MIO[i]-1;
                                       writeln;
                                       writeln('La portaerei n๘ ',i-num_i,'  stata colpita da Capitan COMPUTER!');
                                       if ( (mat1video[cx,cy-1]='ฐ') or (mat1video[cx,cy-1]='*') or (cy-1=0)   ) and
                                          ( (mat1video[cx,cy+1]='ฐ') or (mat1video[cx,cy+1]='*') or (cy+1>max) ) and
                                          ( (mat1video[cx-1,cy]='ฐ') or (mat1video[cx-1,cy]='*') or (cx-1=0)   ) and
                                          ( (mat1video[cx+1,cy]='ฐ') or (mat1video[cx+1,cy]='*') or (cx+1>max) ) then
                                                                         begin
                                                                          ppx:=0; ppy:=0;
                                                                         end
                                                                         else
                                                                          begin
                                                                           kpi:=i; ppx:=cx; ppy:=cy;
                                                                           ei:=i-num_i; kx:=ppx; ky:=ppy;
                                                                          end;
                                       colpiComputer:=colpiComputer+1;
                                      end
                                     else
                                      begin
                                       writeln;
                                       writeln('La portaerei n๘ ',i-num_i,'  stata colpita e affondata da Capitan COMPUTER!');
                                       colpiComputer:=colpiComputer+1;
                                      end;
                                    end;
       end;
       mat1video[cx,cy]:='ฐ';
      end
 else
    begin
     textcolor(cyan);
     writeln;
     writeln('Capitan COMPUTER ha sparato in acqua!');
     mat1video[cx,cy]:='*';
    end;
 end;
 textcolor(7);
 writeln;
 writeln('Capitan COMPUTER ha colpito le navi di Capitan ',cap,' per ',colpiComputer,' volte:');
 writeln;
 stampa(mat1video);
 readln;
 clrscr;
 end;
end;

               { MAIN }

begin
 clrscr;
 randomize;
 caricaRegNavi;
 textcolor(red);
 writeln(' ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป');
 writeln(' บ Û฿฿฿ Û  Û Û Û฿฿Û . . *อน_____/๎๎๎๎๎๎/___  Û฿Û  Û฿฿Û ฿฿Û฿฿ ฿฿Û฿฿ Û    Û฿฿฿ บ');
 writeln(' บ ฿฿฿Û Û฿฿Û Û Û฿฿฿  . .*อนอ  o o o o o   /  Û฿฿Û Û฿฿Û   Û     Û   Û    Û฿฿  บ');
 writeln(' บ ฿฿฿฿ ฿  ฿ ฿ ฿            \____________/   ฿฿฿฿ ฿  ฿   ฿     ฿   ฿฿฿฿ ฿฿฿฿ บ');
 writeln(' ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ');
 writeln;
 writeln;
 writeln;
 writeln;
 textcolor(yellow);
 write('Inserire il nome del capitano che sfida capitan Computer: ');
 readln(cap);
 clrscr;
 textcolor(7);
 writeln('Le navi di Capitan ',cap,' sono state disposte (210 colpi disponibili):');
 caricaNavette(mat1,mat1video);
 caricaIncroc(mat1,mat1video);
 caricaPortaerei(mat1,mat1video);
 writeln;
 stampa(mat1video);
 textcolor(7);
 writeln;
 writeln('Le navi di Capitan COMPUTER sono state disposte (210 colpi disponibili).');
 writeln;
 caricaNavette(mat2Computer,mat2videoComputer);
 caricaIncroc(mat2Computer,mat2videoComputer);
 caricaPortaerei(mat2Computer,mat2videoComputer);
 textcolor(7);
 writeln;
 writeln;
 writeln('Premere INVIO per INIZIARE LA BATTAGLIA...');
 readln;
 clrscr;
 d:=0;
 colpiUtente:=0;
 colpiComputer:=0;
 px:=0;
 py:=0;
 ki:=0;
 px2:=0;
 py2:=0;
 ki2:=0;
 cx:=0;
 cy:=0;
 azzeraTutto;
 repeat
  d:=d+1;
  sparaUtente;
  if colpiUtente=(num_n)+(num_i*2)+(num_p*3) then
                                                begin
                                                 textcolor(lightred);
                                                 writeln;
                                                 writeln('           Capitan ',cap,' ha affondato tutta la flotta nemica!!! ');
                                                 readln;
                                                 clrscr;
                                                 vitUt:=true;
                                                end;
  if vitUt then
              begin
               writeln;
               writeln('- ULTIMO COLPO DI CAPITAN COMPUTER -');
               writeln;
              end;
  sparaComputer;
  if colpiComputer=(num_n)+(num_i*2)+(num_p*3) then
                                                  begin
                                                   textcolor(lightred);
                                                   writeln;
                                                   writeln('         Capitan Computer ha affondato tutta la flotta nemica!!!');
                                                   readln;
                                                   clrscr;
                                                   vitCom:=true;
                                                  end;
 until (d=210) or vitUt or vitCom;
 if vitCom then
           begin
            clrscr;
            textcolor(7);
            writeln('Le navi di Capitan Computer erano disposte cos:');
            writeln;
            stampa(mat2videoComputer);
            readln;
            writeln;
            writeln;
           end;
 if vitCom then
             begin
               clrscr;
               writeln;
               textcolor(blue);
               writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
               textcolor(cyan);
               writeln('               Capitan Computer ha vinto la battaglia !!!');
               textcolor(blue);
               writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
               textcolor(yellow);
               gotoxy(25,12);
               writeln('.::   G A M E   O V E R   ::.');
               writeln;
               readln;
             end
             else
  if vitUt then
             begin
               clrscr;
               writeln;
               textcolor(blue);
               writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
               textcolor(cyan);
               writeln('                  Capitan ',cap,' ha vinto la battaglia !!!');
               textcolor(blue);
               writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
               textcolor(yellow);
               gotoxy(25,12);
               writeln('.::   G A M E   O V E R   ::.');
               writeln;
               readln;
             end
             else
 begin
  textcolor(cyan);
  writeln(' Capitan Computer ha colpito ',colpiComputer,' navi nemiche');
  writeln(' Capitan ',cap,' ha colpito ',colpiUtente,' navi nemiche');
  readln;
  clrscr;
  writeln;
  textcolor(blue);
  writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
  textcolor(cyan);
  if colpiUtente>colpiComputer then writeln('                Capitan ',cap,' ha vinto la battaglia !!!')
                 else
                  if colpiUtente<colpiComputer then writeln('                Capitan COMPUTER ha vinto la battaglia!!!')
                                              else writeln('                La battaglia non ha avuto nessun vincitore!');
  textcolor(blue);
  writeln('              ออออออออออออออออออออออออออออออออออออออออออออออออ');
  textcolor(yellow);
  gotoxy(25,12);
  writeln('.::   G A M E   O V E R   ::.');
  writeln;
  readln;
 end;
end.