Program Gestione_File_4;
uses CRT;
type umano = record
              nome,cogn:string;
              eta:byte;
              sesso:char;
             end;
     TIPOfile = file of umano;

var mondo,mondoTEMP,mondo2:TIPOfile;
    persona:umano;
    trovato,vuoto:boolean;
    i,numRic,numMod,pos,numCANC:integer;
    op,op2,ris:byte;
    esc:char;

procedure InserimentoRec;
begin
 with persona do
  begin
   write('Nome: ');
   readln(nome);
   write('Cognome: ');
   readln(cogn);
   write('Et…: ');
   readln(eta);
   write('Sesso (M/F): ');
   readln(sesso);
  end;
end;

procedure stampa(var x:TIPOfile);
begin
 clrscr;
 textcolor(10);
 writeln('--- Visualizzazione FILE ---');
 writeln;
 textcolor(white);
 writeln('Nø Record |   Nome     |    Cognome    | Et… | Sesso');
 textcolor(yellow);
 writeln('====================================================');
 textcolor(7);
 for i:=1 to filesize(x) do
  begin
   read(x,persona);
   if persona.nome[1]<>'*' then
                               begin
                                if i<>10 then write('  ',i)
                                         else write(' ',i);
                                write(persona.nome:20);
                                write(persona.cogn:15);
                                write(persona.eta:6);
                                write(persona.sesso:6);
                                writeln;
                               end
                           else
                               begin
                                write('  ',i);
                                write('--- RECORD NON DISPONIBILE ---':33);
                                writeln;
                               end;
  end;
 close(x);
end;

procedure caricaStandard(var y:TIPOfile);
begin
 rewrite(y);
 repeat
  clrscr;
  textcolor(10);
  writeln('--- Carica FILE ---');
  textcolor(white);
  writeln;
  InserimentoRec;
  write(y,persona);
  write('Uscire (s/n)? ');
  readln(esc);
 until esc='s';
 close(y);
end;

procedure CaricaFILE;
begin
 {$I-}
 reset(mondo);
 if ioresult<>0 then
                    begin
                     {$I+}
                     caricaStandard(mondo);
                    end
                else
                 begin
                  {$I+}
                  writeln;
                  textcolor(12);
                  writeln(' ATTEZIONE! Il file che si vuole caricare gi… esiste! Fare un scelta:');
                  writeln;
                  writeln(' = 1 = Creare un nuovo file ');
                  writeln(' = 2 = Sovrascrivere sul precedente file');
                  writeln;
                  write('::> ');
                  readln(ris);
                  case ris of
                   1: begin
                       assign(mondo2,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GFILE4-2.txt');
                       caricaStandard(mondo2);
                      end;
                   2: caricaStandard(mondo);
                  else write('Operazione inesistente!');
                  end;
                 end;
 readln;
end;

procedure VisualizzaFILE;
begin
 {$I-}
 reset(mondo);
 if ioresult<>0 then
                   begin
                    writeln;
                    textcolor(12);
                    writeln(' ATTEZIONE! Il file che si vuole visualizzare Š vuoto!');
                    writeln(' ...Caricare il file');
                   end
                else
                   begin

                    reset(mondo2);
                    if ioresult<>0 then stampa(mondo)
                                   else
                                       begin
                                        clrscr;
                                        writeln('--- Visualizzazione FILE ---');
                                        writeln;
                                        textcolor(white);
                                        writeln('Esistono 2 file, scegliere: ');
                                        writeln;
                                        writeln(' = 1 = Visualizza il primo file');
                                        writeln(' = 2 = Visualizza il secondo file');
                                        writeln;
                                        write('::> ');
                                        readln(ris);
                                        case ris of
                                         1: stampa(mondo);
                                         2: stampa(mondo2);
                                        else writeln('Operazione inesistente!');
                                        end;
                                       end;
                   end;
 readln;
end;

procedure Ricerca;
begin
 clrscr;
 reset(mondo);
 writeln('--- Ricerca di un record ---');
 writeln;
 textcolor(white);
 write('Inserire il numero del record da ricercare (max ',filesize(mondo),'): ');
 readln(numRic);
 writeln;
 textcolor(11);
 if not(numRic in [1..filesize(mondo)]) then writeln(' ATTENZIONE! Il record specificato non esiste!')
                                 else
                                  begin
                                   seek(mondo,numRic-1);
                                   read(mondo,persona);
                                   writeln('--- RECORD nø ',numRic);
                                   writeln('  Nome: ',persona.nome);
                                   writeln('  Cognome: ',persona.cogn);
                                   writeln('  Et…: ',persona.eta);
                                   writeln('  Sesso: ',persona.sesso);
                                  end;
 close(mondo);
 readln;
end;

procedure Modifica;
begin
 clrscr;
 writeln('--- Modifica di un record ---');
 writeln;
 reset(mondo);
 textcolor(white);
 write('Inserire il nø del record da modificare (max ',filesize(mondo),'): ');
 readln(numMod);
 writeln;
 textcolor(11);
 if numMod>filesize(mondo) then
                               begin
                                writeln;
                                writeln(' RECORD INESISTENTE!');
                               end
                           else
                            begin
                             seek(mondo,numMod-1);
                             read(mondo,persona);
                             writeln('--- RECORD nø ',numMod);
                             writeln('  Nome: ',persona.nome);
                             writeln('  Cognome: ',persona.cogn);
                             writeln('  Et…: ',persona.eta);
                             writeln('  Sesso: ',persona.sesso);
                             writeln;
                             writeln('Modificare i dati del record:');
                             writeln;
                             InserimentoRec;
                             seek(mondo,numMod-1);
                             write(mondo,persona);
                            end;
 close(mondo);
 readln;
end;

procedure AggiuntaInCoda;
begin
 clrscr;
 writeln('--- Aggiunta di un record in coda ---');
 writeln;
 textcolor(white);
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
 vuoto:=false;
 writeln('--- Aggiunta di un record in una posizione specifica ---');
 textcolor(white);
 writeln;
 reset(mondo);
 write('Posizione in cui inserire un nuovo record (max ',filesize(mondo),'): ');
 readln(pos);

 assign(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\TEMPORANEO.txt');
 rewrite(mondoTEMP);

 if pos>filesize(mondo) then
                           begin
                            writeln(' Il nuovo record verr… aggiunto in coda...');
                            seek(mondo,filesize(mondo)-1);
                            readln;
                           end
                        else seek(mondo,pos-1);
 read(mondo,persona);
 textcolor(11);

 if persona.nome='---' then vuoto:=true;

 if vuoto=true then
                 begin
                  seek(mondo,pos-1);
                  writeln;
                  InserimentoRec;
                  write(mondo,persona);
                 end
               else
               begin
                seek(mondo,0);
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
               end;
 if vuoto=true then
                   begin
                    close(mondo);
                    close(mondoTEMP);
                    erase(mondoTEMP);
                   end
               else
                   begin
                    close(mondo);
                    close(mondoTEMP);
                    erase(mondo);
                    rename(mondoTEMP,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GFILE4-1.txt');
                   end;
 readln;
end;

procedure Cancella;
begin
 repeat
  clrscr;
  writeln('--- Cancellazione di un record ---');
  writeln;
  reset(mondo);
  textcolor(white);
  textcolor(10);
  writeln('          Scegliere l''operazione da svolgere:');
  textcolor(yellow);
  writeln('      ==========================================================');
  textcolor(7);
  writeln('         = 1 = Cancellazione fisica del record');
  writeln('         = 2 = Cancellazione logica del record');
  writeln('         = 3 = Rendere disponibile un record nascosto');
  writeln('         = 4 = Tornare al menu principale');
  textcolor(yellow);
  writeln('      ==========================================================');
  writeln;
  textcolor(10);
  write('        ::> ');
  readln(op2);
  case op2 of
   1: begin
       clrscr;
       textcolor(10);
       writeln('--- Cancellazione fisica di un record ---');
       writeln;
       textcolor(white);
       write('Inserire il nø del record da cancellare fisicamente (max ',filesize(mondo),'): ');
       readln(numCANC);
       writeln;
       textcolor(11);
       if not(numCANC in [1..filesize(mondo)]) then writeln('RECORD INESISTENTE!')
                           else
                            begin
                             seek(mondo,numCANC-1);
                             read(mondo,persona);
                             writeln('- RECORD nø ',numCANC);
                             writeln('Nome: ',persona.nome);
                             writeln('Cognome: ',persona.cogn);
                             writeln('Et…: ',persona.eta);
                             writeln('Sesso: ',persona.sesso);
                             writeln;
                             persona.nome:='---';
                             persona.cogn:='---';
                             persona.eta:=0;
                             persona.sesso:='-';
                             textcolor(10);
                             writeln(' Questo record Š stato cancellato fisicamente!');
                             seek(mondo,numCANC-1);
                             write(mondo,persona);
                            end;
      end;
   2: begin
       clrscr;
       textcolor(10);
       writeln('--- Cancellazione logica di un record ---');
       writeln;
       textcolor(white);
       write('Inserire il nø del record da cancellare logicamente (max ',filesize(mondo),'): ');
       readln(numCANC);
       writeln;
       textcolor(11);
       if not(numCANC in [1..filesize(mondo)]) then writeln('RECORD INESISTENTE!')
                           else
                            begin
                             seek(mondo,numCANC-1);
                             read(mondo,persona);
                             writeln('- RECORD nø ',numCANC);
                             writeln('Nome: ',persona.nome);
                             writeln('Cognome: ',persona.cogn);
                             writeln('Et…: ',persona.eta);
                             writeln('Sesso: ',persona.sesso);
                             writeln;
                             persona.nome:='*'+persona.nome;
                             textcolor(10);
                             writeln('Questo record Š stato nascosto!');
                             seek(mondo,numCANC-1);
                             write(mondo,persona);
                             readln;
                            end;
      end;
   3: begin
       clrscr;
       textcolor(10);
       writeln('--- Rendere visibile un record ---');
       writeln;
       textcolor(white);
       write('Inserire il nø del record da rendere visibile (max ',filesize(mondo),'): ');
       readln(numCANC);
       writeln;
       textcolor(11);
       if not(numCANC in [1..filesize(mondo)]) then writeln('RECORD INESISTENTE!')
                           else
                            begin
                             seek(mondo,numCANC-1);
                             read(mondo,persona);
                             writeln('- RECORD nø ',numCANC);
                             writeln('Nome: ',persona.nome);
                             writeln('Cognome: ',persona.cogn);
                             writeln('Et…: ',persona.eta);
                             writeln('Sesso: ',persona.sesso);
                             writeln;
                             delete(persona.nome,1,1);
                             textcolor(10);
                             writeln('Questo record Š stato reso disponibile!');
                             seek(mondo,numCANC-1);
                             write(mondo,persona);
                             readln;
                            end;
      end;
   4: ;
   else begin
         writeln;
         writeln('ERRORE. L''operazione selezionata non esiste!');
         readln;
        end;
  end;
 until op2 in [1..4];
 close(mondo);
end;

 { M A I N }

begin
 clrscr;
 assign(mondo,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\GFILE4-1.txt');
 repeat
  textbackground(blue);
  clrscr;
  textcolor(red);
  writeln('                    ___________________________');
  textcolor(white);
  writeln('          **********..::: Gestione FILE 4 :::..**********');
  textcolor(red);
  writeln('                    ---------------------------');
  writeln;
  textcolor(10);
  writeln('          Scegliere l''operazione da svolgere:');
  textcolor(yellow);
  writeln('      ==========================================================');
  textcolor(7);
  writeln('         = 1 = Caricamento del file');
  writeln('         = 2 = Visualizzazione del file');
  writeln('         = 3 = Ricerca di un record');
  writeln('         = 4 = Modifica di un record');
  writeln('         = 5 = Aggiunta di un record in coda');
  writeln('         = 6 = Aggiunta di un record in una posizione specifica');
  writeln('         = 7 = Cancellare o rendere disponibile un record');
  textcolor(15);
  writeln('         = 8 = Uscire');
  textcolor(yellow);
  writeln('      ==========================================================');
  writeln;
  textcolor(10);
  write('        ::> ');
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


