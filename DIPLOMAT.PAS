Program diplomati;
uses CRT;
type data = record
             gg:1..31;
             mm:1..12;
             aa:1900..2500;
            end;
     nominativi= record
                  cognom:string;
                  nascita,diploma:data;
                 end;
var nomi:nominativi;
    i,d,c:integer;
begin
clrscr;
write('Quanti nominativi vuoi inserire? ');
readln(d);
c:=0;
for i:=1 to d do
 with nomi do
  begin
   writeln;
   write('Cognome e nome: ');
   readln(cognom);
   write('Nascita (gg mm aa): ');
   readln(nascita.gg,nascita.mm,nascita.aa);
   write('Data diploma (gg mm aa): ');
   readln(diploma.gg,diploma.mm,diploma.aa);
   if diploma.aa - nascita.aa > 20 then c:=c+1;
  end;
writeln;
writeln('Si sono diplomati dopo aver compiuto 20 anni ',c,' persone');
readln;
end.
