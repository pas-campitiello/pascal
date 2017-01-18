Program grafica;
uses Graph;
var Gd,Gm,Size,y,x: Integer;
    Radius: Integer;
begin
 Gd := Detect;
 InitGraph(Gd, Gm, 'C:\Tp7\Bgi');
 if GraphResult <> grOk then
                            begin
                             writeln('ERRORE DI INIZIALIZZAZIONE GRAFICA');
                             Halt(1);
                            end;
 Rectangle(0,0,GetMaxX,GetMaxY);
 MoveTo(10,10);
 OutText('Testo a partire dalla coordinata 10 10');
 Readln;
 OutTextXY(450,430,'<- Coordinata 450 430');
 Readln;
 OutTextXY(300,200,'Centro!');
 Readln;
 ClearDevice;
 Rectangle(0,0,GetMaxX,GetMaxY);
 y:=0;
 for Size:=1 to 4 do
 begin
  SetTextStyle(DefaultFont,HorizDir,Size);
  OutTextXY(10,y+10, 'Size = ' + Chr(Size + 48));
  Inc(y,TextHeight('H')+1);
 end;
 Readln;
 ClearDevice;
 Rectangle(0,0,GetMaxX,GetMaxY);
 MoveTo(5,5);
 SetTextStyle(0,HorizDir,1);
 OutText('Font disponibili:');
 x:=0;
 Size:=0;
 for y:=0 to 4 do
 begin
  x:=x+40;
  case y of
   0: Size:=3;
   1: Size:=5;
   2: Size:=10;
   3: Size:=5;
   4: Size:=5;
  end;
  SetTextStyle(y,HorizDir,Size);
  OutTextXY(10,x,'Font nø '+ chr(y+48));
 end;
 readln;
 CloseGraph;
end.