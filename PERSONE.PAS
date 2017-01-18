Program persone;
uses CRT;
type persona = record
                nomecog,codfis,comune:string;
               end;
var tabper:array[1..5] of persona;
    comun,nome:string;
    d,i:integer;
    trovato:boolean;
begin
clrscr;
write('Quante persone vuoi inserire? (max 10) ');
readln(d);
for i:=1 to d do
 with tabper[i] do
  begin
   writeln;
   write('Nome e cognome: ');
   readln(nomecog);
   write('Codice fiscale: ');
   readln(codfis);
   write('Comune di residenza: ');
   readln(comune);
  end;
writeln;
write('Inserisci il nome di cui vuoi cercare il codice fiscale: ');
readln(nome);
trovato:=false;
for i:=1 to d do
 if tabper[i].nomecog=nome then
                            begin
                             trovato:=true;
                             writeln('--Persona trovata-- Codice Fiscale: ',tabper[i].codfis);
                            end;
if trovato=false then writeln('--Persona non trovata--');
writeln;
write('Inserisci il comune di cui vuoi stampare i dati dei residenti: ');
readln(comun);
trovato:=false;
for i:=1 to d do
 if tabper[i].comune=comun then
                            begin
                             trovato:=true;
                             writeln;
                             writeln(tabper[i].nomecog,' Cod. Fis.: ',tabper[i].codfis);
                            end;
if trovato=false then writeln('--Non trovati residenti di questo comune--');
readln;
end.