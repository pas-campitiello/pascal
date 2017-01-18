Program Gestione_File_3;
uses CRT;
type umano = record
              nome,cogn:string;
              eta:byte;
              sesso:char;
             end;
var mondo,mondoTEMP:file of umano;
    persona:umano;
    trovato:boolean;
    i,y,numMod,pos,numCANC:integer;
    cogRic:string;
    op:byte;
    esc:char;

procedure InserimentoRec;
begin
 with persona do
  begin
   write('Nome: ');
   readln(nome);
   if nome<>'*' then
                 begin
                  write('Cognome: ');
                  readln(cogn);
                  write('Et…: ');
                  readln(eta);
                  write('Sesso (M/F): ');
                  readln(sesso);
                 end;
  end;
end;

procedure CaricaFILE;
begin
 rewrite(mondo);
 repeat
  clrscr;
  writeln('--- Carica FILE ---');
  writeln;
  InserimentoRec;
  write(mondo,persona);
  write('Uscire (s/n)? ');
  readln(esc);
 until esc='s';
 close(mondo);
end;

procedure VisualizzaFILE;
begin
 clrscr;
 writeln('--- Visualizzione FILE ---');
 writeln;
 textcolor(white);
 writeln('Nø Record |   Nome     |    Cognome    | Et… | Sesso');
 textcolor(7);
 writeln('====================================================');
 reset(mondo);
 for i:=1 to filesize(mondo) do
  begin
   if i=1 then y:=5
          else y:=(5+i)-1;

   read(mondo,persona);
   write('  ',i);
   gotoxy(12,y);
   write(persona.nome);
   gotoxy(25,y);
   write(persona.cogn);
   gotoxy(42,y);
   write(persona.eta);
   gotoxy(50,y);
   write(persona.sesso);
   writeln;
  end;
 close(mondo);
 readln;
end;

procedure Ricerca;
begin
 clrscr;
 reset(mondo);
 writeln('--- Ricerca di un record ---');
 writeln;
 write('Inserire il cognome della persona da cercare: ');
 readln(cogRic);
 trovato:=false;
 for i:=1 to filesize(mondo) do
  begin
   read(mondo,persona);
   if cogRic=persona.cogn then
                             begin
                              trovato:=true;
                              writeln;
                              writeln('- RECORD nø ',i);
                              writeln('Nome: ',persona.nome);
                              writeln('Cognome: ',persona.cogn);
                              writeln('Et…: ',persona.eta);
                              writeln('Sesso: ',persona.sesso);
                             end;
  end;
 writeln;
 if not(trovato) then writeln('Non Š stata trovata nessuna persona con questo cognome.');
 close(mondo);
 readln;
end;

procedure Modifica;
begin
 clrscr;
 writeln('--- Modifica di un record ---');
 writeln;
 reset(mondo);
 write('Inserire il nø del record da modificare (max ',filesize(mondo),'): ');
 readln(numMod);
 if numMod>filesize(mondo) then
                               begin
                                writeln;
                                writeln('RECORD INESISTENTE!');
                               end;
 assign(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\Appoggio.txt');
 rewrite(mondoTEMP);
 for i:=1 to filesize(mondo) do
  if i=numMod then
                 begin
                  read(mondo,persona);
                  writeln;
                  writeln('- RECORD nø ',i);
                  writeln('Nome: ',persona.nome);
                  writeln('Cognome: ',persona.cogn);
                  writeln('Et…: ',persona.eta);
                  writeln('Sesso: ',persona.sesso);
                  writeln;
                  writeln('Modificare i dati del record:');
                  writeln;
                  InserimentoRec;
                  write(mondoTEMP,persona);
                 end
              else
                 begin
                  read(mondo,persona);
                  write(mondoTEMP,persona);
                 end;
 close(mondo);
 close(mondoTEMP);
 erase(mondo);
 rename(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GesFile3.txt');
 readln;
end;

procedure AggiuntaInCoda;
begin
 clrscr;
 writeln('--- Aggiunta di un record in coda ---');
 writeln;
 reset(mondo);
 repeat
  read(mondo,persona);
 until EOF(mondo);
 InserimentoRec;
 write(mondo,persona);
 close(mondo);
 readln;
end;

procedure AggiuntaPosizione;
begin
 clrscr;
 writeln('--- Aggiunta di un record in una posizione specifica ---');
 writeln;
 reset(mondo);
 write('Posizione in cui inserire un nuovo record (max ',filesize(mondo),'): ');
 readln(pos);
 if pos>filesize(mondo) then writeln('Il nuovo record verr… aggiunto in coda...');
 assign(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\Appoggio.txt');
 rewrite(mondoTEMP);
 for i:=1 to filesize(mondo)+1 do
  if i=pos then
               begin
                writeln;
                writeln('Inserire i dati del nuovo record:');
                writeln;
                InserimentoRec;
                write(mondoTEMP,persona);
               end
           else
               begin
                read(mondo,persona);
                write(mondoTEMP,persona);
               end;
 close(mondo);
 close(mondoTEMP);
 erase(mondo);
 rename(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GesFile3.txt');
 readln;
end;

procedure Cancella;
begin
 clrscr;
 writeln('--- Cancellazione di un record ---');
 writeln;
 reset(mondo);
 write('Inserire il nø del record da cancellare (max ',filesize(mondo),'): ');
 readln(numCANC);
 if numCANC>filesize(mondo) then
                               begin
                                writeln;
                                writeln('RECORD INESISTENTE!');
                               end;
 assign(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\Appoggio.txt');
 rewrite(mondoTEMP);
 for i:=1 to filesize(mondo) do
  if i=numCANC then
                  begin
                   read(mondo,persona);
                   writeln;
                   writeln('- RECORD nø ',i);
                   writeln('Nome: ',persona.nome);
                   writeln('Cognome: ',persona.cogn);
                   writeln('Et…: ',persona.eta);
                   writeln('Sesso: ',persona.sesso);
                   writeln;
                   writeln('La cancellazione di questo record Š stata eseguita!');
                  end
               else
                  begin
                   read(mondo,persona);
                   write(mondoTEMP,persona);
                  end;
 close(mondo);
 close(mondoTEMP);
 erase(mondo);
 rename(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GesFile3.txt');
 readln;
end;

 { M A I N }

begin
 clrscr;
 assign(mondo,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GesFile3.txt');
 repeat
  clrscr;
  writeln('-----------..::: Gestione FILE 3 :::..-----------');
  writeln;
  writeln('Scegli l''operazione da svolgere:');
  writeln('========================================================');
  writeln('  =1= Caricamento del file');
  writeln('  =2= Visualizzazione del file');
  writeln('  =3= Ricerca di un record');
  writeln('  =4= Modifica di un record');
  writeln('  =5= Aggiunta di un record in coda');
  writeln('  =6= Aggiunta di un record in una posizione specifica');
  writeln('  =7= Cancellazione di un record');
  writeln('  =8= Uscire');
  writeln('========================================================');
  write('::> ');
  readln(op);
  case op of
   1: CaricaFILE;
   2: VisualizzaFILE;
   3: Ricerca;
   4: Modifica;
   5: AggiuntaInCoda;
   6: AggiuntaPosizione;
   7: Cancella;
   8: ;
   else begin
         writeln;
         writeln('ERRORE. L''operazione selezionata non esiste!');
         readln;
        end;
  end;
 until op=8;
end.


