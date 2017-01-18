Program Sistema_Lineare;
Var A1,B1,C1,A2,B2,C2,DELTA,DELTAX,DELTAY:real;
Begin
Writeln('Risoluzione di un sistema lineare nella forma');
Writeln;
Writeln('[A1x+B1y=C1');
Writeln;
Writeln('[A2x+B2y=C2');
Writeln;
Writeln('Digitare i coefficienti ed i termini noti richiesti');
Writeln('Al=');
Readln(A1);
Writeln('B1=');
Readln(B1);
Writeln('C1=');
Readln(C1);
Writeln('A2=');
Readln(A2);
Writeln('B2=');
Readln(B2);
Writeln('C2=');
Readln(C2);
DELTA:=A1*B2-A2*B1;
DELTAX:=C1*B2-C2*B1;
DELTAY:=A1*C2-A2*C1;
If (DELTA<>0) then
   begin
   writeln ('Sistema determinato; x=',DELTAX/DELTA:8:3);
   writeln ('                     y=',DELTAY/DELTA:8:3);
   end;
If DELTA=0 then
   begin
   if (DELTAX=0) and (DELTAY=0) then writeln ('Sistema indeterminato');
   if (DELTAX<>0) and (DELTAY<>0) then writeln ('Sistema impossibile');
   end;
Writeln;
Writeln ('Premere un tasto per tornare in ambiente Editor');
Repeat until keypressed;
End.
