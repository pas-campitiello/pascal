Program indovina_il_numero;
uses CRT;
var a,b,i:integer;
    indovinato:boolean;
begin
clrscr;
writeln('-------------- I N D O V I N A  I L  N U M E R O -------------');
writeln;
writeln('::: Numero compreso tra 0 e 100 :::');
writeln;
randomize;
indovinato:=false;
i:=0;
a:=random(101);
repeat
 i:=i+1;
 write('Inserisci un numero (possibilit… numero ',i,' (max 5)): ');
 readln(b);
 if a=b then
            begin
             indovinato:=true;
             writeln;
             writeln('Complimenti! Hai indovinato');
            end
         else
            begin
             if b>a then writeln('Il numero da indovinare Š pi— piccolo')
                    else writeln('Il numero da indovinare Š pi— grande');
             writeln;
            end;
until (i=5) or indovinato;
writeln;
if not(indovinato) then
   writeln('POSSIBILITA'' FINITE. Non hai indovinato. Il numero era ',a);
readln;
end.
