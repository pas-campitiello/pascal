(* From: ts@uwasa.fi (Timo Salmi) *)

  uses Crt, Dos;
{**********************************************}
 Procedure ResetMouse;
  var regs : registers;
  Begin
    FillChar (regs, SizeOf(regs), 0);
    regs.ax := $0000;
    Intr ($33, regs);
   if regs.ax <> $FFFF then begin
      writeln ('Hardware/driver non installati');
      halt;
   end;
  end; (* ResetMouse *)
{**********************************************}
 Procedure ShowMouseCursor;
  var regs : registers;
  begin
    FillChar (regs, SizeOf(regs), 0);
    regs.ax := $0001;
    Intr ($33, regs);
 end; (* ShowMouseCursor *)
{**********************************************}
procedure HideMouseCursor;
  var regs : registers;
   begin
    FillChar (regs, SizeOf(regs), 0);
    regs.ax := $0002;
    Intr ($33, regs);
   end; (* HideMouseCursor *)
{**********************************************}
 Procedure GetMouseCursor (var row, column, button : word);
  var Regs : Registers;
  Begin
    FillChar (Regs, SizeOf(Regs), 0);
    Regs.ax := $0003;
    Intr ($33, Regs);
    Row    := Regs.dx Div 8;
    Column := Regs.cx Div 8;
    Button := Regs.bx;
  End; (* GetMouseCursor *)
{**********************************************}
 Procedure PutMouseCursor (Row, Column : word);
   var Regs : Registers;
   Begin
      FillChar (Regs, SizeOf(Regs), 0);
      Regs.ax := $0004;
      Regs.dx := 8 * row;
      Regs.cx := 8 * column;
      Intr ($33, regs);
   End; (* PutMouseCursor *)
{**********************************************}
procedure TEST;
  var Row, Col, But : word;
  begin
  Clrscr;
    repeat
      GotoXY(1,1);
      GetMouseCursor (Row, Col, But);
      TextColor(LightRed+Blink);
      write (' Riga= ', row:2, ', Colonna= ', col:2, ', Tasto=', but:2);
    until KeyPressed;
  end;
{**********************************************}
  Begin
    ResetMouse;
    ShowMouseCursor;
    PutMouseCursor (12, 39);
    TEST;
    HideMouseCursor;
  end.
{**********************************************}

