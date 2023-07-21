unit PubTMS;

interface

uses
  Messages, Windows, ComObj, Sysutils, stdctrls, Forms, Classes, Variants, Graphics,
  Grids, BaseGrid, AdvGrid, Clipbrd, ExtCtrls, Buttons, Menus, ComCtrls, IniFiles,
  Dialogs, TntStdCtrls, AdvObj, TntClasses, TntExtCtrls, TntButtons, TntComCtrls,
  TntDialogs, TntForms, TntClipbrd, TntMenus, MultiMon, Controls, Math, OleCtrls,
  AdvUtil, OExport, OExport_Vcl, OExport_VclForms, TeEngine, TeeProcs, Chart,DateUtils;

const
  GridRColor = $00FEF2E8;

  procedure InitAdvGrid(sGrid : TAdvStringGrid; SortChk : boolean = False; StartRow : integer = 1);
  procedure ClearAdvGrid(sGrid : TAdvStringGrid); overload;
  procedure ClearAdvGrid(sGrid : TAdvStringGrid; XRow : integer); overload;
  procedure ClearAdvGrid(sGrid : TAdvStringGrid; sColor : TColor ; XRow : integer); overload;
  procedure FixedGrdColor(sGrid : TAdvStringGrid; sColor : TColor; Gbn : word);
  procedure XClearAdvGrid(sGrid : TAdvStringGrid; XRow : integer);
  procedure AdvGrid2Excel(sGrid : TAdvStringGrid);
  procedure AdvGrid2Excel2(sGrid : TAdvStringGrid);
  procedure CrtForm(Tr : string; xFrm : TForm);
  procedure SetField(sData : string; xFrm : TForm; HintChk : string);
  procedure xBrowser(sGrid : TAdvStringGrid; XRow : integer);
  function  AdvColMin(aGrid:TAdvStringGrid; ACol,FromRow,ToRow : integer) : double;
  function  AdvColMax(aGrid:TAdvStringGrid; ACol,FromRow,ToRow : integer) : double;
  function  GetWorktime(sGrid: TAdvStringGrid; FromDataTime, ToDateTime : TDateTime; WorkGbn,Shift: Widestring) : integer;
  procedure ColorAdvGridCol(sGrid : TAdvStringGrid; iCol : Integer; iRow : Integer);
  procedure CopySelectedGridToClipboard(theGrid: TAdvStringGrid);   
  procedure YRViewGrid(Grid : TAdvStringGrid; rData : string; Rnt,FCnt : integer); overload;   
  procedure YRViewGrid(Grid : TAdvStringGrid; rData : string; Rnt,FCnt : integer; ColTxt : string); overload;
  procedure YRMergeColumnCells2(MyGrid : TAdvStringGrid; ColIndex: array of integer; MainMerge: Boolean); overload; //지정 컬럼들이 같을때 해당 컬럼들 머지         HSMergeColumnCells2(AdvStringGrid1,MeageCols,True);
  procedure YRMergeColumnCells2(MyGrid : TAdvStringGrid; ColIndex: array of integer; MainMerge: Boolean; var MergeIdx : string); overload; //지정 컬럼들이 같을때 해당 컬럼들 머지
  procedure GridCellsColor(MyGrid : TAdvStringGrid; StartRow : integer; MergeIdx : string);
  procedure GridRowColor(Ar,Ac : Integer; Ab : TBrush; StartRow : integer = 0); overload;
  procedure Excel2AdvGrid(sGrid : TAdvStringGrid; xSheet : integer = 0);    // Excel →AdvStringGrid
  
//  procedure CopySelectedGridToClipboard(theGrid: TAdvStringGrid);
//  procedure CopyStreamToClipboard(S: TStream; fmt: Word);

implementation
uses PubUnit;

procedure InitAdvGrid(sGrid : TAdvStringGrid; SortChk : boolean = False; StartRow : integer = 1);
var
    i,j : integer;
begin
    ClearAdvGrid(sGrid,StartRow);
    sGrid.ControlLook.ControlStyle := csWinXP;
    sGrid.WordWrap := False;
    if SortChk then begin
        sGrid.VAlignment := vtaTop;
    end else begin
        sGrid.VAlignment := vtaCenter;
    end;
    sGrid.Flat := True;
    sGrid.SelectionColor := $00FF9900;
    sGrid.Navigation.AllowClipboardShortCuts := True; // Ctrl + C로 복사 가능하게..(WideCells로 입력하면 유니코드 가능한데 클립보드에서는 깨짐)
    sGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing];
    for i := 0 to sGrid.ColCount-1 do begin
        for j := 1 to sGrid.FixedRows do begin
//            sGrid.Colors[i,j-1] := $00A4CFEF;
            sGrid.Colors[i,j-1] := $00A4CFEF
        end;
    end;
    sGrid.SortSettings.Show := SortChk;
//    if SortChk then begin
//        sGrid.QSort
//    end;
end;

procedure FixedGrdColor(sGrid : TAdvStringGrid; sColor : TColor; Gbn : word);
var
    i,j : integer;
begin
    if Gbn = 1 then begin // Row
        for i := 0 to sGrid.ColCount-1 do begin
            for j := 1 to sGrid.FixedRows do begin
                sGrid.Colors[i,j-1] := sColor;
            end;
        end;
    end else if Gbn = 2 then begin
        for i := 1 to sGrid.RowCount-1 do begin
            for j := 1 to sGrid.FixedCols do begin
                sGrid.Colors[j-1,i] := sColor;
            end;
        end;
    end;
end;

procedure CrtForm(Tr : string; xFrm : TForm);
var
    FrmList : TStringList;
    i : integer;
    DirhName : string;
    WinIni : TIniFile;
    LocalPathName : string;
    LanguageChk : integer;
    MyHint : string;
begin
    LocalPathName := ExtractFilePath(Application.ExeName);

    WinIni := TIniFile.Create(LocalPathName + hsMyIniFile);
    LanguageChk := WinIni.ReadInteger('SETTING','LANGUAGE',0);
    MyHint := UpperCase(WinIni.ReadString('SETTING','HINT','')); 
    FreeAndNil(WinIni);
    if LanguageChk = 0 then begin
        DirhName := LocalPathName + 'scr\Tr';
    end else if LanguageChk = 1 then begin
        DirhName := LocalPathName + 'chscr\Tr';
    end;
    FrmList := TStringList.Create;
  try
    FrmList.Clear;
    if not FileExists(DirhName + Tr + '.scr') then begin
        exit;
    end;
    FrmList.LoadFromFile(DirhName + Tr + '.scr');     
    for i := 0 to FrmList.Count -1 do begin
        SetField(FrmList.Strings[i],xFrm, MyHint);
    end;
  finally
    FreeAndNil(FrmList);
  end;
end;

procedure SetField(sData : string; xFrm : TForm; HintChk : string); 
var  
    i : integer;  
    idx : integer;  
    TmpCap : string;  
    xRow, xCol : integer;
begin  
    idx := StrToInt(Copy(sData,1,3));
    if idx = 100 then begin
        Delete(sData,1,3);
        xFrm.Caption := Copy(sData,1,Pos(';',sData)-1);  
        Delete(sData,1,Pos(';',sData));  
        xFrm.Font.Charset := TFontCharSet(StrToInt(Copy(sData,1,Pos(';',sData)-1)));  
        Delete(sData,1,Pos(';',sData));  
        xFrm.Font.Name := Copy(sData,1,Pos(';',sData)-1);  
        Delete(sData,1,Pos(';',sData));  
        xFrm.Font.Size := StrToInt(sData);  
        exit;  
    end;  
    TmpCap := Trim(Copy(sData,4,100));  
    for i := 0 to xFrm.ComponentCount-1 do begin  
        if xFrm.Components[i].Tag = idx then begin  
            if xFrm.Components[i] is TPanel then begin  
                (xFrm.Components[i] as TPanel).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TPanel).ShowHint := True;  
                    (xFrm.Components[i] as TPanel).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TLabel then begin  
                (xFrm.Components[i] as TLabel).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin 
                    (xFrm.Components[i] as TLabel).ShowHint := True;  
                    (xFrm.Components[i] as TLabel).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TButton then begin  
                (xFrm.Components[i] as TButton).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TButton).ShowHint := True;  
                    (xFrm.Components[i] as TButton).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TSpeedButton then begin  
                (xFrm.Components[i] as TSpeedButton).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TSpeedButton).ShowHint := True;  
                    (xFrm.Components[i] as TSpeedButton).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TGroupBox then begin  
                (xFrm.Components[i] as TGroupBox).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TGroupBox).ShowHint := True;  
                    (xFrm.Components[i] as TGroupBox).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TCheckBox then begin  
                (xFrm.Components[i] as TCheckBox).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TCheckBox).ShowHint := True;  
                    (xFrm.Components[i] as TCheckBox).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TRadioButton then begin  
                (xFrm.Components[i] as TRadioButton).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TRadioButton).ShowHint := True;  
                    (xFrm.Components[i] as TRadioButton).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TMenuItem then begin  
                (xFrm.Components[i] as TMenuItem).Caption := TmpCap;  
            end else if xFrm.Components[i] is TTabSheet then begin  
                (xFrm.Components[i] as TTabSheet).Caption := TmpCap;  
                if HintChk = 'TRUE' then begin  
                    (xFrm.Components[i] as TTabSheet).ShowHint := True;  
                    (xFrm.Components[i] as TTabSheet).Hint := TmpCap;  
                end;  
            end else if xFrm.Components[i] is TComboBox then begin  
                (xFrm.Components[i] as TComboBox).Items.Add(TmpCap);  
            end else if xFrm.Components[i] is TAdvStringGrid then begin  
                xRow := StrToInt(Copy(TmpCap,1,Pos(';',TmpCap)-1));  
                Delete(TmpCap,1,Pos(';',TmpCap));  
                xCol := StrToInt(Copy(TmpCap,1,Pos(';',TmpCap)-1));  
                Delete(TmpCap,1,Pos(';',TmpCap));  
                if Pos(';',TmpCap) > 0 then begin  
                    (xFrm.Components[i] as TAdvStringGrid).Cells[xCol,xRow] := Copy(TmpCap,1,Pos(';',TmpCap)-1);  
                    Delete(TmpCap,1,Pos(';',TmpCap));  
                    (xFrm.Components[i] as TAdvStringGrid).Font.Charset := TFontCharSet(StrToInt(Copy(TmpCap,1,Pos(';',TmpCap)-1)));  
                    (xFrm.Components[i] as TAdvStringGrid).FixedFont.Charset := TFontCharSet(StrToInt(Copy(TmpCap,1,Pos(';',TmpCap)-1)));  
                    Delete(TmpCap,1,Pos(';',TmpCap));  
                    (xFrm.Components[i] as TAdvStringGrid).Font.Name := Copy(TmpCap,1,Pos(';',TmpCap)-1);  
                    (xFrm.Components[i] as TAdvStringGrid).FixedFont.Name := Copy(TmpCap,1,Pos(';',TmpCap)-1);  
                    Delete(TmpCap,1,Pos(';',TmpCap));  
                    (xFrm.Components[i] as TAdvStringGrid).Font.Size := StrToInt(TmpCap);  
                    (xFrm.Components[i] as TAdvStringGrid).FixedFont.Size := StrToInt(TmpCap);  
                end else begin  
                    (xFrm.Components[i] as TAdvStringGrid).Cells[xCol,xRow] := TmpCap;  
                end;  
            end;  
            break;  
        end;  
    end;  
end; 

procedure ClearAdvGrid(sGrid : TAdvStringGrid);
var
    i,j : integer;
begin
    for i := 0 to sGrid.ColCount -1 do begin
        for j := 1 to sGrid.RowCount -1 do begin
            sGrid.Cells[i,j] := '';
        end;
    end;
    sGrid.RowCount := 2;
end;

procedure ClearAdvGrid(sGrid : TAdvStringGrid; XRow : integer);
var
    i,j : integer;
begin
    for i := 0 to sGrid.ColCount -1 do begin
        for j := XRow to sGrid.RowCount -1 do begin
            sGrid.Cells[i,j] := '';
            //sGrid.Rows[j].Clear;
        end;
    end;
    sGrid.RowCount := XRow+1;
end;

procedure ClearAdvGrid(sGrid : TAdvStringGrid; sColor : TColor ; XRow : integer);
var
    i,j : integer;
begin
    for i := 0 to sGrid.ColCount -1 do begin
        for j := XRow to sGrid.RowCount -1 do begin
            sGrid.Cells[i,j] := '';
            sGrid.Colors[i,j] := sColor;
        end;
    end;
    sGrid.RowCount := XRow + 1;
end;

procedure XClearAdvGrid(sGrid : TAdvStringGrid; XRow : integer);
var
    i,j : integer;
begin
    for i := 0 to sGrid.ColCount -1 do begin
        for j := XRow to sGrid.RowCount -1 do begin
            sGrid.Cells[i,j] := '';
        end;
    end;
end;

procedure AdvGrid2Excel(sGrid : TAdvStringGrid);
var
    xCol, yRow : integer;
    i, j : integer;
    RCnt, CCnt : integer;
    oXL, oWB, oSheet, VArray : Variant;
begin
    oXL := CreateOleObject('Excel.Application');
    oXL.Visible := True;

    oWB := oXL.Workbooks.Add;
    oSheet := oWB.ActiveSheet;

    xCol := sGrid.ColCount -1;
    yRow := sGrid.RowCount -1;

    VArray := VarArrayCreate([0,yRow,0,xCol],varVariant);
    for i := 1 to xCol + 1 do begin
        for j := 1 to yRow + 1 do begin
            VArray[j-1,i-1] := sGrid.Cells[i-1,j-1];
        end;
    end;

    RCnt := sGrid.RowCount;
    CCnt := sGrid.ColCount;

//    oSheet.Range['A1',CHR(64 + CCnt) + IntToStr(RCnt)] := VArray;
    oSheet.Range[oSheet.Cells[1,1],oSheet.Cells[RCnt, CCnt]].Value := VArray; // 2004.02.06

    oXL.Visible := True;
    oXL.UserControl := True;
end;

procedure AdvGrid2Excel2(sGrid : TAdvStringGrid); // 셀에 숫자만 와도 숫자필드가 아니라 문자필드로 인식하게
var
    xCol, yRow : integer;
    i, j : integer;
    RCnt, CCnt : integer;
    oXL, oWB, oSheet, VArray : Variant;
begin
    oXL := CreateOleObject('Excel.Application');
    oXL.Visible := True;

    oWB := oXL.Workbooks.Add;
    oSheet := oWB.ActiveSheet;

    xCol := sGrid.ColCount -1;
    yRow := sGrid.RowCount -1;

    VArray := VarArrayCreate([0,yRow,0,xCol],varVariant);
    for i := 1 to xCol + 1 do begin
        for j := 1 to yRow + 1 do begin
            VArray[j-1,i-1] := sGrid.Cells[i-1,j-1];
        end;
    end;

    RCnt := sGrid.RowCount;
    CCnt := sGrid.ColCount;

//    oSheet.Range['A1',CHR(64 + CCnt) + IntToStr(RCnt)] := VArray;
    oSheet.Range[oSheet.Cells[1,1],oSheet.Cells[RCnt, CCnt]].NumberFormatLocal := '@';
    oSheet.Range[oSheet.Cells[1,1],oSheet.Cells[RCnt, CCnt]].Value := VArray; // 2004.02.06

    oXL.Visible := True;
    oXL.UserControl := True;
end;

function AdvColMax(aGrid:TAdvStringGrid; ACol,FromRow,ToRow : integer) : double;
var
    m : Double;
    i : Integer;
begin
    m := StrToFloat(aGrid.Cells[ACol,FromRow]);
    for i := FromRow to ToRow do begin
        if m < StrToFloat(aGrid.Cells[aCol,i]) then begin
            m := StrToFloat(aGrid.Cells[aCol,i]);
        end;
    end;
    Result := m;
end;

function AdvColMin(aGrid:TAdvStringGrid; ACol,FromRow,ToRow : integer) : double;
var
    m : Double;
    i : Integer;
begin
    m := StrToFloat(aGrid.Cells[ACol,FromRow]);
    for i := FromRow to ToRow do begin
        if m > StrToFloat(aGrid.Cells[ACol,i]) then begin
            m := StrToFloat(aGrid.Cells[ACol,i]);
        end;
    end;
    Result := m;
end;
{
procedure CopyStreamToClipboard(S: TStream; fmt: Word);
var
    hMem : THandle;
    pMem : Pointer;
begin
    S.Position := 0;

    hMem := GlobalAlloc(GHND or GMEM_DDESHARE, S.Size);
    if hMem <> 0 then begin
        pMem := GlobalLock(hMem);
        if pMem <> nil then begin
            S.Read(pMem^, S.Size);
            S.Position := 0;
            GlobalUnlock(hMem);
            Clipboard.Open;
          try
            Clipboard.SetAsHandle(fmt, hMem);
          finally
            Clipboard.Close;
          end;
        end else begin
            GlobalFree(hMem);
            OutOfMemoryError;
        end;
    end else begin
        OutOfMemoryError;
    end;
end;

procedure CopySelectedGridToClipboard(theGrid: TAdvStringGrid);
var
    m : TMemoryStream;
    i, j : Integer;
    S : string;
begin
    m := TMemoryStream.Create;
  try
    with theGrid do
        for i := theGrid.Selection.Top to theGrid.Selection.Bottom do
            for j := theGrid.Selection.Left to theGrid.Selection.Right do begin
                S := Cells[j, i];
                if j = theGrid.Selection.Right then
                    AppendStr(S, #13#10)
                else
                    AppendStr(S, #9);
                m.WriteBuffer(S[1], Length(S));
            end;
    S[1] := #0;
    m.WriteBuffer(S[1], 1);
    CopyStreamToClipboard(m, CF_TEXT);
  finally
    m.Free;
  end;
end;
}



procedure ColorAdvGridCol(sGrid : TAdvStringGrid; iCol : Integer; iRow : Integer);
begin
    sGrid.Colors[iCol,iRow] := $00E6CA93;
end;

procedure xBrowser(sGrid : TAdvStringGrid; XRow : integer);
var
    i : integer;
    Msg : string;
begin
    if Length(Trim(sGrid.Cells[0,XRow])) = 0 then exit;
    for i := 0 to sGrid.ColCount -1 do begin
        Msg := Msg + sGrid.Cells[i,0] + ' : ' + sGrid.Cells[i,XRow] + #13
    end;
    MessageDlg(Msg, mtInformation,[mbOk], 0);
end;

Function GetWorktime(sGrid: TAdvStringGrid; FromDataTime, ToDateTime : TDateTime; WorkGbn,Shift: Widestring) : integer;
var
    i, k            :  Integer;
    FromTime        :  TDateTime;    // FROM 날짜의 시분초
    FromDDay        :  Integer;      // FROM D DAY
    FromNum         :  Integer;      // FROM 에 대한 마스터 NUM 값
    FromStdTime     :  TDateTime;    // FROM 에 대한 NUM의 시작시간
    FromStdGbn      :  Widestring;   // FROM 에 대한 NUM의 작업구분
    FromStdShift    :  Widestring;   // FROM 에 대한 NUM의 SHIFT
    FromDiffMinute  :  Integer;      // FROM TIME의 차이 분

    ToTime          :  TDateTime;    // TO 날짜의 시분초
    ToDDay          :  Integer;      // TO D DAY (EDT - FDT 시간 / 24) DIV 24 로 계산 (일로 DIFF 날리면 계산이 안맞음)
    ToNum           :  Integer;      // TO 에 대한 마스터 NUM 값
    ToStdTime       :  TDateTime;    // TO 에 대한 NUM의 종료시간
    ToStdGbn        :  Widestring;   // TO 에 대한 NUM의 작업구분
    ToStdShift      :  Widestring;   // TO 에 대한 NUM의 SHIFT
    ToDiffMinute    :  Integer;      // TO TIME의 차이 분

    Sum_Minute      :  Integer;      // 기간내 작업 전체 시간(분)
    CompareToTime   :  widestring;   // 00:00:00은 24:00:00로 변경하기 위함
begin

    FromNum := 0;
    ToNum := 0;
    FromStdTime := Now;
    ToStdTime := Now;

    // 날짜 분리
    FromTime := TimeOf(FromDataTime);
    ToTime := TimeOf(ToDateTime);

    // FromNum, FromStdTime 값 가져오기
    For i := 1 to sGrid.RowCount - 1 do begin
        CompareToTime := Trim(sGrid.WideCells[5,i]);
        if CompareToTime = '00:00:00' then CompareToTime := '24:00:00';

        if (Trim(sGrid.WideCells[3,i]) <= FormatDateTime('HH:mm:ss',FromTime)) and
           (CompareToTime >  FormatDateTime('HH:mm:ss',FromTime)) then begin
            FromNum := StrToIntDef(Trim(sGrid.WideCells[0,i]),0);
            FromStdTime := StrToDateTime(Trim(sGrid.WideCells[3,i]));
            FromStdGbn := Trim(sGrid.WideCells[1,i]);
            FromStdShift := Trim(sGrid.WideCells[9,i]);
            Break;
        end;
    end;

    // ToNum, ToStdTime 값 가져오기
    For i := 1 to sGrid.RowCount - 1 do begin
        CompareToTime := Trim(sGrid.WideCells[5,i]);
        if CompareToTime = '00:00:00' then CompareToTime := '24:00:00';
        if (Trim(sGrid.WideCells[3,i]) <= FormatDateTime('HH:mm:ss',ToTime)) and
           (CompareToTime >  FormatDateTime('HH:mm:ss',ToTime)) then begin

            ToNum := StrToIntDef(Trim(sGrid.WideCells[0,i]),0);
            ToStdTime := StrToDateTime(Trim(sGrid.WideCells[5,i]));
            ToStdGbn := Trim(sGrid.WideCells[1,i]);
            ToStdShift := Trim(sGrid.WideCells[9,i]);

            Break;
        end;
    end;

    // FromDDay 세팅 (무조건 0)
    FromDDay := 0;

    // ToDDay 세팅
    ToDDay := Trunc(MinutesBetween(FromDataTime, ToDateTime)/60/24);

    // 작업시간 추출
    i := 0;  // 제일 첫 dday
    Sum_Minute := 0;

    While i < ToDDay + 1 do begin
        if FromDDay = ToDDay then begin
            if Shift = 'T' then begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) >= FromNum) and
                       (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) <= ToNum)   and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end else begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) >= FromNum) and
                       (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) <= ToNum)   and
                       (Trim(sGrid.WideCells[9,k]) = Shift) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end;

        end else if FromDDay = i then begin
            if Shift = 'T' then begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) >= FromNum) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end else begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) >= FromNum) and
                       (Trim(sGrid.WideCells[9,k]) = Shift) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end;

        end else if ToDDay = i then begin
            if Shift = 'T' then begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) <= ToNum) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end else begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (StrToIntDef(Trim(sGrid.WideCells[0,k]),1) <= ToNum) and
                       (Trim(sGrid.WideCells[9,k]) = Shift) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end;
        
        end else begin       
            if Shift = 'T' then begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end else begin
                for k := 1 to sGrid.RowCount - 1 do begin
                    if (Trim(sGrid.WideCells[9,k]) = Shift) and
                       (Trim(sGrid.WideCells[1,k]) = WorkGbn) then begin
                        Sum_Minute := Sum_Minute + StrToIntDef(Trim(sGrid.WideCells[6,k]),0);
                    end;
                end;
            end;

        end;

        i := i + 1;
    end;

    // 해당 작업시간 내 포함된 시간 차이 : MinuteBetween 하면 계산이 이상해짐
    FromDiffMinute := Round(SecondsBetween(FromStdTime, FromTime) / 60);

    if FormatDateTime('HH:mm:ss',ToStdTime) = '00:00:00' then begin  //00:00:00은 시간이 더 이전으로 인식하기 ??문
        ToStdTime := StrToTime('23:59:59');
    end;
    ToDiffMinute := Round(SecondsBetween(ToTime, ToStdTime) / 60);

    if Shift = 'T' then begin  
        if (Sum_Minute > 0) and (FromStdGbn = WorkGbn) then begin
            Sum_Minute := Sum_Minute - FromDiffMinute;
        end;

        if (Sum_Minute > 0) and (ToStdGbn = WorkGbn) then begin
            Sum_Minute := Sum_Minute - ToDiffMinute;
        end;
    end else begin     
        if (Sum_Minute > 0) and (FromStdGbn = WorkGbn) and (FromStdShift = Shift) then begin
            Sum_Minute := Sum_Minute - FromDiffMinute;
        end;

        if (Sum_Minute > 0) and (ToStdGbn = WorkGbn) and (ToStdShift = Shift) then begin
            Sum_Minute := Sum_Minute - ToDiffMinute;
        end;
    end;
    
    Result := Sum_Minute;
end;
     
procedure CopySelectedGridToClipboard(theGrid: TAdvStringGrid);
var
    i, j: integer;
    S : WideString;
    Txt : WideString;
begin
    for i := theGrid.Selection.Top to theGrid.Selection.Bottom do begin
        for j := theGrid.Selection.Left to theGrid.Selection.Right do begin
            S := theGrid.WideCells[j, i];
            if j = theGrid.Selection.Right then begin
                Txt := Txt + S + #13#10;
            end else begin
                Txt := Txt + S + #9;
            end;
        end;
    end;
    Clipboard.Open;
    Clipboard.AsText := Txt;
    Clipboard.Close;
end;

procedure YRViewGrid(Grid : TAdvStringGrid; rData : string; Rnt,FCnt : integer);
var
    i,j,k,l : integer;
    MyRecord : TTntStringList;
begin
    MyRecord := TTntStringList.Create;
  try
    MyRecord.Clear;
    Grid.Invalidate;
    Grid.RowCount := Rnt + 1;
    j := 0;

    HSDelimited(MyRecord,rData);
    for i := 1 to Grid.RowCount-1 do begin
        l := 0;
        for k := 0 to Grid.ColCount -1 do begin
            Grid.WideCells[k,i] := MyRecord.Strings[j+l];
            Inc(l);
        end;
        Inc(j,FCnt);
    end;
  finally
    FreeAndNil(MyRecord);
  end;
end;
    
procedure YRViewGrid(Grid : TAdvStringGrid; rData : string; Rnt,FCnt : integer; ColTxt : string);
var
    i,j,k,l,m : integer;
    MyRecord : TTntStringList;
    ColTxtList : TStringList;
    nChk : boolean;
begin
    MyRecord := TTntStringList.Create;
    ColTxtList := TStringList.Create;
  try
    ColTxtList.Clear;
    ColTxtList.CommaText := ColTxt;
    MyRecord.Clear;
    Grid.Invalidate;
    Grid.RowCount := Rnt + 1;
    j := 0;

    HSDelimited(MyRecord,rData);
    for i := 1 to Grid.RowCount-1 do begin
        l := 0;
        for k := 0 to Grid.ColCount -1 do begin
            nChk := False;
            for m := 0 to ColTxtList.Count -1 do begin
                if StrToInt(ColTxtList.Strings[m]) = k then begin
                    nChk := True;
                end;
            end;
            if nChk then begin
                if IsIntCheck(MyRecord.Strings[j+l]) then begin
                    Grid.WideCells[k,i] := Str2Int(MyRecord.Strings[j+l]);
                end else begin
                    Grid.WideCells[k,i] := Str2Float2(MyRecord.Strings[j+l],5);
                end;
            end else begin
                Grid.WideCells[k,i] := MyRecord.Strings[j+l];
            end;
            Inc(l);
        end;
        Inc(j,FCnt);
    end;
  finally
    FreeAndNil(ColTxtList);
    FreeAndNil(MyRecord);
  end;
end;

procedure YRMergeColumnCells2(MyGrid : TAdvStringGrid; ColIndex: array of integer; MainMerge: Boolean);
  function GridCheck(MyCol : array of integer; l : integer) : boolean;
  var
      i : integer;
  begin
      Result := True;
      for i := Low(MyCol) to High(MyCol) do begin
          if (MyGrid.Cells[MyCol[i],l] <> MyGrid.Cells[MyCol[i],l - 1]) then begin
              Result := False;
              break;
          end;
      end;
  end;

var
    i,j,k,l: Integer;
begin
    //머지했을때...떠있는 상태에서 Call되면...맨밑에 선이 없는지는거 때문에 추가
    for i := Low(ColIndex) to High(ColIndex) do begin
        for j := 0 to MyGrid.RowCount -1 do begin
            MyGrid.SplitCells(ColIndex[i],j);
        end;
    end;

    j := 1;
    k := MyGrid.FixedRows;

    for i := MyGrid.FixedRows + 1 to MyGrid.RowCount - 1 - MyGrid.FixedFooters do begin
        if (GridCheck(ColIndex,i) = True) and (MainMerge or MyGrid.RowSpanIdentical(i,i - 1)) then begin
            inc(j)
        end else begin
            for l := Low(ColIndex) to High(ColIndex) do begin
                //2023.01.18 if j > 1 then 추가
                if j > 1 then MyGrid.MergeCells(ColIndex[l],k,1,j);
            end;
            k := i;
            j := 1;
        end;
    end;

    if j > 1 then begin
        for l := Low(ColIndex) to High(ColIndex) do begin
            MyGrid.MergeCells(ColIndex[l],k,1,j);
        end;
    end;
end;

procedure YRMergeColumnCells2(MyGrid : TAdvStringGrid; ColIndex: array of integer; MainMerge: Boolean; var MergeIdx : string);
  function GridCheck(MyCol : array of integer; l : integer) : boolean;
  var
      i : integer;
  begin
      Result := True;
      for i := Low(MyCol) to High(MyCol) do begin
          if (MyGrid.Cells[MyCol[i],l] <> MyGrid.Cells[MyCol[i],l - 1]) then begin
              Result := False;
              break;
          end;
      end;
  end;

var
    i,j,k,l: Integer;
begin
    MergeIdx := '';
    //머지했을때...떠있는 상태에서 Call되면...맨밑에 선이 없는지는거 때문에 추가
    for i := Low(ColIndex) to High(ColIndex) do begin
        for j := 0 to MyGrid.RowCount -1 do begin
            MyGrid.SplitCells(ColIndex[i],j);
        end;
    end;

    j := 1;
    k := MyGrid.FixedRows;

    for i := MyGrid.FixedRows + 1 to MyGrid.RowCount - 1 - MyGrid.FixedFooters do begin
        if (GridCheck(ColIndex,i) = True) and (MainMerge or MyGrid.RowSpanIdentical(i,i - 1)) then begin
            inc(j)
        end else begin
            MergeIdx := MergeIdx + IntToStr(k) + ',';

            for l := Low(ColIndex) to High(ColIndex) do begin
                //2023.01.18 if j > 1 then 추가
                if j > 1 then MyGrid.MergeCells(ColIndex[l],k,1,j);
            end;

            if k + j = MyGrid.RowCount - 1 - MyGrid.FixedFooters then begin // 마지막줄 체크
                MergeIdx := MergeIdx + IntToStr(i) + ',';
            end;
            k := i;
            j := 1;
        end;
    end;

    if j > 1 then begin
        MergeIdx := MergeIdx + IntToStr(k) + ',';
        for l := Low(ColIndex) to High(ColIndex) do begin
            MyGrid.MergeCells(ColIndex[l],k,1,j);
        end;
    end;
end;

procedure GridCellsColor(MyGrid : TAdvStringGrid; StartRow : integer; MergeIdx : string);
var
    MergeList : TStringList;
    MyColor : TColor;
    Cnt : integer;
    i,j : integer;
begin
    MergeList := TStringList.Create;
  try
    MergeList.Clear;
    MergeList.CommaText := MergeIdx;
    if MergeList.Count = 0 then exit;
    MyColor := $00FEF2E8;
    Cnt := 0;
    for i := StartRow to MyGrid.RowCount-1 do begin
        if IntToStr(i) = MergeList.Strings[Cnt] then begin
            if MyColor = clWhite then begin
                MyColor := $00FEF2E8;
            end else begin
                MyColor := clWhite;
            end;
            Inc(Cnt);
        end;
        for j := 0 to MyGrid.ColCount -1 do begin
            MyGrid.Colors[j,i] := MyColor;
        end;
    end;
  finally
    FreeAndNil(MergeList);
  end;
end;

procedure GridRowColor(Ar,Ac : Integer; Ab : TBrush; StartRow : integer = 0);
begin
    if not Odd(Ar) and (Ar > StartRow) and (Ac >= 0) then begin
        Ab.Color := GridRColor;
    end;
end;

procedure Excel2AdvGrid(sGrid : TAdvStringGrid; xSheet : integer = 0);
  procedure _ShowInGrid(bWorkSheet: TExportWorkSheet; bGrid: TAdvStringGrid);
  var
      i, j : integer;
      xRow : TExportRow;
  begin
      bGrid.RowCount := Max(1, bWorkSheet.Rows.Count);
//      bGrid.ColCount := 1;

      for i := 0 to bWorkSheet.Rows.Count-1 do begin
          xRow := bWorkSheet.Rows[i];
//          bGrid.ColCount := Max(bGrid.ColCount, xRow.Cells.Count);
          for j := 0 to xRow.Cells.Count-1 do begin
              bGrid.WideCells[j,i] := xRow.Cells[j].SqlText;
          end;
      end;
  end;
var
    OpenDialog : TOpenDialog;
    xExport : TOExport;
    i : integer;
begin
    OpenDialog := TOpenDialog.Create(nil);
    xExport := TOExport.Create;
  try
    OpenDialog.Filter := 'Excel files(*.xlsx,*.xls)|*.xlsx;*.xls';
    if OpenDialog.Execute then begin
        xExport.LoadFromFile(OpenDialog.FileName);
        _ShowInGrid(xExport.WorkSheets[xSheet], sGrid);
    end;
  finally
    FreeAndNil(xExport);
    FreeAndNil(OpenDialog);
  end;
end;

end.
