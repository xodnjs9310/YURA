unit uLabelMapClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Buttons, StdCtrls, Printers, TntGraphics, TntClasses, TypInfo, Clipbrd, ComObj, pBarcode1D, pCore2D,
  pBarcode2D, pQRCode, pCode128, pPDF417, pDataMatrix, pDataMatrixEcc200, pCore1D, Math, TntDialogs;

const
  BarCodeCnt = 10;
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);

type
  TLabelMap = class(TObject)
  private
    MapList : TTntStringList;
    PubHSQRCode : array[1..BarCodeCnt] of TBarcode2D_QRCode;
    PubHSQRCnt : integer;
    PubHS128Code : array[1..BarCodeCnt] of TBarcode1D_Code128;
    PubHS128Cnt : integer;
    PubHSPDF417 : array[1..BarCodeCnt] of TBarcode2D_PDF417;
    PubHSPDF417Cnt : integer;
    PubHSDataMatrix : array[1..BarCodeCnt] of TBarcode2D_DataMatrix;
    PubHSDataMatrixCnt : integer;
    PubHSDataMatrixEcc200 : array[1..BarCodeCnt] of TBarcode2D_DataMatrixEcc200;
    PubHSDataMatrixEcc200Cnt : integer;

    function SetOrgPoint(APoint: TPoint) : TSize;
    procedure TextOutBaseWide(X, Y, I, J: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles; Escapement: integer = 0; FoColor : TColor = clBlack);
    procedure TextOutBaseWideFontSize(X, Y, FSize: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles;  Escapement: integer = 0; FoColor : TColor = clBlack);
    procedure GetOutSide(var ALeft, ATop, ARight, ABottom: integer);
    procedure PrintMap(pCnt: integer; pStr: WideString; pOutput : TImage; PState: string = 'SE'; pSeparator : string = ';');
    procedure GetMargin(var MarginsTop, MarginsLeft: integer);
    function IsFileUTF8(const FileName: string): Boolean;
    function IsUTF8(Stream: TStream; out WithBOM: Boolean): Boolean;
  public
    procedure PrintLabel(ptMapList : TTntStrings; ptStr: WideString; ptOutput: TImage; PtState: string = 'SE'; ptSeparator: string = ';'); overload;
    procedure PrintLabel(ptFile, ptMap: string; ptCnt: integer; ptStr: WideString; ptOutput: TImage; PtState: string = 'SE'; ptSeparator: string = ';'); overload;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TLabelMap.Create;
begin
  inherited;
    MapList := TTntStringList.Create;
end;

destructor TLabelMap.Destroy;
var
    i : integer;
begin
    FreeAndNil(MapList);
    for i := 1 to BarCodeCnt do begin
        if Assigned(PubHSQRCode[i]) then FreeAndNil(PubHSQRCode[i]);
        if Assigned(PubHS128Code[i]) then FreeAndNil(PubHS128Code[i]);
        if Assigned(PubHSPDF417[i]) then FreeAndNil(PubHSPDF417[i]);
        if Assigned(PubHSDataMatrix[i]) then FreeAndNil(PubHSDataMatrix[i]);
        if Assigned(PubHSDataMatrixEcc200[i]) then FreeAndNil(PubHSDataMatrixEcc200[i]);
    end;
  inherited;
end;

function TLabelMap.IsUTF8(Stream: TStream; out WithBOM: Boolean): Boolean;
const
  MinimumCountOfUTF8Strings = 1;
  MaxBufferSize = $4000;
var
    Buffer: array of Byte;
    BufferSize, i, FoundUTF8Strings: Integer;

  function CountOfTrailingBytes: Integer;
  begin
      Result := 0;
      inc(i);
      while (i < BufferSize) and (Result < 4) do begin
          if Buffer[i] in [$80..$BF] then begin
              inc(Result);
          end else begin
              Break;
          end;
          inc(i);
      end;
  end;

begin
    BufferSize := Min(MaxBufferSize, Stream.Size - Stream.Position);

    Result := False;
    WithBOM := False;

    if BufferSize > 0 then begin
        SetLength(Buffer, BufferSize);
        Stream.ReadBuffer(Buffer[0], BufferSize);
        Stream.Seek(-BufferSize, soFromCurrent);

        if (BufferSize >= Length(UTF8BOM)) and CompareMem(@Buffer[0], @UTF8BOM[0], Length(UTF8BOM)) then begin
            WithBOM := True;
            Result := False;
            exit;
        end;

        FoundUTF8Strings := 0;
        i := 0;
        while i < BufferSize do begin
            case Buffer[i] of
                $00..$7F: ;
                $C2..$DF: if CountOfTrailingBytes = 1 then inc(FoundUTF8Strings) else Break;
                $E0: begin
                         inc(i);
                         if (i < BufferSize) and (Buffer[i] in [$A0..$BF]) and (CountOfTrailingBytes = 1) then inc(FoundUTF8Strings) else Break;
                     end;
                $E1..$EC, $EE..$EF: if CountOfTrailingBytes = 2 then inc(FoundUTF8Strings) else Break;
                $ED: begin
                         inc(i);
                         if (i < BufferSize) and (Buffer[i] in [$80..$9F]) and (CountOfTrailingBytes = 1) then inc(FoundUTF8Strings) else Break;
                     end;
                $F0: begin
                         inc(i);
                         if (i < BufferSize) and (Buffer[i] in [$90..$BF]) and (CountOfTrailingBytes = 2) then inc(FoundUTF8Strings) else Break;
                     end;
                $F1..$F3: if CountOfTrailingBytes = 3 then inc(FoundUTF8Strings) else Break;
                $F4: begin
                         inc(i);
                         if (i < BufferSize) and (Buffer[i] in [$80..$8F]) and (CountOfTrailingBytes = 2) then inc(FoundUTF8Strings) else Break;
                     end;
                $C0, $C1, $F5..$FF: break;
                $80..$BF: break;
            end;

            if FoundUTF8Strings = MinimumCountOfUTF8Strings then begin
                Result := True;
                Break;
            end;

            inc(i);
        end;
    end;
end;

function TLabelMap.IsFileUTF8(const FileName: string): Boolean;
var
    Stream : TStream;
    WithBOM : Boolean;
begin
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    Result := IsUTF8(Stream, WithBOM);
  finally
    Stream.Free;
  end;
end;

procedure TLabelMap.GetMargin(var MarginsTop, MarginsLeft : integer);
  function InchTomm(Pixel: Single) : integer;
  begin
    Result := Round(Pixel * 2.54 * 10);
  end;
var
    PixelsPerInch : TPoint;
    PhysPageSize : TPoint;
    OffsetStart : TPoint;
    PageRes : TPoint;
    MarginsBottom, MarginsRight : integer;
begin
    PixelsPerInch.y := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
    PixelsPerInch.x := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    Escape(Printer.Handle, GETPHYSPAGESIZE, 0, nil, @PhysPageSize);
    Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @OffsetStart);
    PageRes.y := GetDeviceCaps(Printer.Handle, VERTRES);
    PageRes.x := GetDeviceCaps(Printer.Handle, HORZRES);

    MarginsTop := InchTomm(OffsetStart.y / PixelsPerInch.y);
    MarginsLeft := InchTomm(OffsetStart.x / PixelsPerInch.x);
    MarginsBottom := InchTomm(((PhysPageSize.y - PageRes.y) / PixelsPerInch.y) - (OffsetStart.y / PixelsPerInch.y));
    MarginsRight := InchTomm(((PhysPageSize.x - PageRes.x) / PixelsPerInch.x) - (OffsetStart.x / PixelsPerInch.x));
end;

function TLabelMap.SetOrgPoint(APoint: TPoint) : TSize;
var
    Org: TPoint;
begin
    Escape(Printer.Canvas.Handle,GETPRINTINGOFFSET,0,nil,@Org);
    SetWindowOrgEx(Printer.Handle,Org.X-APoint.X,APoint.Y-Org.Y,@Result);
end;

procedure TLabelMap.GetOutSide(var ALeft, ATop, ARight, ABottom : integer);
var
    Pt : TPoint;
begin
    Escape(Printer.Handle, GETPRINTINGOFFSET, 0, nil, @Pt);
    ALeft := Pt.X;
    ATop := Pt.Y;
    Escape (Printer.Handle, GETPHYSPAGESIZE, 0, nil, @Pt);
    ARight := Pt.X - Printer.PageWidth - ALeft;
    ABottom:= Pt.Y - Printer.PageHeight - ATop;
end;

procedure TLabelMap.TextOutBaseWide(X, Y, I, J: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles; Escapement: integer = 0; FoColor : TColor = clBlack);
var
    LogFont : TLogFont;
    OldFont, NewFont: HFONT;
    FOldMap : integer;
begin
    FOldMap := SetMapMode(Canvas.Handle,MM_LOMETRIC);
    Canvas.Font.Name := FontNM;
    Canvas.Font.Style := FStyle;
    Canvas.Font.Color := FoColor;
    Canvas.Brush.Style := bsClear;

    if GetObject(Canvas.Font.Handle,SizeOf(LogFont),@LogFont) <> 0 then begin
        LogFont.lfHeight := I;
        LogFont.lfWidth := J;
        if Escapement <> 0 then LogFont.lfEscapement := Escapement;
        NewFont:= CreateFontIndirect(LogFont);

        OldFont := SelectObject(Canvas.Handle,NewFont);
        WideCanvasTextOut(Canvas,X, Y, Text);

        NewFont := SelectObject(Canvas.Handle,OldFont);
        DeleteObject(NewFont);
    end;
    SetMapMode(Canvas.Handle,FOldMap);
end;

procedure TLabelMap.TextOutBaseWideFontSize(X, Y, FSize: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles;  Escapement: integer = 0; FoColor : TColor = clBlack);
var
    LogFont : TLogFont;
    OldFont, NewFont: HFONT;
    FOldMap : integer;
begin
    FOldMap := SetMapMode(Canvas.Handle,MM_LOMETRIC);
    Canvas.Font.Name := FontNM;
    Canvas.Font.Style := FStyle;
    Canvas.Font.Color := FoColor;
    Canvas.Font.Size := FSize;
    Canvas.Brush.Style := bsClear;

    if GetObject(Canvas.Font.Handle,SizeOf(LogFont),@LogFont) <> 0 then begin
        if Escapement <> 0 then LogFont.lfEscapement := Escapement;
        NewFont:= CreateFontIndirect(LogFont);

        OldFont := SelectObject(Canvas.Handle,NewFont);

        WideCanvasTextOut(Canvas,X, Y, Text);

        NewFont := SelectObject(Canvas.Handle,OldFont);
        DeleteObject(NewFont);
    end;
    SetMapMode(Canvas.Handle,FOldMap);
end;

procedure TLabelMap.PrintLabel(ptMapList : TTntStrings; ptStr: WideString; ptOutput: TImage; PtState: string = 'SE'; ptSeparator: string = ';');
begin
    MapList.Clear;
    MapList.Assign(ptMapList);

    PrintMap(1,ptStr,ptOutput,PtState,ptSeparator);
end;

procedure TLabelMap.PrintLabel(ptFile : string; ptMap : string; ptCnt : integer; ptStr : WideString; ptOutput : TImage; PtState: string = 'SE'; ptSeparator: string = ';');
var
    DataList : TTntStringList;
    DataList2 : TStringList;
    DataLine : WideString;
    i : integer;
    FCheck : boolean;
    eCheck : boolean;
begin
    if not FileExists(ptFile) then exit;

    eCheck := False;
    if IsFileUTF8(ptFile) then eCheck := True;

    MapList.Clear;
    DataList := TTntStringList.Create;
    DataList2 := TStringList.Create;
  try
    if not eCheck then begin
        DataList.Clear;
        DataList.LoadFromFile(ptFile);
        FCheck := False;
        for i := 0 to DataList.Count -1 do begin
            DataLine := Trim(DataList.Strings[i]);
            if Pos('//',DataLine) > 0 then begin
                DataLine := Trim(Copy(DataLine,1,Pos('//',DataLine)-1));
            end;
            if Length(DataLine) = 0 then continue;
            if Pos('[' + UpperCase(ptMap) + ']',UpperCase(DataLine)) > 0 then begin
                FCheck := True;
                continue;
            end;
            if (FCheck) and (Pos('[',DataLine) > 0) and (Pos(']',DataLine) > 0) then begin
                break;
            end;
            if FCheck then MapList.Add(DataLine);
        end;
    end else begin
        DataList2.Clear;
        DataList2.LoadFromFile(ptFile);
        FCheck := False;
        for i := 0 to DataList2.Count -1 do begin
            DataLine := Trim(UTF8Decode(DataList2.Strings[i]));
            if Pos('//',DataLine) > 0 then begin
                DataLine := Trim(Copy(DataLine,1,Pos('//',DataLine)-1));
            end;
            if Length(DataLine) = 0 then continue;
            if Pos('[' + UpperCase(ptMap) + ']',UpperCase(DataLine)) > 0 then begin
                FCheck := True;
                continue;
            end;
            if (FCheck) and (Pos('[',DataLine) > 0) and (Pos(']',DataLine) > 0) then begin
                break;
            end;
            if FCheck then MapList.Add(DataLine);
        end;
    end;

    if MapList.Count > 0 then begin
        PrintMap(ptCnt,ptStr,ptOutput,PtState,ptSeparator);
    end;
  finally
    FreeAndNil(DataList2);
    FreeAndNil(DataList);
  end;
end;

procedure TLabelMap.PrintMap(pCnt : integer; pStr : WideString; pOutput : TImage; PState : string = 'SE'; pSeparator : string = ';');
var
    OldMap : integer;
    OldOrg : TSize;
    xLeft,xTop,xRight,xBottom : integer;
    MyCanvas : TCanvas;
    MyFontStyle: TFontStyles;
    i : integer;
    DataList : TTntStringList;
    PositionList : TTntStringList;
    DataLine : WideString;
    DataCnt : integer;
    MyTxt : WideString;
    xMargin, yMargin : integer;
    HSQRCode : TBarcode2D_QRCode;
    HS128Code : TBarcode1D_Code128;
    HSPDF417 : TBarcode2D_PDF417;
    HSDataMatrix : TBarcode2D_DataMatrix;
    HSDataMatrixEcc200 : TBarcode2D_DataMatrixEcc200;
    iEscapement : integer;
    DisPlayCheck : boolean;
    DisplayFontSize : integer;
    DisplayFontName : string;
    FOldMap : integer;
    MyFontColor : TColor;
    Txt, Txt1 : string;
begin
    PubHSQRCnt := 1;
    PubHS128Cnt := 1;
    PubHSPDF417Cnt := 1;
    PubHSDataMatrixCnt := 1;
    PubHSDataMatrixEcc200Cnt := 1;

    for i := 1 to 10 do begin
        if Assigned(PubHSQRCode[i]) then FreeAndNil(PubHSQRCode[i]);
        if Assigned(PubHS128Code[i]) then FreeAndNil(PubHS128Code[i]);
        if Assigned(PubHSPDF417[i]) then FreeAndNil(PubHSPDF417[i]);
        if Assigned(PubHSDataMatrix[i]) then FreeAndNil(PubHSDataMatrix[i]);
        if Assigned(PubHSDataMatrixEcc200[i]) then FreeAndNil(PubHSDataMatrixEcc200[i]);
    end;

    if pOutput = nil then begin
        if Pos('S',PState) > 0 then begin
            Printer.Copies := pCnt;
            Printer.BeginDoc;
        end;
        OldMap := SetMapMode(Printer.Handle,MM_LOMETRIC);
        OldOrg := SetOrgPoint(Point(0,0));
    end else begin
        pOutput.Canvas.Brush.Color := clWhite;
        pOutput.Canvas.FillRect(pOutput.ClientRect);
    end;
    DataList := TTntStringList.Create;
    PositionList := TTntStringList.Create;

  try
    if pOutput = nil then begin
        GetOutSide(xLeft,xTop,xRight,xBottom); // 프린터가 가지고 있는 여백 찾아서 보정
        MyCanvas := Printer.Canvas;
        MyCanvas.Brush.Color := clWhite;
        MyCanvas.Brush.Style := bsClear;
    end else begin
        xLeft := 0;
        xTop := 0;
        xRight := 0;
        xBottom := 0;
        MyCanvas := pOutput.Canvas;
    end;

    DataList.Clear;
    while Length(Trim(pStr)) > 0 do begin
        if Pos(pSeparator,pStr) = 0 then begin
            DataList.Add(pStr);
            break;
        end;
        DataList.Add(Copy(pStr,1,Pos(pSeparator,pStr)-1));
        Delete(pStr,1,Pos(pSeparator,pStr));
    end;

    DataCnt := 0;
    for i := 0 to MapList.Count -1 do begin
        DataLine := MapList.Strings[i];
        if Pos('//',DataLine) > 0 then begin
            DataLine := Copy(DataLine,1,Pos('//',DataLine)-1);
        end;
        if Length(Trim(DataLine)) = 0 then continue;

        PositionList.Clear;
        while Length(Trim(DataLine)) > 0 do begin
            if Pos(',',DataLine) = 0 then begin
                PositionList.Add(DataLine);
                break;
            end;
            PositionList.Add(Copy(DataLine,1,Pos(',',DataLine)-1));
            Delete(DataLine,1,Pos(',',DataLine));
        end;

        if UpperCase(Trim(PositionList.Strings[0])) = 'TXT' then begin
            Txt := UpperCase(Trim(PositionList.Strings[7]));
            if Pos(':',Txt) > 0 then begin
                Txt1 := Copy(Txt,1,Pos(':',Txt)-1);
                Delete(Txt,1,Pos(':',Txt));
                if UpperCase(Txt1) = 'BOLD' then begin
                    MyFontStyle := [fsBold];
                end else begin
                    MyFontStyle := [];
                end;
                MyFontColor := StringToColor(Trim(Txt));
            end else begin
                if UpperCase(Txt) = 'BOLD' then begin
                    MyFontStyle := [fsBold];
                end else begin
                    MyFontStyle := [];
                end;
                MyFontColor := clBlack;
            end;
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end else if Copy(Trim(PositionList.Strings[5]),1,2) = '@@' then begin // Map에 있는 글자를 직접 찍기 위해
                MyTxt := Trim(Copy(Trim(PositionList.Strings[5]),3,200));
            end;

            if PositionList.Count > 8 then begin
                iEscapement := StrToIntDef(Trim(PositionList.Strings[8]),0);
            end else begin
                iEscapement := 0;
            end;
            TextOutBaseWide(xLeft+StrToInt(Trim(PositionList.Strings[1])),StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])),MyCanvas,MyTxt,Trim(PositionList.Strings[6]),MyFontStyle,iEscapement,MyFontColor);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'TEXT' then begin
            Txt := UpperCase(Trim(PositionList.Strings[6]));
            if Pos(':',Txt) > 0 then begin
                Txt1 := Copy(Txt,1,Pos(':',Txt)-1);
                Delete(Txt,1,Pos(':',Txt));
                if UpperCase(Txt1) = 'BOLD' then begin
                    MyFontStyle := [fsBold];
                end else begin
                    MyFontStyle := [];
                end;
                MyFontColor := StringToColor(Trim(Txt));
            end else begin
                if UpperCase(Txt) = 'BOLD' then begin
                    MyFontStyle := [fsBold];
                end else begin
                    MyFontStyle := [];
                end;
                MyFontColor := clBlack;
            end;

            if Copy(Trim(PositionList.Strings[4]),1,2) = '@@' then begin
                MyTxt := Trim(Copy(PositionList.Strings[4],3,100));
            end else if UpperCase(Trim(PositionList.Strings[4])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if PositionList.Count > 7 then begin
                iEscapement := StrToIntDef(Trim(PositionList.Strings[7]),0);
            end else begin
                iEscapement := 0;
            end;
            TextOutBaseWideFontSize(xLeft+StrToInt(Trim(PositionList.Strings[1])),StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3])),MyCanvas,MyTxt,Trim(PositionList.Strings[5]),MyFontStyle,iEscapement,MyFontColor);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'BOX' then begin
            FOldMap := SetMapMode(MyCanvas.Handle,MM_LOMETRIC);
            MyCanvas.Pen.Width := StrToInt(Trim(PositionList.Strings[5]));
            MyCanvas.Pen.Color := StringToColor(Trim(PositionList.Strings[6]));
            MyCanvas.Pen.Style := TPenStyle(GetEnumValue(TypeInfo(TPenStyle),Trim(PositionList.Strings[7])));
            MyCanvas.Rectangle(StrToInt(Trim(PositionList.Strings[1]))+xLeft,StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3]))+xLeft,StrToInt(Trim(PositionList.Strings[4]))-xTop);
            SetMapMode(MyCanvas.Handle,FOldMap);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'LINE' then begin
            FOldMap := SetMapMode(MyCanvas.Handle,MM_LOMETRIC);
            MyCanvas.Pen.Width := StrToInt(Trim(PositionList.Strings[5]));
            MyCanvas.Pen.Color := StringToColor(Trim(PositionList.Strings[6]));
            MyCanvas.Pen.Style := TPenStyle(GetEnumValue(TypeInfo(TPenStyle),Trim(PositionList.Strings[7])));
            MyCanvas.MoveTo(StrToInt(Trim(PositionList.Strings[1]))+xLeft,StrToInt(Trim(PositionList.Strings[2]))-xTop);
            MyCanvas.LineTo(StrToInt(Trim(PositionList.Strings[3]))+xLeft,StrToInt(Trim(PositionList.Strings[4]))-xTop);
            SetMapMode(MyCanvas.Handle,FOldMap);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'CIRCLE' then begin
            FOldMap := SetMapMode(MyCanvas.Handle,MM_LOMETRIC);
            MyCanvas.Pen.Width := StrToInt(Trim(PositionList.Strings[5]));
            MyCanvas.Pen.Color := StringToColor(Trim(PositionList.Strings[6]));
            MyCanvas.Pen.Style := TPenStyle(GetEnumValue(TypeInfo(TPenStyle),Trim(PositionList.Strings[7])));
            MyCanvas.Ellipse(StrToInt(Trim(PositionList.Strings[1]))+xLeft,StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3]))+xLeft,StrToInt(Trim(PositionList.Strings[4]))-xTop);
            SetMapMode(MyCanvas.Handle,FOldMap);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'HALFCIRCLE' then begin
            FOldMap := SetMapMode(MyCanvas.Handle,MM_LOMETRIC);
            MyCanvas.Pen.Width := StrToInt(Trim(PositionList.Strings[9]));
            MyCanvas.Pen.Color := StringToColor(Trim(PositionList.Strings[10]));
            MyCanvas.Pen.Style := TPenStyle(GetEnumValue(TypeInfo(TPenStyle),Trim(PositionList.Strings[7])));
            MyCanvas.Arc(StrToInt(Trim(PositionList.Strings[1]))+xLeft,StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3]))+xLeft,StrToInt(Trim(PositionList.Strings[4]))-xTop,StrToInt(Trim(PositionList.Strings[5]))+xLeft,StrToInt(Trim(PositionList.Strings[6]))-xTop,StrToInt(Trim(PositionList.Strings[7]))+xLeft,StrToInt(Trim(PositionList.Strings[8]))-xTop);
            SetMapMode(MyCanvas.Handle,FOldMap);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'HALFCIRCLE_' then begin
            FOldMap := SetMapMode(MyCanvas.Handle,MM_LOMETRIC);
            MyCanvas.Pen.Width := StrToInt(Trim(PositionList.Strings[9]));
            MyCanvas.Pen.Color := StringToColor(Trim(PositionList.Strings[10]));
            MyCanvas.Pen.Style := TPenStyle(GetEnumValue(TypeInfo(TPenStyle),Trim(PositionList.Strings[7])));
            MyCanvas.Chord(StrToInt(Trim(PositionList.Strings[1]))+xLeft,StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3]))+xLeft,StrToInt(Trim(PositionList.Strings[4]))-xTop,StrToInt(Trim(PositionList.Strings[5]))+xLeft,StrToInt(Trim(PositionList.Strings[6]))-xTop,StrToInt(Trim(PositionList.Strings[7]))+xLeft,StrToInt(Trim(PositionList.Strings[8]))-xTop);
            SetMapMode(MyCanvas.Handle,FOldMap);
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'QR' then begin
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if MyTxt = '@FIELD' then continue;
            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HSQRCode := TBarcode2D_QRCode.Create(nil);
                HSQRCode.Barcode := MyTxt;
                HSQRCode.BarcodeWidth := 20;
                HSQRCode.BarcodeHeight := 20;
                HSQRCode.EccLevel := elLowest;
                HSQRCode.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
                FreeAndNil(HSQRCode);
            end else begin
                PubHSQRCode[PubHSQRCnt] := TBarcode2D_QRCode.Create(nil);
                PubHSQRCode[PubHSQRCnt].Barcode := MyTxt;
                PubHSQRCode[PubHSQRCnt].BarcodeWidth := 20;
                PubHSQRCode[PubHSQRCnt].BarcodeHeight := 20;
                PubHSQRCode[PubHSQRCnt].EccLevel := elLowest;
                PubHSQRCode[PubHSQRCnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHSQRCode[PubHSQRCnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
                if StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 1.7 then begin
                    PubHSQRCode[PubHSQRCnt].Module := 1;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 1.7) and (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 2.4) then begin
                    PubHSQRCode[PubHSQRCnt].Module := 2;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 2.4) then begin
                    PubHSQRCode[PubHSQRCnt].Module := 3;
                end;
                PubHSQRCode[PubHSQRCnt].Image := pOutput;
                PubHSQRCode[PubHSQRCnt].Draw(True);

                Inc(PubHSQRCnt);
            end;
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'PDF417' then begin
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if MyTxt = '@FIELD' then continue;
            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HSPDF417 := TBarcode2D_PDF417.Create(nil);
                HSPDF417.Barcode := MyTxt;
                HSPDF417.BarcodeWidth := 20;
                HSPDF417.BarcodeHeight := 20;
                HSPDF417.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
                FreeAndNil(HSPDF417);
            end else begin
                PubHSPDF417[PubHSPDF417Cnt] := TBarcode2D_PDF417.Create(nil);
                PubHSPDF417[PubHSPDF417Cnt].Barcode := MyTxt;
                PubHSPDF417[PubHSPDF417Cnt].BarcodeWidth := 20;
                PubHSPDF417[PubHSPDF417Cnt].BarcodeHeight := 20;
                PubHSPDF417[PubHSPDF417Cnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHSPDF417[PubHSPDF417Cnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
                if StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 1.7 then begin
                    PubHSPDF417[PubHSPDF417Cnt].Module := 1;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 1.7) and (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 2.4) then begin
                    PubHSPDF417[PubHSPDF417Cnt].Module := 2;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 2.4) then begin
                    PubHSPDF417[PubHSPDF417Cnt].Module := 3;
                end;
                PubHSPDF417[PubHSPDF417Cnt].Image := pOutput;
                PubHSPDF417[PubHSPDF417Cnt].Draw(True);

                Inc(PubHSPDF417Cnt);
            end;
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'MATRIX' then begin   // 데이타 메트릭스는 이거 대신 ECC200을 사용
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if MyTxt = '@FIELD' then continue;
            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HSDataMatrix := TBarcode2D_DataMatrix.Create(nil);
                HSDataMatrix.Barcode := MyTxt;
                HSDataMatrix.BarcodeWidth := 20;
                HSDataMatrix.BarcodeHeight := 20;
                HSDataMatrix.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
                FreeAndNil(HSDataMatrix);
            end else begin
                PubHSDataMatrix[PubHSDataMatrixCnt] := TBarcode2D_DataMatrix.Create(nil);
                PubHSDataMatrix[PubHSDataMatrixCnt].Barcode := MyTxt;
                PubHSDataMatrix[PubHSDataMatrixCnt].BarcodeWidth := 20;
                PubHSDataMatrix[PubHSDataMatrixCnt].BarcodeHeight := 20;
                PubHSDataMatrix[PubHSDataMatrixCnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHSDataMatrix[PubHSDataMatrixCnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
                if StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 1.7 then begin
                    PubHSDataMatrix[PubHSDataMatrixCnt].Module := 1;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 1.7) and (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 2.4) then begin
                    PubHSDataMatrix[PubHSDataMatrixCnt].Module := 2;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 2.4) then begin
                    PubHSDataMatrix[PubHSDataMatrixCnt].Module := 3;
                end;
                PubHSDataMatrix[PubHSDataMatrixCnt].Image := pOutput;
                PubHSDataMatrix[PubHSDataMatrixCnt].Draw(True);

                Inc(PubHSDataMatrixCnt);
            end;
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'ECC200' then begin   // 데이타 메트릭스는 이거 사용
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if MyTxt = '@FIELD' then continue;
            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HSDataMatrixEcc200 := TBarcode2D_DataMatrixEcc200.Create(nil);
                HSDataMatrixEcc200.Barcode := MyTxt;
                HSDataMatrixEcc200.BarcodeWidth := 20;
                HSDataMatrixEcc200.BarcodeHeight := 20;
                HSDataMatrixEcc200.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
                FreeAndNil(HSDataMatrixEcc200);
            end else begin
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt] := TBarcode2D_DataMatrixEcc200.Create(nil);
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Barcode := MyTxt;
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].BarcodeWidth := 20;
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].BarcodeHeight := 20;
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
                if StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 1.7 then begin
                    PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Module := 1;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 1.7) and (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 2.4) then begin
                    PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Module := 2;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 2.4) then begin
                    PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Module := 3;
                end;
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Image := pOutput;
                PubHSDataMatrixEcc200[PubHSDataMatrixEcc200Cnt].Draw(True);

                Inc(PubHSDataMatrixEcc200Cnt);
            end;
        end else if UpperCase(Trim(PositionList.Strings[0])) = '1D' then begin
            if UpperCase(Trim(PositionList.Strings[7])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
            if MyTxt = '@FIELD' then continue;
            if UpperCase(Trim(PositionList.Strings[8])) = 'FALSE' then begin
                DisPlayCheck := False;
            end else begin
                DisPlayCheck := True;
                if PositionList.Count > 8 then begin
                    DisplayFontSize := StrToIntDef(Trim(PositionList.Strings[9]),10)
                end else begin
                    DisplayFontSize := 10;
                end;
                if PositionList.Count > 9 then begin
                    DisplayFontName := Trim(PositionList.Strings[10]);
                end else begin
                    DisplayFontName := 'Britannic';
                end;
            end;

            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HS128Code := TBarcode1D_Code128.Create(nil);
                HS128Code.Barcode := MyTxt;
//                HS128Code.AutoCheckDigit := False;
                if DisPlayCheck then begin
                    HS128Code.DisplayText := dtBarcode;
                    HS128Code.TextPosition := tpBottomOut;
                    HS128Code.TextAlignment := taCenter;
                    HS128Code.TextFont.Size := DisplayFontSize;
                    HS128Code.TextFont.Name := DisplayFontName;
                    HS128Code.TextCSpacing := 0;
                    HS128Code.TextVSpacing := 1;
                end else begin
                    HS128Code.DisplayText := dtNone;
                end;
                HS128Code.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])),StrToInt(Trim(PositionList.Strings[5])),StrToInt(Trim(PositionList.Strings[6])));
                FreeAndNil(HS128Code);
            end else begin
                PubHS128Code[PubHS128Cnt] := TBarcode1D_Code128.Create(nil);
                PubHS128Code[PubHS128Cnt].Barcode := MyTxt;
                PubHS128Code[PubHS128Cnt].Height := Round(StrToInt(Trim(PositionList.Strings[5])) * 3.779);
                PubHS128Code[PubHS128Cnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHS128Code[PubHS128Cnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
//                PubHS128Code[PubHS128Cnt].AutoCheckDigit := False;
                if DisPlayCheck then begin
                    PubHS128Code[PubHS128Cnt].DisplayText := dtBarcode;
                    PubHS128Code[PubHS128Cnt].TextPosition := tpBottomOut;
                    PubHS128Code[PubHS128Cnt].TextAlignment := taCenter;
                    PubHS128Code[PubHS128Cnt].TextFont.Size := DisplayFontSize;
                    PubHS128Code[PubHS128Cnt].TextFont.Name := DisplayFontName;
                    PubHS128Code[PubHS128Cnt].TextCSpacing := 0;
                    PubHS128Code[PubHS128Cnt].TextVSpacing := 1;
                end else begin
                    PubHS128Code[PubHS128Cnt].DisplayText := dtNone;
                end;

                if StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 1.7 then begin
                    PubHS128Code[PubHS128Cnt].Module := 1;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 1.7) and (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 <= 2.4) then begin
                    PubHS128Code[PubHS128Cnt].Module := 2;
                end else if (StrToFloat(Trim(PositionList.Strings[3])) * 3.779 > 2.4) then begin
                    PubHS128Code[PubHS128Cnt].Module := 3;
                end;
                PubHS128Code[PubHS128Cnt].Image := pOutput;
                PubHS128Code[PubHS128Cnt].Draw;

                Inc(PubHS128Cnt);
            end;
        end;
    end;

  finally
    FreeAndNil(PositionList);
    FreeAndNil(DataList);
    if pOutput = nil then begin
        SetOrgPoint(Point(OldOrg.cx,OldOrg.cy));
        SetMapMode(Printer.Handle,OldMap);
        if Pos('E',PState) > 0 then begin
            Printer.EndDoc;
        end else begin
            Printer.NewPage;
        end;
    end;
  end;
end;

end.