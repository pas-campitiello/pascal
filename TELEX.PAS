Program telex;
uses CRT;
var s:string[20];
    i:integer;

begin
 clrscr;
 s:='Stringa TELEX...';
 for i:=1 to Length(s) do
  begin
   delay(4000);
   write(s[i]);
  end;
 readln;
end.