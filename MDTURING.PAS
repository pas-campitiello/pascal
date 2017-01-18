Program Macchina_di_Turing;
uses CRT;
var cifre,cifreappoggio:array[1..20] of byte;
    i,ncifre:integer;
    r1:boolean;
begin
 clrscr;
 writeln('============================= MACCHINA di TURING =============================');
 writeln('Per il calcolo del quoziente e del resto della divisione di un nø intero per 2');
 writeln;
 write('Di quante cifre Š formato il dividendo? (max=20) ');
 readln(ncifre);
 writeln;
 writeln('Da sinistra verso destra:');
 writeln;
 for i:=1 to ncifre do
  begin
   write('Cifra nø ',i,': ');
   readln(cifre[i]);
   cifreappoggio[i]:=cifre[i];
  end;

 if cifre[1] mod 2 = 0 then r1:=false
                       else r1:=true;

 cifre[1]:=cifre[1] div 2;

 i:=2;
 repeat
  if r1=false then
                  begin
                   if cifre[i] mod 2 <> 0 then r1:=true;
                   cifre[i]:=cifre[i] div 2;
                  end
              else
                  begin
                   if cifre[i] mod 2 = 0 then r1:=false;
                   cifre[i]:=(cifre[i]+10) div 2;
                  end;
  i:=i+1;
 until i>ncifre;

 writeln;
 for i:=1 to ncifre do
  write(cifreappoggio[i]);
 write(' : 2');
 writeln;
 writeln('   _____________________');
 write('        ');
 for i:=1 to ncifre do
  write(cifre[i]);
 writeln;
 writeln;
 if r1 then writeln('Con resto di 1')
       else writeln('Con resto di 0');
 readln;
end.