Program Ricerca;
Uses Crt;
Const Max=30;
Var Vett:ARRAY [1..Max] OF integer;
    Dim,Num,Posto,i:integer;
    NumTrov:boolean;

Begin
 Clrscr;
 Write('Questo programma ricerca un valore in un elenco massimo di ',Max,' numeri');
 Writeln;
 Writeln;
 REPEAT
  Write('Dammi la dimensione: ');
  Readln(Dim);
  Writeln;
 UNTIL (Dim>=1) AND (Dim <=Max);
 i:=1;
 FOR i:=1 TO Dim DO
  Begin
   Write ('Dammi il ',i,'ø numero: ');
   Readln (Vett[i]);
   Writeln;
  End;

 Write('Dammi il numero da ricercare: ');
 Readln(Num);
 Writeln;

 NumTrov:=False;
 Posto:=1;
 REPEAT
  IF Vett[Posto]=Num THEN NumTrov:=True
                     ELSE Posto:=Posto+1;
 UNTIL (Posto>Dim) OR NumTrov;
 IF NumTrov THEN Writeln ('Il numero ',Num,' Š stato trovato al ',Posto, 'ø posto dell''elenco')
            ELSE Writeln ('Il numero ',Num,' non Š presente nell''elenco');
 Readln;
End.
