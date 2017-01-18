Program combinazioni_disposizioni_fattoriali;
uses CRT;
var a,b,c,n,k,rip,ripcom,z:integer;
    disp,nfatt,comb:real;
begin
clrscr;
writeln('---------- Calcolo COMBINATORIO e FATTORIALE -----------');
writeln('--------------------------------------------------------');
writeln('Che calcolo dei eseguire? (1/2/3)');
writeln;
writeln('   1) Combinazioni');
writeln('   2) Disposizioni');
writeln('   3) Fattoriale');
writeln;
write('- ');
readln(a);
writeln;
If a=1 then
           begin
            clrscr;
            writeln('------ COMBINAZIONI (C n,k ) ------');
            writeln;
            writeln(' Combinazioni come?');
            writeln;
            writeln('  1) senza ripetizione');
            writeln('  2) con ripetizione');
            writeln;
            write('- ');
            readln(ripcom);
            if ripcom=1 then
                            begin
                             clrscr;
                             writeln('------ COMBINAZIONI senza ripetizione (C n,k) ------');
                             write('Inserisci n: ');
                             readln(n);
                             write('Inserici k: ');
                             readln(k);
                             writeln;
                             write('C ',n,',',k,' = ');
                             disp:=n;
                             b:=1;
                             Repeat
                              n:=n-1;
                              b:=b+1;
                              disp:=disp*n;
                             Until b=k;
                             nfatt:=k;
                             Repeat
                              k:=k-1;
                              nfatt:=nfatt*k;
                             Until k=1;
                             comb:=disp/nfatt;
                             write(comb:0:4);
                            end;
            if ripcom=2 then
                            begin
                             clrscr;
                             writeln('------ COMBINAZIONI con ripetizione (C'' n,k) ------');
                             write('Inserisci n: ');
                             readln(n);
                             write('Inserici k: ');
                             readln(k);
                             writeln;
                             write('C'' ',n,',',k,' = ');
                             disp:=n;
                             b:=1;
                             Repeat
                              n:=n+1;
                              b:=b+1;
                              disp:=disp*n;
                             Until b=k;
                             nfatt:=k;
                             Repeat
                              k:=k-1;
                              nfatt:=nfatt*k;
                             Until k=1;
                             comb:=disp/nfatt;
                             write(comb:0:4);
                            end;
           end;
If a=2 then
           begin
            clrscr;
            writeln('------ DISPOSIZIONI (D n,k ) ------');
            writeln;
            writeln(' Disposizioni come?');
            writeln;
            writeln('  1) senza ripetizione');
            writeln('  2) con ripetizione');
            writeln;
            write('- ');
            readln(rip);
            if rip=1 then
                         begin
                          clrscr;
                          writeln('------ DISPOSIZIONI senza ripetizione (D n,k) ------');
                          write('Inserisci n: ');
                          readln(n);
                          write('Inserici k: ');
                          readln(k);
                          writeln;
                          write('D ',n,',',k,' = ');
                          disp:=n;
                          b:=1;
                          Repeat
                           n:=n-1;
                           b:=b+1;
                           disp:=disp*n;
                          Until b=k;
                          write(disp:0:0);
                         end;
            if rip=2 then
                         begin
                          clrscr;
                          writeln('------ DISPOSIZIONI con ripetizione (D'' n,k) ------');
                          write('Inserisci n: ');
                          readln(n);
                          write('Inserici k: ');
                          readln(k);
                          writeln;
                          write('D'' ',n,',',k,' = ');
                          if k=1 then Write(n)
                                 else
                                     begin
                                      disp:=n*n;
                                      for c:= 1 to (k-2) do
                                      disp:=disp*n;
                                      write(disp:0:0);
                                     end;
                         end;
           end;
if a=3 then
           begin
            clrscr;
            writeln('------ FATTORIALE (z!) ------');
            write('Inserisci z (il numero di cui vuoi calcolare il fattoriale) ');
            readln(z);
            writeln;
            write('Il fattoriale di ',z,' Š ');
            nfatt:=z;
            repeat
            z:=z-1;
            nfatt:=nfatt*z;
            Until z=1;
            write(nfatt:0:2);
           end;
If a>3 then writeln('ERRORE! Il numero inserito non Š nel menu!');
readln;
end.