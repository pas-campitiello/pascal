Program Password2;
uses CRT;
var A:array[1..26] of char;
    I,b,c:integer;
begin
clrscr;
for I:=1 to 26 do
 begin
  writeln('Scrivi la ',I,'¦ lettera dell_alfabeto');
  readln(A[I]);
 end;
writeln;
Writeln('La password Š:');
Randomize;
for I:=1 to 4 do
 begin
  b:=random(26);
  case b of
  1: write(A[1]);
  2: write(A[2]);
  3: write(A[3]);
  4: write(A[4]);
  5: write(A[5]);
  6: write(A[6]);
  7: write(A[7]);
  8: write(A[8]);
  9: write(A[9]);
  10: write(A[10]);
  11: write(A[11]);
  12: write(A[12]);
  13: write(A[13]);
  14: write(A[14]);
  15: write(A[15]);
  16: write(A[16]);
  17: write(A[17]);
  18: write(A[18]);
  19: write(A[19]);
  20: write(A[20]);
  21: write(A[21]);
  22: write(A[22]);
  23: write(A[23]);
  24: write(A[24]);
  25: write(A[25]);
  26: write(A[26]);
  end;
 c:=random(10);
 write(c);
 end;
readln;
end.