{This is Public Domain, it may be distributed as long as you don't take
paid for it. Coded by Bjîrn Hallstrîm [bjorn@comports.com]}

{Questo ä Pubblico Dominio, puï essere distribuito finchä non si paghi per
averlo. Scritto da Bjîrn Hallstrîm [bjorn@comports.com]}

Program Calendario;

Uses Crt;

Const Jan = 31;
      Feb = 28;
      Mar = 31;
      Apr = 30;
      May = 31;
      Jun = 30;
      Jul = 31;
      Aug = 31;
      Sep = 30;
      Oct = 31;
      Nov = 30;
      Dec = 31;
      Leap = 366 MOD 7;
      Normal = 365 MOD 7;

Type Monthtype = Record
                   Number : Byte;
                   MName  : String;
                 End;

Var Monthdata: Array[1..12] Of Monthtype;
    Startday,TotalDays,NumDays : Word;

Var month,year:word;

Procedure GetMonthData;
Begin
  Monthdata[1].Number:=31;
  Monthdata[1].MName:='Gennaio';
  Monthdata[2].Number:=28;
  Monthdata[2].MName:='Febbraio';
  Monthdata[3].Number:=31;
  Monthdata[3].MName:='Marzo';
  Monthdata[4].Number:=30;
  Monthdata[4].MName:='Aprile';
  Monthdata[5].Number:=31;
  Monthdata[5].MName:='Maggio';
  Monthdata[6].Number:=30;
  Monthdata[6].MName:='Giugno';
  Monthdata[7].Number:=31;
  Monthdata[7].MName:='Luglio';
  Monthdata[8].Number:=31;
  Monthdata[8].MName:='Agosto';
  Monthdata[9].Number:=30;
  Monthdata[9].MName:='Settembre';
  Monthdata[10].Number:=31;
  Monthdata[10].MName:='Ottobre';
  Monthdata[11].Number:=30;
  Monthdata[11].MName:='Novembre';
  Monthdata[12].Number:=31;
  Monthdata[12].MName:='Dicembre';
End;

Function IsLeapYear(n:Word):Boolean;
Begin
  If (N MOD 4 = 0) AND (N MOD 100 <> 0) OR (N MOD 400 = 0) Then
    IsLeapYear:=True
  Else IsLeapYear:=False;
End;

Function GetInput (Prompt:String; min,max:Word):Word;
Var Value:Word;
Begin
  Repeat
    GotoXY(1,1);
    Write(Prompt);
    Read(value)
  Until (Value>=min) And (value<=max);
  GetInput := Value
END;

{ ====================== COMPUTEMONTH ========================
      Computes the first day and the total days in a month.
  ============================================================}
{ CALCOLA MESE: calcola il primo giorno e il totale dei giorni in un mese }

Procedure ComputeMonth(Year, Month:word);
Var i : Word;
Begin
   {Calculate total number of days (NumDays) since 1/1/1899.
    Start with whole years:}

   {Calcola il numero totale dei giorni (NumDays) dal 1/1/1899
    Inizia con anni interi:}

   NumDays := 0;
   For I := 1899 To Year - 1 Do
   Begin
     If IsLeapYear(I) Then   {If year is leap, add - Se l'anno ä bisestile}
       Inc(NumDays, Leap)    {366 MOD 7.}
     Else                    {If normal year, add - Se l'anno ä normale}
       Inc(NumDays, Normal); {365 MOD 7.}
   End;

   {Next, add in days from whole months -
   Poi, aggiungi ai giorni dai mesi interi}
   For I := 1 To Month - 1 Do
     Inc(NumDays, MonthData[I].Number);

   {Set the number of days in the requested month -
   Imposta il numero di giorni nel mese richiesto}
   TotalDays := MonthData[Month].Number;

   {Compensate if requested year is a leap year -
   Compensa se l'anno richiesto ä bisestile}
   If IsLeapYear(Year) Then
   Begin
     {If after February, add one to total days -
     Se dopo febbraio, aggiungi uno al totale giorni}
     IF Month > 2 Then Inc(NumDays)
      {If February, add one to the month's days:
       Se febbraio, aggiungi uno ai giorni del mese:}
     Else If Month = 2 Then
       Inc(TotalDays, 1);
   End;

   {1/1/1899 was a Sunday, so calculating "NumDays MOD 7"
    gives the day of week (Sunday = 0, Monday = 1, Tuesday = 2,
    and so on) for the first day of the input month

    1/1/1899 era domenica, quindi calcolando "NumDays MOD 7"
    si ha il giorno della settimana (domenica=0, lunedç=1, martedç=2
    e cosç via) per il primo giorno del mese inserito}

    StartDay := NumDays Mod 7
End;

Procedure PrintCalendar(Year, Month:word);
Var Header : String;
    I      : Byte;
Begin
   {Compute starting day (Su M Tu ...) and total days for the month
    Calcola il giorno iniziale (Dom Lun Mar ...) e i giorni totali del mese}

   ComputeMonth(Year, Month);
   ClrScr;

   {Write header - Scrivi l'intestazione}
   WriteLn('  ',Year,', ',Monthdata[month].Mname);
   WriteLn;
   WriteLn('Dom  Lun  Mar  Mer  Gio  Ven  Sab');
   WriteLn;

   {Recalculate and write tab to the first day of the month (Su M Tu ...)
    Ricalcola e scrivi la tabella al primo giorno del mese (Dom Lun Mar ...)}
   GotoXY(5*Startday+1,4);

   {Print out the days of the month - Stampa i giorni del mese}
   For I := 1 To TotalDays Do
   Begin
     If i<10 Then Write(' ',I,'   ');
     If i>9 Then Write(I,'   ');

    {Advance to the next line when the cursor is past column 32
    Avanza alla linea successiva quando il cursore ha passato la 32 colonna }
    IF WhereX > 32 THEN WriteLn;
  End;
  readln;
End;

Begin
  GetMonthData;
  ClrScr;
  year:=Getinput('Inserisci un anno (1899-2099): ',1899,2099);
  ClrScr;
  month:=Getinput('Inserisci un mese (1-12): ',1,12);
  PrintCalendar(year,month);
  readln;
End.
