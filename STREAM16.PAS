program Stream16;
{This program comes with no guarrantees and no support.
Its just a little demo.
Questo programma Š senza garanzie o supporto. E' solo una piccola demo.
}

uses Objects, Drivers, Views, Menus, Dialogs, App;

const
  cmFileOpen        = 100;
  cmNewDialog       = 102;

type
  St128 = String[128];
  DialogData = record
    Input1: st128;
    Input2: st128;
    Input3: st128;
  end;

  TMyApp = object(TApplication)
    procedure HandleEvent(var Event: TEvent); virtual;
    procedure InitMenuBar; virtual;
    procedure InitStatusLine; virtual;
    procedure NewDialog;
  end;

  PDemoDialog = ^TDemoDialog;
  TDemoDialog = object(TDialog)
  end;

var
  DemoDialogData: DialogData;
  SColl: PStringCollection;
  MyStream: PBufStream;

{ TMyApp }
procedure TMyApp.HandleEvent(var Event: TEvent);
begin
  TApplication.HandleEvent(Event);
  if Event.What = evCommand then
  begin
    case Event.Command of
      cmNewDialog: NewDialog;
    else
      Exit;
    end;
    ClearEvent(Event);
  end;
end;

procedure TMyApp.InitMenuBar;
var R: TRect;
begin
  GetExtent(R);
  R.B.Y := R.A.Y + 1;
  MenuBar := New(PMenuBar, Init(R, NewMenu(
    NewSubMenu('~F~ile', hcNoContext, NewMenu(
      NewItem('~O~pen', 'F3', kbF3, cmFileOpen, hcNoContext,
      NewItem('~N~ew', 'F4', kbF4, cmNewDialog, hcNoContext,
      NewLine(
      NewItem('E~x~it', 'Alt-X', kbAltX, cmQuit, hcNoContext,
      nil))))),
    NewSubMenu('~W~indow', hcNoContext, NewMenu(
      NewItem('~N~ext', 'F6', kbF6, cmNext, hcNoContext,
      NewItem('~Z~oom', 'F5', kbF5, cmZoom, hcNoContext,
      NewItem('~D~ialog', 'F2', kbF2, cmNewDialog, hcNoContext,
      nil)))),
    nil))
  )));
end;

procedure TMyApp.InitStatusLine;
var R: TRect;
begin
  GetExtent(R);
  R.A.Y := R.B.Y - 1;
  StatusLine := New(PStatusLine, Init(R,
    NewStatusDef(0, $FFFF,
      NewStatusKey('', kbF10, cmMenu,
      NewStatusKey('~Alt-X~ Exit', kbAltX, cmQuit,
      NewStatusKey('~F4~ New', kbF4, cmNewDialog,
      NewStatusKey('~Alt-F3~ Close', kbAltF3, cmClose,
      nil)))),
    nil)
  ));
end;

procedure TMyApp.NewDialog;
var
  Bruce: PView;
  Dialog: PDemoDialog;
  R: TRect;
  C: Word;
  S: String; 
begin
  R.Assign(20, 6, 60, 19);
  Dialog := New(PDemoDialog, Init(R, 'Demo Dialog'));
  with Dialog^ do
  begin
    R.Assign(3, 4, 37, 5);
    Bruce := New(PInputLine, Init(R, 128));
    Insert(Bruce);
    R.Assign(2, 3, 24, 4);
    Insert(New(PLabel, Init(R, 'Delivery instructions', Bruce)));

    R.Assign(3, 6, 37, 7);
    Bruce := New(PInputLine, Init(R, 128));
    Insert(Bruce);
    R.Assign(2, 5, 24, 6);
    Insert(New(PLabel, Init(R, 'Delivery instructions', Bruce)));

    R.Assign(3, 8, 37, 9);
    Bruce := New(PInputLine, Init(R, 128));
    Insert(Bruce);
    R.Assign(2, 7, 24, 8);
    Insert(New(PLabel, Init(R, 'Delivery instructions', Bruce)));
    R.Assign(15, 10, 25, 12);
    Insert(New(PButton, Init(R, '~O~k', cmOK, bfDefault)));
    R.Assign(28, 10, 38, 12);
    Insert(New(PButton, Init(R, 'Cancel', cmCancel, bfNormal)));
  end;

  MyStream := New(PBufStream, Init('Stream16.Dta', StOpen, 1024));
  SColl := PStringCollection(MyStream^.Get);
  Dispose(MyStream, Done);

  DemoDialogData.Input1 := PString(SColl^.At(0))^;
  DemoDialogData.Input2 := PString(SColl^.At(1))^;
  DemoDialogData.Input3 := PString(SColl^.At(2))^;

  Dialog^.SetData(DemoDialogData);
  C := DeskTop^.ExecView(Dialog);
  if C <> cmCancel then Dialog^.GetData(DemoDialogData);
  Dispose(Dialog, Done);
end;


var
  MyApp: TMyApp;

begin
  RegisterObjects;

  SColl := New(PStringCollection, Init(100,10));
  SColl^.Insert(NewStr('ET, wake up!'));
  SColl^.Insert(NewStr('Its time to'));
  SColl^.Insert(NewStr('phone home!'));
  MyStream := New(PBufStream, Init('Stream16.dta', stCreate, 1024));
  MyStream^.Put(SColl);
  Dispose(MyStream, Done);

  MyApp.Init;
  MyApp.Run;
  MyApp.Done;
end.
