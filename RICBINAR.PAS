Program ricerca_binaria;
uses CRT;
const max=20;
type vettore=array[1..max] of integer;
var ps,pd,pm,T,i:integer;
    vett:vettore;
    trovato:boolean;
begin
 clrscr;
 for i:=1 to max do
  begin
   write('Elemento nø ',i,': ');
   readln(vett[i]);
  end;
 writeln;
 write('Inserisci il numero da cercare: ');
 readln(T);
 trovato:=false;
 ps:=1;
 pd:=max;
 Repeat
  pm:=(ps+pd) div 2;
  if (vett[pm]=T) or (vett[ps]=T) or (vett[pd]=T) then trovato:=true
     else
      if T>vett[pm] then ps:=pm+1
                    else pd:=pm-1;
 Until (ps>pd) or trovato;
 writeln;
 If trovato then writeln('Elemento trovato')
            else writeln('Elemento non trovato');
 readln;
end.


