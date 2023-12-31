unit SubFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls,
  TntButtons, TntStdCtrls, TntClasses, TntMenus, TntSysUtils, TntGraphics,
  TntForms, TntDialogs, TntExtCtrls, TntComCtrls, TntClipbrd;

type
  TSubForm = class(TTntForm)
  private
    TrCode: integer;
    SendData: WideString;
    CallHandle: THandle;
    MyTr: string;
    PathName : string;
    HSRecord : TTntStringList;
    XRow : integer;

    Bevel: TBevel;
    Edit: TTntEdit;
    Label1: TTntLabel;
    SpeedButton1: TTntSpeedButton;
    SpeedButton2: TTntSpeedButton;
    SpeedButton3: TTntSpeedButton;
    AdvStringGrid: TAdvStringGrid;
    Timer: TTimer;

    procedure MyTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure AdvStringGridGetAlignment(Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure AdvStringGridClick(Sender: TObject);
    procedure AdvStringGridDblClick(Sender: TObject);
    procedure AdvStringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure AdvStringGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure CreateComponents;
    procedure Init;
    procedure CMDialogChar(var msg: TCMDialogChar); message CM_DIALOGCHAR;
    procedure ViewGrid(rData: string; Cnt : integer);
    procedure WMCOPYDATA(var Msg : TMessage); message WM_COPYDATA;
    procedure DataPassing(recv: string);
    procedure ViewRecord;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CallTr : integer read TrCode write TrCode;
    property MHandle : THandle read CallHandle write CallHandle;
    property wSendData : WideString read SendData write SendData;
    property sTr : string read MyTr write MyTr;
  end;

implementation
uses PubUnit, PubHeader, PubTMS;

constructor TSubForm.Create(AOwner: TComponent);
begin
    CreateNew(AOwner);

    HSRecord := TTntStringList.Create;
    PathName := ExtractFilePath(Application.ExeName);

    ClientHeight := 362;
    ClientWidth := 438;

    CreateComponents;

    ClearFields(Self);
    InitAdvGrid(AdvStringGrid);

    Timer := TTimer.Create(Self);
    Timer.Interval := 100;
    Timer.OnTimer := MyTimer;
    Timer.Enabled := True;
end;

procedure TSubForm.MyTimer(Sender: TObject);
begin
    Timer.Enabled := False;
    Init;
end;

destructor TSubForm.Destroy;
begin
    FreeAndNil(HSRecord);
    if Assigned(Timer) then FreeAndNil(Timer);
    if Assigned(Bevel) then FreeAndNil(Bevel);
    if Assigned(Label1) then FreeAndNil(Label1);
    if Assigned(Edit) then FreeAndNil(Edit);
    if Assigned(SpeedButton1) then FreeAndNil(SpeedButton1);
    if Assigned(SpeedButton2) then FreeAndNil(SpeedButton2);
    if Assigned(SpeedButton3) then FreeAndNil(SpeedButton3);
    if Assigned(AdvStringGrid) then FreeAndNil(AdvStringGrid);
  inherited;
end;

procedure TSubForm.Init;
begin
    CrtForm(MyTr,Self);
    Edit.Text := SendData;
    ViewRecord;
    ShowModal;
end;

procedure TSubForm.CreateComponents;
begin
    BorderIcons := [biSystemMenu];
    BorderStyle := bsSingle;
    Position := poDefault;
    Color := 16113363;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -12;
    Font.Name := #44404#47548#52404;
    Font.Style := [];
    Scaled := False;

    Bevel := TBevel.Create(Self);
    Bevel.Height := 42;
    Bevel.Align := alTop;
    Bevel.Shape := bsFrame;
    Bevel.Style := bsRaised;
    Bevel.Parent := Self;

    Label1 := TTntLabel.Create(Self);
    Label1.Tag := 0;
    Label1.AutoSize := True;
    Label1.Left := 207;
    Label1.Top := 14;
    Label1.Width := 48;
    Label1.Height := 12;
    Label1.Caption := '';
    Label1.Name := '';
    Label1.Parent := Self;
    Label1.ParentColor := False;

    Edit := TTntEdit.Create(Self);
    Edit.Left := 17;
    Edit.Top := 11;
    Edit.Width := 152;
    Edit.Height := 20;
    Edit.Enabled := True;
    Edit.TabOrder := 0;
    Edit.Text := '';
    Edit.Name := 'Edit';
    Edit.Parent := Self;
    Edit.OnKeyPress := EditKeyPress;

    SpeedButton1 := TTntSpeedButton.Create(Self);
    SpeedButton1.Tag := 0;
    SpeedButton1.Left := 208;
    SpeedButton1.Top := 10;
    SpeedButton1.Width := 40;
    SpeedButton1.Height := 23;
    SpeedButton1.Cursor := crHandPoint;
    SpeedButton1.Parent := Self;
    SpeedButton1.Glyph.LoadFromFile(PathName + 'Image\tick.bmp');
    SpeedButton1.OnClick := SpeedButton1Click;

    SpeedButton2 := TTntSpeedButton.Create(Self);
    SpeedButton2.Tag := 0;
    SpeedButton2.Left := 253;
    SpeedButton2.Top := 10;
    SpeedButton2.Width := 40;
    SpeedButton2.Height := 23;
    SpeedButton2.Cursor := crHandPoint;
    SpeedButton2.Parent := Self;
    SpeedButton2.Glyph.LoadFromFile(PathName + 'Image\exit.bmp');
    SpeedButton2.OnClick := SpeedButton2Click;

    SpeedButton3 := TTntSpeedButton.Create(Self);
    SpeedButton3.Tag := 0;
    SpeedButton3.Left := 176;
    SpeedButton3.Top := 10;
    SpeedButton3.Width := 24;
    SpeedButton3.Height := 23;
    SpeedButton3.Cursor := crHandPoint;
    SpeedButton3.Parent := Self;
    SpeedButton3.Glyph.LoadFromFile(PathName + 'Image\confirm.bmp');
    SpeedButton3.OnClick := SpeedButton3Click;

    AdvStringGrid := TAdvStringGrid.Create(Self);
    AdvStringGrid.Tag := 1;
    AdvStringGrid.ColCount := 2;
    AdvStringGrid.Align := alClient;
    AdvStringGrid.RowCount := 2;
    AdvStringGrid.FixedCols := 0;
    AdvStringGrid.FixedRows := 1;
    AdvStringGrid.Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing];
    AdvStringGrid.ParentFont := True;
    AdvStringGrid.ColWidths[0] := 120;
    AdvStringGrid.ColWidths[1] := 290;
    AdvStringGrid.OnClick := AdvStringGridClick;
    AdvStringGrid.OnDblClick := AdvStringGridDblClick;
    AdvStringGrid.OnKeyDown := AdvStringGridKeyDown;
    AdvStringGrid.OnSelectCell := AdvStringGridSelectCell;
    AdvStringGrid.OnGetAlignment := AdvStringGridGetAlignment;
    AdvStringGrid.Parent := Self;
end;

procedure TSubForm.SpeedButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TSubForm.SpeedButton3Click(Sender: TObject);
begin
    ViewRecord;
end;

procedure TSubForm.SpeedButton1Click(Sender: TObject);
var
    DataBuf : TCopyDataStruct;
    sData : WideString;
    NewBalsa : String;
begin
    if Length(Trim(Edit.Text)) = 0 then exit;

    sData := MyTr + ';';                     // TR번호
    sData := sData + Trim(Edit.Text) + ';';

    NewBalsa := UTF8Encode(sData);

    if Length(NewBalsa) = 0 then exit;
    with DataBuf do begin
        DwData := 2003;
        cbData := Length(NewBalsa);
        lpData := @NewBalsa[1];
    end;
    SendMessage(CallHandle,WM_COPYDATA,Handle,longint(@DataBuf));
end;

procedure TSubForm.AdvStringGridClick(Sender: TObject);
begin
    if XRow <= 0 then exit;
    Edit.Text := Trim(AdvStringGrid.WideCells[0,XRow]);
    Label1.Caption := Trim(AdvStringGrid.WideCells[1,XRow]);
end;

procedure TSubForm.AdvStringGridDblClick(Sender: TObject);
begin
    SpeedButton1Click(nil);
end;

procedure TSubForm.AdvStringGridGetAlignment(Sender: TObject; ARow, ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
    if ACol in [0] then HAlign := taCenter;
    if ARow in [0] then HAlign := taCenter;
end;

procedure TSubForm.AdvStringGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    GridClipboard((Sender as TAdvStringGrid),Key,Shift);
end;

procedure TSubForm.AdvStringGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
    XRow := ARow;
end;

procedure TSubForm.CMDialogChar(var msg: TCMDialogChar);
begin

end;

procedure TSubForm.ViewRecord;
begin
    TransFormat(TrCode,$90,Self.Handle,'',$05,Trim(Edit.Text) + ';');
end;

procedure TSubForm.ViewGrid(rData : string; Cnt : integer);
var
    i,j : integer;
begin
    AdvStringGrid.RowCount := Cnt + 1;

    j := 0;
    HSRecord.Clear;
    HSDelimited(HSRecord,rData);

    for i := 0 to AdvStringGrid.RowCount-2 do begin
        AdvStringGrid.WideCells[0,i+1] := HSRecord.Strings[j];
        AdvStringGrid.WideCells[1,i+1] := HSRecord.Strings[j+1];
        Inc(j,2);
    end;
    rData := '';
end;

procedure TSubForm.WMCOPYDATA(var Msg : TMessage);
var
    RData : string;
begin
    SetLength(RData,Pcopydatastruct(msg.lparam)^.cbData);
    Move(PCopyDataStruct(Msg.lparam)^.lpData^,RData[1],Length(RData));
    case Pcopydatastruct(msg.lparam)^.dwData of
        1500 : DataPassing(RData);
    end;
end;

procedure TSubForm.DataPassing(recv : string);
var
    QueryData : TQueryData; // 공통헤더
begin
    FillChar(QueryData,SizeOf(QueryData),#0);
    Move(recv[1],QueryData,SizeOf(QueryData));
    Delete(recv,1,SizeOf(QueryData));
    if QueryData.ErrGu = '0' then begin // 정상일 경우만 처리
        case QueryData.PacketID of
            Chr($90) : ViewGrid(recv,QueryData.RCnt); // Select
        end;
    end else begin
        DBMsgDlg(IntToStr(QueryData.TrCd) + ':' + Trim(QueryData.Msg));
    end;
end;

procedure TSubForm.EditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then begin
        ViewRecord;
    end;
end;

end.
