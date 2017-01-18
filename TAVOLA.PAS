Program Tavola_Pitagorica;
Var A,B:integer;
Begin
Writeln(' ______________________ Tavola Pitagorica ______________________');
Writeln;
For A:=1 to 10 do
begin
For B:=1 to 10 do write(A*B:6);
Writeln;
end;
Writeln;
readln;
End.