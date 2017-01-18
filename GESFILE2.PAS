Program GestioneFile;
uses CRT;
type dati = record
             nome,cognome:string;
             voto:byte;
            end;
var tabella:file of dati;
    persona:dati;
    op,i:integer;
    ESC:char;
    trovato:boolean;
    cog,x:string;

procedure caricaFile;
begin
 i:=1;
 x:='C:\WINDOWS\Desktop\Ufficio\Progra~1\Pascal\Progra~2\GesFile2.txt';
 assign(tabella,x);
 rewrite(tabella);
 repeat
  clrscr;
  writeln('---------------------------------------------------------');
  writeln('::::::::::: Programma per la gestione di file :::::::::::');
  writeln('---------------------------------------------------------');
  with persona do
   begin
    writeln('Persona nø ',i,': ');
    write('NOME: ');
    readln(nome);
    write('COGNOME: ');
    readln(cognome);
    write('VOTO: ');
    readln(voto);
   end;
  i:=i+1;
  write(tabella,persona);
  write('USCIRE (S/N)? ');
  readln(ESC);
 until (ESC='S') or (ESC='s');
 close(tabella);
end;

procedure visualizzaFile;
begin
 clrscr;
 writeln('---------------------------------------------------------');
 writeln('::::::::::: Programma per la gestione di file :::::::::::');
 writeln('---------------------------------------------------------');
 assign(tabella,'C:\WINDOWS\Desktop\Ufficio\Progra~1\Pascal\Progra~2\GesFile2.txt');
 reset(tabella);
 writeln;
 for i:=1 to filesize(tabella) do
  begin
   read(tabella,persona);
   writeln;
   writeln('NOME: ',persona.nome);
   writeln('COGNOME: ',persona.cognome);
   writeln('VOTO: ',persona.voto);
  end;
 readln;
 close(tabella);
end;

procedure stampaRecord;
begin
 clrscr;
 writeln('---------------------------------------------------------');
 writeln('::::::::::: Programma per la gestione di file :::::::::::');
 writeln('---------------------------------------------------------');
 assign(tabella,'C:\WINDOWS\Desktop\Ufficio\Progra~1\Pascal\Progra~2\GesFile2.txt');
 reset(tabella);
 writeln;
 write('Inserisci il cognome della persona da stampare: ');
 readln(cog);
 trovato:=false;
 for i:=1 to filesize(tabella) do
  begin
   read(tabella,persona);
   if cog=persona.cognome then begin
                                trovato:=true;
                                writeln;
                                writeln('NOME: ',persona.nome);
                                writeln('COGNOME: ',persona.cognome);
                                writeln('VOTO: ',persona.voto);
                               end;
  end;
 if not(trovato) then writeln('Il cognome inserito non esiste!');
 readln;
 close(tabella);
end;

{MAIN}

begin
 repeat
  clrscr;
  writeln('---------------------------------------------------------');
  writeln('::::::::::: Programma per la gestione di file :::::::::::');
  writeln('---------------------------------------------------------');
  writeln;
  writeln('== SCEGLI L''OPERAZIONE ==');
  writeln;
  writeln(' 1 : carica il file');
  writeln(' 2 : visualizza il contenuto del file');
  writeln(' 3 : stampa di un solo record');
  writeln(' 4 : uscire');
  writeln;
  write('-> ');
  readln(op);
  case op of
   1: caricaFile;
   2: visualizzaFile;
   3: stampaRecord;
   4: ;
  else begin
        writeln('ERRORE. L''operazione selezionata non esiste!');
        readln;
       end;
  end;
 until op=4;
end.