program movingclock;
{------------------------------------------------------------------------------

                                REVISION HISTORY

v1.00  : 1993/08/19.  First public release.  DDA
v1.00a : 1993/08/30.  Fixed cursoron procedure, with thanks to David Cheung.
v1.01  : 1993/09/10.  New getcursor and setcursor procedures, via Randall
                          Woodman.  Supercede cursoroff/ cursoron.     DDA
v1.02  : 1993/09/27.  Refined getcursor and setcursor procedures, with much
                          help from Mark Shadley.  DDA

------------------------------------------------------------------------------

   TABELLA DELLE REVISIONI

v1.00  : 1993/08/19.  Prima distribuzione pubblica.  DDA
v1.00a : 1993/08/30.  Fissata procedura cursoron, grazie a David Cheung.
v1.01  : 1993/09/10.  Nuove procedure getcursor e setcursor, da Randall
                          Woodman.  Supercede(?) cursoroff/ cursoron.     DDA
v1.02  : 1993/09/27.  Refinite le procedure getcursor e setcursor, con molto
                          aiuto di Mark Shadley.  DDa}

uses crt ,
     dos ;
const
 progdata = 'MCLK - Free DOS utility: colorful moving clock display.';
            {MCLK - Utilit… gratuita DOS: visualizzazione di un colorito orologio  in movimento}
 progdat2 = 'V1.02: September 27, 1993. (c) 1993 by David Daniel Anderson - Reign Ware.';
            {V1.02: 27 settembre 1993, (c) 1993 di David Daniel Anderson - Reign Ware (?)}
 usage = 'Usage:  MCLK';
         {Uso: MCLK}
var
    rtcol,
    btrow,
    xcord,
    ycord   : byte ;
    dum     : char ;

procedure showhelp;
begin
     writeln (progdata);
     writeln (progdat2);
     writeln (usage);
     halt ;
end;

{ These two cursor procedures are via Randall Woodman }
{ Queste due procedure sono di Randall Woodman}

procedure getcursor (var curssize : integer );
const
   video  = $0010;
   getcur = $0300;
var
  regs : registers ;
begin
   regs.ax := getcur ;
   intr(video,regs) ;
   curssize := regs.cx;  { upper scan line - scan della riga superiore }
end;

procedure setcursor ( curssize : integer );
const
  videoio     = $10;
  cursorshape =   1;
var
  regs : registers ;
begin
   regs.cx:=curssize;
   regs.ah:=cursorshape;
   intr(videoio,regs);
end;

function leadingzero(w : word) : string;
var
  s : string;
begin
  str(w:0,s);
  if length(s) = 1 then
    s := '0' + s;
  leadingzero := s;
end;

procedure ddate;
var
    h,mi,s,u   : word ;
    date_time  : datetime ;
begin
     gettime (h,mi,s,u);
     with date_time do
     begin
          hour := ( h );
       write ( leadingzero ( hour ) , ':' );
          min  := ( mi );
       write ( leadingzero ( min  ) , ':' );
          sec  := ( s );
       write ( leadingzero ( sec  ));
     end;
end;

var csize : integer ;

begin
    checkbreak := false ;
    if paramcount <> 0 then showhelp;

    rtcol := lo ( windmax ) - 7 ;
    btrow := hi ( windmax ) + 1 ;
    textattr := 8;
    clrscr ;
    randomize ;
    getcursor(csize);
    setcursor($2000);

    while not keypressed do begin
    textattr := succ ( textattr );
    if ( textattr = 16 ) then
         textattr := 9;
    xcord := 1 + random ( rtcol ) ;
    ycord := 1 + random ( btrow ) ;
    gotoxy ( xcord , ycord );
    ddate ;
    delay ( 990 ) ;
    clrscr ;
    end;

    while keypressed do dum := readkey ;

    setcursor(csize);
end.
