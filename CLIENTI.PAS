Program FILE_Clienti;          {Esempio di programma con file indicizzato}
uses CRT;
type cli = record
            nome,cogn,ind,cod:string;
           end;

var clienti:file of cli;
    tabella:array[1..20,1..2] of string;  { Nel file massimo 20 record }
    cliente:cli;
    i,j,y,c:integer;
    op,ris:byte;
    s,cc:string;
    esc:char;

procedure InserimentoRec;
begin
 with cliente do
  begin
   write('Nome: ');
   readln(nome);
   write('Cognome: ');
   readln(cogn);
   write('Indirizzo: ');
   readln(ind);
   write('Codice di c/c: ');
   readln(cod);
  end;
end;

procedure ordinaTABELLA(dim:longint);
var temp:string;
begin
 for i:=1 to dim-1 do
  for j:=i+1 to dim do
  if tabella[i,1]>tabella[j,1] then
                                  begin
                                   temp:=tabella[i,1];
                                   tabella[i,1]:=tabella[j,1];
                                   tabella[j,1]:=temp;
                                   temp:=tabella[i,2];
                                   tabella[i,2]:=tabella[j,2];
                                   tabella[j,2]:=temp;
                                  end;
end;

procedure creaTABELLA;
begin
 {$I-}
 reset(clienti);
 if ioresult<>0 then
                    begin
                     {$I+}
                     textcolor(12);
                     writeln('Il file CLIENTI non esiste ancora. Caricare il file...');
                     readln;
                    end
                else
                    begin
                     {$I+}
                     for i:=1 to filesize(clienti) do
                      begin
                       str(filepos(clienti),s);
                       read(clienti,cliente);
                       tabella[i,1]:=cliente.cod;
                       tabella[i,2]:=s;
                      end;
                     ordinaTABELLA(filesize(clienti));
                     close(clienti);
                    end;
end;

procedure caricaStandard;
begin
 rewrite(clienti);
 c:=0;
 repeat
  c:=c+1;
  clrscr;
  textcolor(10);
  writeln('--- Carica del file CLIENTI ---');
  textcolor(white);
  writeln;
  InserimentoRec;
  str(filepos(clienti),s);
  tabella[c,1]:=cliente.cod;
  tabella[c,2]:=s;
  write(clienti,cliente);
  writeln;
  write('Uscire (s/n)? ');
  readln(esc);
 until esc='s';
 close(clienti);
 creaTABELLA;
end;

procedure AggiuntaInCoda;
begin
 clrscr;
 textcolor(12);
 writeln('--- Aggiunta di un record in coda ---');
 writeln;
 textcolor(white);
 reset(clienti);
 repeat
  read(clienti,cliente);
 until EOF(clienti);
 InserimentoRec;
 write(clienti,cliente);
 close(clienti);
 creaTABELLA;
 readln;
end;

procedure CaricaFILE;
begin
 {$I-}
 reset(clienti);
 if ioresult<>0 then
                    begin
                     {$I+}
                     caricaStandard;
                    end
                else
                 begin
                  {$I+}
                  writeln;
                  textcolor(12);
                  writeln(' ATTEZIONE! Il file che si vuole caricare gi… esiste! Fare un scelta:');
                  writeln;
                  writeln(' = 1 = Aggiungere un record in coda ');
                  writeln(' = 2 = Creare un nuovo file sovrascrivendo il precedente');
                  writeln(' = 3 = USCIRE');
                  writeln;
                  write('::> ');
                  readln(ris);
                  case ris of
                   1: AggiuntaInCoda;
                   2: caricaStandard;
                   3: ;
                   else write('Operazione inesistente!');
                  end;
                 end;
end;

procedure stampa;
begin
 clrscr;
 textcolor(10);
 writeln('--- Visualizzazione del file CLIENTI ---');
 writeln;
 textcolor(white);
 writeln('Nø Record |   Nome     |    Cognome    |       Indirizzo       | Cod. c/c');
 textcolor(yellow);
 writeln('==========================================================================');
 textcolor(7);
 for i:=1 to filesize(clienti) do
  begin
   if i=1 then y:=5
          else y:=(5+i)-1;
   read(clienti,cliente);
   write('  ',i);
   gotoxy(12,y);
   write(cliente.nome);
   gotoxy(25,y);
   write(cliente.cogn);
   gotoxy(41,y);
   write(cliente.ind);
   gotoxy(68,y);
   write(cliente.cod);
   writeln;
  end;
 close(clienti);
end;

procedure VisualizzaFILE;
begin
 {$I-}
 reset(clienti);
 if ioresult<>0 then
                   begin
                    writeln;
                    textcolor(12);
                    writeln(' ATTEZIONE! Il file che si vuole visualizzare Š vuoto!');
                    writeln(' ...Caricare il file');
                   end
                else stampa;
 readln;
end;

procedure Ricerca;
var ps,pd,pm,max,punt,code:integer;
    trovato:boolean;
    pos:string;
begin
 clrscr;
 reset(clienti);
 max:=filesize(clienti);
 textcolor(10);
 writeln('--- Ricerca di un record ---');
 writeln;
 textcolor(white);
 write('Inserire il codice di c/c del cliente: ');
 readln(cc);
 writeln;
 trovato:=false;
 ps:=1;
 pd:=max;
 pos:='';
 Repeat
  pm:=(ps+pd) div 2;
  if (tabella[pm,1]=cc) or (tabella[ps,1]=cc) or (tabella[pd,1]=cc) then
                                               begin
                                                if tabella[pm,1]=cc then pos:=tabella[pm,2];
                                                if tabella[ps,1]=cc then pos:=tabella[ps,2];
                                                if tabella[pd,1]=cc then pos:=tabella[pd,2];
                                               end
     else
      if cc>tabella[pm,1] then ps:=pm+1
                          else pd:=pm-1;
 Until (ps>pd) or (pos<>'');
 If pos<>'' then
               begin
                textcolor(14);
                writeln(' - CLIENTE TROVATO:');
                writeln;
                val(pos,punt,code);
                seek(clienti,punt);
                read(clienti,cliente);
                writeln('Nome: ',cliente.nome);
                writeln('Cognome: ',cliente.cogn);
                writeln('Indirizzo: ',cliente.ind);
                writeln('Codice di c/c: ',cliente.cod);
               end
            else writeln(' - CLIENTE non trovato -');
 close(clienti);
 readln;
end;

procedure VisMatrice;
begin
 clrscr;
 textcolor(10);
 writeln('--- Visualizzazione della matrice indice ---');
 writeln;
 textcolor(white);
 for i:=1 to 20 do
  begin
   for j:=1 to 2 do
     write(' ',tabella[i,j]);
   writeln;
  end;
  readln;
end;

 { M A I N }

begin
 clrscr;
 assign(clienti,'C:\WINDOWS\Desktop\Ufficio\Progra~1\TURBO3~1.01\Progra~1\Clienti.txt');
 creaTABELLA;
 repeat
  textbackground(blue);
  clrscr;
  textcolor(red);
  writeln('               _______________________________________');
  textcolor(white);
  writeln('                          *** CLIENTI ***');
  writeln('                    Programma con file indicizzato');
  textcolor(red);
  writeln('               _______________________________________');
  writeln;
  textcolor(10);
  writeln('          Scegliere l''operazione da svolgere:');
  textcolor(yellow);
  writeln('      ==========================================================');
  textcolor(7);
  writeln('         = 1 = Caricare il file CLIENTI');
  writeln('         = 2 = Visualizzare il file CLIENTI');
  writeln('         = 3 = Aggiungere un record in coda');
  writeln('         = 4 = Ricercare un record');
  writeln('         = 5 = Visualizzare la matrice indice');
  textcolor(15);
  writeln('         = 6 = Uscire');
  textcolor(yellow);
  writeln('      ==========================================================');
  writeln;
  textcolor(10);
  write('        ::> ');
  readln(op);
  case op of
   1: CaricaFILE;
   2: VisualizzaFILE;
   3: AggiuntaInCoda;
   4: Ricerca;
   5: VisMatrice;
   6: ;
   else begin
         writeln;
         writeln('ERRORE. L''operazione selezionata non esiste!');
         readln;
        end;
  end;
 until op=6;
end.