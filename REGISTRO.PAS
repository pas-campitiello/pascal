Program registro;
uses CRT;
const max=16;   {< modificare questa constante a seconda del nø degli alunni}
      maxmat=10;{< modificare questa costante a seconda del nø delle materie}
var nomi:array[1..max] of string;
    materie:array[1..maxmat] of string;
    voti:array[1..max,1..maxmat] of byte;
    i,j,k,num,mas,min,s:integer;
procedure intesta;
begin
 clrscr;
 writeln('    ..:: PROGRAMMA CHE SIMULA UN REGISTRO VOTI DI UNA CLASSE ::..');
 writeln;
end;

{Main}

begin
 intesta;
 writeln('--- Carica dell''elenco di classe:');
 for i:=1 to max do
  begin
   write('Cognome e nome alunno nø ',i,': ');
   readln(nomi[i]);
  end;
 writeln;
 writeln('--- Carica delle materie:');
 for i:=1 to maxmat do
  begin
   write('Materia nø ',i,': ');
   readln(materie[i]);
  end;
 writeln;
 intesta;
 writeln('--- Carica dei voti:');
 for i:=1 to max do
  begin
   writeln;
   writeln('ALUNNO: ',nomi[i],'');
   for j:=1 to maxmat do
    begin
     repeat
      write('Voto in ',materie[j],': ');
      readln(voti[i,j]);
      if voti[i,j]>10 then writeln('ATTENZIONE: valore errato. RIPROVA.');
     until voti[i,j]<=10;
    end;
  end;
 writeln;
 intesta;
 write('Inserire il numero dell''alunno del quale stampare un prospetto generale: ');
 readln(num);
 intesta;
 writeln('ALUNNO: ',nomi[num]);
 writeln;
 writeln('MATERIE: VOTI');
 for j:=1 to maxmat do
  begin
   write(materie[j],': ',voti[num,j]);
   writeln;
  end;
 writeln;
 mas:=0;
 min:=11;
 s:=0;
 for i:= 1 to maxmat do
  begin
   if voti[num,i]>mas then mas:=voti[num,i];
   if voti[num,i]<min then min:=voti[num,i];
   s:=s+voti[num,i];
  end;
 writeln('VOTO MAGGIORE: ',mas);
 writeln;
 writeln('VOTO MINORE: ',min);
 writeln;
 writeln('MEDIA: ',s/maxmat:0:2);
 readln;
end.
