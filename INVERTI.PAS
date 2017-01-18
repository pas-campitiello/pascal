Program InverNum;
Uses Crt;
Var i:integer;
    V:ARRAY [1..10] OF string;
Begin
 Clrscr;
 Write ('Programma per invertire l''ordine di 10 numeri col FOR DOWNTO DO');
 Writeln;
 Writeln;
 i:=1;
 FOR i:=1 TO 10 DO
  Begin
   Write ('Dammi il numero di posizione ',i,': ');
   Readln (V[i]);
  End;
 writeln;
 FOR i:=10 DOWNTO 1 DO Writeln (V[i]:6);
 Readln;
End.
