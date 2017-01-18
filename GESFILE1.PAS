Program GestioneFile;
uses CRT;
type Dati = record
             Codice:integer;
             Dato:string[10];
            end;
var F:file of Dati;
    InputDato:Dati;
    Scelta:char;
    Finito:boolean;

function LeggiDatoValido(var Info:Dati):boolean;
 begin
  write('Inserisci il codice: ');
  readln(Info.Codice);
  if Info.Codice <> 0 then
                          begin
                           write('Inserisci il dato: ');
                           readln(Info.Dato);
                          end;
  LeggiDatoValido:=Info.Codice <> 0;
 end;

procedure RegistraRecord(Info:Dati);
 begin
  write(F,Info);
 end;

procedure AggiungiRecord;
var Nuovo,Comodo:Dati;
 begin
  while not EOF(F) do
   Read(F,Comodo);
  if LeggiDatoValido(Nuovo) then RegistraRecord(Nuovo);
 end;

procedure RicercaCodice;
var CodiceCercato:integer;
    Trovato:boolean;
    Info:Dati;
 begin
  write('Inserisci il codice da cercare: ');
  readln(CodiceCercato);
  Trovato:=false;
  Reset(F);
  while not EOF(F) and not trovato do
   begin
    read(F,Info);
    if CodiceCercato=Info.Codice then trovato:=true;
   end;
  if trovato then writeln('Dato trovato: ',Info.dato)
             else writeln('Dato non trovato');
 end;

begin
 clrscr;
 assign(F,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GesFile1.txt');
 rewrite(F);
 Finito:=false;
 repeat
  if LeggiDatoValido(InputDato) then RegistraRecord(InputDato)
                                else Finito:=true;
 until Finito;
 Close(F);
 Finito:=false;
 Reset(F);
 repeat
  writeln;
  writeln('Inserire la scelta--- ');
  write('T per terminare, A per aggiungere un record, C per cercare un codice: ');
  readln(Scelta);
  case scelta of
   'T','t': Finito:=true;
   'A','a': AggiungiRecord;
   'C','c': RicercaCodice;
  else writeln('Scelta non valida');
  end;
 until Finito;
 Close(F);
readln;
end.

