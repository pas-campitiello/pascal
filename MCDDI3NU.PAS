Program MCD_3_numeri;
uses CRT;
var A,B,C,MCD1:integer;

Function MCD (H,K:integer):integer;
var Z,T:integer;
begin
 while H<>K do
  begin
   if H>K then H:=H-K
          else K:=K-H;
  end;
 MCD:=H;
end;

begin
 clrscr;
 writeln('Scrivere i 3 numeri separati da uno spazio');
 readln(A,B,C);
 MCD1:=MCD(A,B);
 writeln;
 writeln('Il massimo comun divisore tra ',A,', ',B,' e ',C,' Š: ',MCD(MCD1,C));
 readln;
end.