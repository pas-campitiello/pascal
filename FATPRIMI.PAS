{DA RIVEDERE: CON NUMERI ELEVATI D… PROBLEMI limite strano 999888223}

Program FattoriPrimi;
uses CRT;
const max=50;
var fattori:array[1..2,1..max] of integer;
    num,numD,i,j,c:longint;

begin
 clrscr;
 writeln('   ### Programma per scomporre in fattori primi un numero ###');
 writeln;
 write('Inserisci il numero: ');
 readln(num);
 writeln;

 {Caricamento fattori sulla prima riga}
 numD:=num;
 i:=2;
 c:=0;
 repeat
  if (numD MOD i)=0 then
                     begin
                      numD:=numD DIV i;
                      c:=c+1;
                      fattori[1,c]:=i;
                     end
                    else i:=i+1;
 until numD=1;

 {Inizializzazione a 1 della seconda riga}
 for i:=1 to c do fattori[2,i]:=1;

 {Caricamento numero/frequenza sulla seconda riga;
  se un fattore Š ripeturo la sua frequenza sar… immediatamente
  sotto al primo da sinistra, mentre gli altri avranno frequenza 0}
 for i:=1 to c do
  if fattori[1,i]=fattori[1,i-1] then fattori[2,i]:=0
      else
       for j:=i+1 to c do
        if fattori[1,i]=fattori[1,j] then fattori[2,i]:=fattori[2,i]+1;

 {Stampa della scompozione con elevazione a potenza}
 writeln;
 writeln('Il numero ',num,' scomposto in fattori primi Š: ');
 writeln;
 write('  ');
 for i:=1 to c do
  begin
   if fattori[2,i]>1 then write(fattori[1,i],'^',fattori[2,i]);
   if fattori[2,i]=1 then write(fattori[1,i]);
   if (fattori[2,i]>=1) and (fattori[2,i]<>c) and (i<>c) then write(' * ');
  end;

 readln;
end.