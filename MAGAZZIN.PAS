Program magazzino;
uses CRT;
const max=2;
type cent=1..100;

     prezzi= record
              p5:real;
              p4:real;
              p3:real;
              p2:real;
              p1:real;
             end;

     art= record
           codice:cent;
           descrizione:string;
           prezVendita:real;
           prezAcquisto:prezzi;
           prezUltimoAcq:real;
           reparto:string;
           quantAttuale:word;
          end;

var articoli:array[1..max] of art;
    i,op:integer;
    trovato:boolean;

procedure ValTotale;
var s,a,m:real;
begin
 s:=0;
 for i:=1 to max do
  begin
   a:=articoli[i].prezAcquisto.p5+
      articoli[i].prezAcquisto.p4+
      articoli[i].prezAcquisto.p3+
      articoli[i].prezAcquisto.p2+
      articoli[i].prezAcquisto.p1;
   s:=s+a;
  end;
 m:=s/(max*5);
 writeln;
 writeln('IL VALORE TOTALE DEL MAGAZZINO E'': ',m:0:2);
end;

procedure ValProdotto;
var cod:cent;
    v:real;
begin
 writeln;
 write('Inserire il codice del prodotto (1-100): ');
 readln(cod);
 writeln;
 i:=0;
 trovato:=false;
 repeat
  i:=i+1;
  if articoli[i].codice=cod then
                             begin
                              trovato:=true;
                              v:=articoli[i].prezUltimoAcq*articoli[i].quantAttuale;
                              writeln('Il valore del prodotto con codice ',cod,' Š ',v:0:2);
                             end;
 until (i=max) or trovato;
 if not(trovato) then writeln('L''articolo con codice ',cod,' non esiste');
end;

procedure TuttoReparto;
var rep:string;
begin
 writeln;
 write('Inserire il nome del reparto: ');
 readln(rep);
 i:=0;
 trovato:=false;
 repeat
  i:=i+1;
  if articoli[i].reparto=rep then
                              begin
                               writeln;
                               trovato:=true;
                               writeln('Codice articolo: ',articoli[i].codice);
                               writeln('Descrizione: ',articoli[i].descrizione);
                               writeln('Prezzo dell''anno scorso: ',articoli[i].prezAcquisto.p1:0:2);
                               writeln;
                              end;
 until i=max;
 writeln;
 if not(trovato) then writeln('Non esistono articoli nel reparto ',rep);
end;

begin
 clrscr;
 for i:=1 to max do
  begin
   textcolor(9);
   writeln('            -------------------------------------------');
   textcolor(10);
   writeln('                              MAGAZZINO');
   textcolor(9);
   writeln('            -------------------------------------------');
   textcolor(7);
   writeln;
   textcolor(4);
   writeln('Articolo nø ',i,'---');
   writeln;
   with articoli[i] do
    begin
     textcolor(6); write('Codice (1-100): ');
     textcolor(7); readln(codice);
     textcolor(6); write('Descrizione: ');
     textcolor(7); readln(descrizione);
     textcolor(6); write('Prezzo di vendita: ');
     textcolor(7); readln(prezVendita);
     with articoli[i].prezAcquisto do
      begin
       textcolor(6);  write('Prezzo di acquisto di 5 anni fa: ');
       textcolor(7);  readln(p5);
       textcolor(6);  write('Prezzo di acquisto di 4 anni fa: ');
       textcolor(7);  readln(p4);
       textcolor(6);  write('Prezzo di acquisto di 3 anni fa: ');
       textcolor(7);  readln(p3);
       textcolor(6);  write('Prezzo di acquisto di 2 anni fa: ');
       textcolor(7);  readln(p2);
       textcolor(6);  write('Prezzo di acquisto dell''anno scorso: ');
       textcolor(7);  readln(p1);
      end;
     textcolor(6); write('Prezzo ultimo di acquisto: ');
     textcolor(7); readln(prezUltimoAcq);
     textcolor(6); write('Reparto: ');
     textcolor(7); readln(reparto);
     textcolor(6); write('Quantit… in giacenza attuale: ');
     textcolor(7); readln(quantAttuale);
    end;
    readln;
    clrscr;
  end;
 repeat
  clrscr;
  textcolor(9); write('             --- ');
  textcolor(10); write('MENU ');
  textcolor(9); write('---');
  writeln;
  writeln;
  textcolor(7);
  textcolor(white); write(' 1:');
  textcolor(7); write(' Calcolo del valore totale del magazzino');
  writeln;
  textcolor(white); write(' 2: ');
  textcolor(7); write('Calcolo del valore di un prodotto');
  writeln;
  textcolor(white); write(' 3: ');
  textcolor(7); write('Visualizzazione della descrizione e del prezzo dell''anno scorso');
  writeln;
                write('    degli articoli di un reparto');
  writeln;
  writeln;
  textcolor(red); write('Selezionare l''operazione desiderata: ');
  textcolor(white);
  readln(op);
 until (op>0) and (op<4);
 writeln;
 writeln('--------- Operazione ',op,' ---------');
 case op of
  1: ValTotale;
  2: ValProdotto;
  3: TuttoReparto;
 end;
 textcolor(8);
 writeln;
 writeln('PREMERE UN TASTO PER USCIRE...');
 readln;
end.