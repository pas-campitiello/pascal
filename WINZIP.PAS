Program Winzip;
Uses crt;

Var
 tab1:array[1..300] of word;
 tab2:array[1..300,1..2] of word;
 cont:word;
 k,c,d,h:word;
 nelem:word;
 trova:boolean;

Begin
 clrscr;
 randomize;
 Writeln ('                             Riempimento vettore');
 Writeln ('                                  LOADING.....');
 Delay (2000);
 clrscr;
 Writeln;Writeln;
 nelem:=random (19)+1;
 Writeln ('Vettore iniziale');
 for k:=1 to nelem do
          begin
             tab1[k]:=random(101);
             write (tab1[k],' ');
          end;
 tab1[k+1]:=101;
 k:=0;
 c:=0;
 writeln;
 trova:=false;
 h:=0;
 repeat
  inc(k);
  cont:=0;
  d:=k;
  while tab1[d]=tab1[d+1] do
          begin
           trova:=true;
           inc(cont);
           inc(d);
          end;
  h:=h+cont;
  inc(c);
  tab2[c,1]:=tab1[k];
  tab2[c,2]:=cont+1;
  if trova=true then k:=k+cont;
  trova:=false;
  if cont=nelem then trova:=true;
 until (trova=true) or (k=nelem);
 Writeln;Writeln;
 Writeln ('Vettore Compresso');
 Writeln ('Dato iniz.      Frequenza');
 for k:=1 to nelem-h do
           begin
            Write (tab2[k,1]);
            if tab1[k]<10 then write ('               ');
            if tab1[k]=100 then write ('             ');
            if (tab1[k]>=10) and (tab1[k]<100) then write ('              ');
            writeln (tab2[k,2]);
           end;
 readln;
end.



