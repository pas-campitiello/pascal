Program cittadini;
uses CRT;
type persone = record
                nomcog,indiriz,profes:string;
               end;
var tabper:array[1..5] of persone;
    d,i:integer;
    trovato:boolean;
    prof:string;
begin
clrscr;
write('Quante persone vuoi inserire? (max 10) ');
readln(d);
for i:=1 to d do
 with tabper[i] do
  begin
   writeln;
   write('Nome e cognome: ');
   readln(nomcog);
   write('Indirizzo: ');
   readln(indiriz);
   write('Professione: ');
   readln(profes);
  end;
writeln;
write('Inserisci la professione per stampare i cittadini che la svolgono: ');
readln(prof);
trovato:=false;
for i:=1 to d do
 if tabper[i].profes = prof then
                                begin
                                 trovato:=true;
                                 writeln(tabper[i].nomcog,' Indirizzo: ',tabper[i].indiriz);
                                end;
if trovato=false then writeln('Non ci sono persone che esercitano questa professione');
readln;
end.