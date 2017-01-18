Program differenza_date;
uses CRT;
const tab:array[1..12] of integer = (0,31,59,90,120,151,181,212,243,273,304,334);
type data = record
             gg:1..31;
             mm:1..12;
             aa:1900..2300;
            end;
var data1,data2:data;
    anno,progr1,progr2:longint;

function calcolo(dt:data):longint;
var progr:longint;
begin
 with dt do
  begin
   anno:=aa-1900;
   progr:=anno*365 + (anno-1) div 4 + tab[mm] + gg;
   if (mm>2) and (aa mod 4 = 0) then progr:=progr+1;
  end;
 calcolo:=progr;
end;

begin
 clrscr;
 writeln('============== CALCOLO DELLA DIFFERENZA TRA 2 DATE =============');
 writeln;
 write('Inserisci la 1a data (gg mm aa) ');
 readln(data1.gg,data1.mm,data1.aa);
 write('Inserisci la 2a data (gg mm aa) ');
 readln(data2.gg,data2.mm,data2.aa);
 progr1:=calcolo(data1);
 progr2:=calcolo(data2);
 writeln;
 writeln('Giorni di differenza = ',progr2-progr1);
 writeln('Corrispondenti a circa ',(progr2-progr1) div 365,' anni');
 readln;
end.
