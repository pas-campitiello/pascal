Program CreaFile;
uses CRT;
type IND = record
            via,citta:string[20];
            nciv,cap:integer;
           end;
     DATIALUNNO = record
                   numero:integer;
                   cognome,scprov:string[20];
                   nome: string[15];
                   indirizzo:IND;
                   tel:string[12];
                  end;
var elenco:file of DATIALUNNO;
    alunno:DATIALUNNO;
    nr:integer;
    fine:char;

procedure LEGGIRECORD(var X:DATIALUNNO);
begin
 with X do
  begin
   clrscr;
   write('Numero di elenco: ');
   readln(numero);
   write('Cognome: ');
   readln(cognome);
   write('Nome: ');
   readln(nome);
   with indirizzo do
    begin
     write('Via: ');
     readln(via);
     write('Numero civico: ');
     readln(nciv);
     write('CAP: ');
     readln(cap);
     write('Citt…: ');
     readln(citta);
    end;
   write('Telefono: ');
   readln(tel);
   write('Scuola provenienza: ');
   readln(scprov);
  end;
 write(elenco,alunno);
end;

{MAIN}

begin
 assign(elenco,'C:\WINDOWS\Desktop\UFFICIO\TURBO3~1.01\PROGRA~2\DATIAL.DAT');
 rewrite(elenco);
 clrscr;
 writeln(' PROGRAMMA PER LA CREAZIONE DI UN FILE');
 writeln;
 writeln('Durante l''elaborazione, premi untasto qualsiasi per continuare');
 writeln;
 writeln('''s'' per finire');
 delay(500);
 repeat
  LEGGIRECORD(ALUNNO);
  fine:=readkey;
 until fine='s';
 close(elenco);
readln;
end.
