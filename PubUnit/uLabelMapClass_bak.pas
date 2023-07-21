unit uLabelMapClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Buttons, StdCtrls, Printers, TntGraphics, TntClasses, TypInfo, pBarcode1D, pBarcode2D, pQRCode,
  pCode128, pPDF417, pDataMatrix, pDataMatrixEcc200, pCore1D, Clipbrd;

const
  BarCodeCnt = 10;

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
    procedure TextOutBaseWide(X, Y, I, J: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles; Escapement: integer = 0);
    procedure GetOutSide(var ALeft, ATop, ARight, ABottom: integer);
    procedure PrintMap(pCnt: integer; pStr: WideString; pOutput : TImage);
    procedure GetMargin(var MarginsTop, MarginsLeft: integer);
  public
    procedure PrintLabel(ptMapList : TTntStrings; ptStr: WideString; ptOutput: TImage); overload;
    procedure PrintLabel(ptFile, ptMap: string; ptCnt: integer; ptStr: WideString; ptOutput: TImage); overload;
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

procedure TLabelMap.TextOutBaseWide(X, Y, I, J: Integer; Canvas: TCanvas; Text: WideString; FontNM: string; FStyle: TFontStyles; Escapement: integer = 0);
var
    LogFont : TLogFont;
    OldFont, NewFont: HFONT;
    FOldMap : integer;
begin
    FOldMap := SetMapMode(Canvas.Handle,MM_LOMETRIC);
    Canvas.Font.Name := FontNM;
    Canvas.Font.Style := FStyle;
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

procedure TLabelMap.PrintLabel(ptMapList : TTntStrings; ptStr: WideString; ptOutput: TImage);
begin
    MapList.Clear;
    MapList.Assign(ptMapList);

    PrintMap(1,ptStr,ptOutput);
end;

procedure TLabelMap.PrintLabel(ptFile : string; ptMap : string; ptCnt : integer; ptStr : WideString; ptOutput : TImage);
var
    DataList : TTntStringList;
    DataLine : WideString;
    i : integer;
    FCheck : boolean;
begin
    MapList.Clear;
    DataList := TTntStringList.Create;
  try
    if not FileExists(ptFile) then exit;

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

    if MapList.Count > 0 then begin
        PrintMap(ptCnt,ptStr,ptOutput);
    end;
  finally
    FreeAndNil(DataList);
  end;
end;

procedure TLabelMap.PrintMap(pCnt : integer; pStr : WideString; pOutput : TImage);
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
    FOldMap : integer;
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
        Printer.Copies := pCnt;
        Printer.BeginDoc;
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
    end else begin
        xLeft := 0;
        xTop := 0;
        xRight := 0;
        xBottom := 0;
        MyCanvas := pOutput.Canvas;
    end;

    DataList.Clear;
    while Length(Trim(pStr)) > 0 do begin
        if Pos(';',pStr) = 0 then begin
            DataList.Add(pStr);
            break;
        end;
        DataList.Add(Copy(pStr,1,Pos(';',pStr)-1));
        Delete(pStr,1,Pos(';',pStr));
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
            if UpperCase(Trim(PositionList.Strings[7])) = 'BOLD' then begin
                MyFontStyle := [fsBold];
            end else begin
                MyFontStyle := [];
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
            TextOutBaseWide(xLeft+StrToInt(Trim(PositionList.Strings[1])),StrToInt(Trim(PositionList.Strings[2]))-xTop,StrToInt(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])),MyCanvas,MyTxt,Trim(PositionList.Strings[6]),MyFontStyle,iEscapement);
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
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'QR' then begin
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
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
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'MATRIX' then begin
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
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
        end else if UpperCase(Trim(PositionList.Strings[0])) = 'ECC200' then begin
            if UpperCase(Trim(PositionList.Strings[5])) = '@FIELD' then begin
                if DataList.Count > DataCnt then begin
                    MyTxt := DataList.Strings[DataCnt];
                end else begin
                    MyTxt := '@FIELD';
                end;
                Inc(DataCnt);
            end;
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
            if UpperCase(Trim(PositionList.Strings[8])) = 'FALSE' then begin
                DisPlayCheck := False;
            end else begin
                DisPlayCheck := True;
            end;

            if pOutput = nil then begin
                GetMargin(xMargin,yMargin);

                HS128Code := TBarcode1D_Code128.Create(nil);
                HS128Code.Barcode := MyTxt;
                HS128Code.AutoCheckDigit := False;
                if DisPlayCheck then begin
                    HS128Code.DisplayText := dtBarcode;
                    HS128Code.TextPosition := tpBottomOut;
                    HS128Code.TextAlignment := taCenter;
                end else begin
                    HS128Code.DisplayText := dtNone;
                end;
                HS128Code.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])),StrToInt(Trim(PositionList.Strings[5])),StrToInt(Trim(PositionList.Strings[6])));
            end else begin
                PubHS128Code[PubHS128Cnt] := TBarcode1D_Code128.Create(nil);
                PubHS128Code[PubHS128Cnt].Barcode := MyTxt;
                PubHS128Code[PubHS128Cnt].Height := Round(StrToInt(Trim(PositionList.Strings[5])) * 3.779);
                PubHS128Code[PubHS128Cnt].LeftMargin := Round(StrToInt(Trim(PositionList.Strings[1])) * 3.779); // 픽셀을 mm로
                PubHS128Code[PubHS128Cnt].TopMargin := Round(StrToInt(Trim(PositionList.Strings[2])) * 3.779);
                PubHS128Code[PubHS128Cnt].AutoCheckDigit := False;
                if DisPlayCheck then begin
                    PubHS128Code[PubHS128Cnt].DisplayText := dtBarcode;
                    PubHS128Code[PubHS128Cnt].TextPosition := tpBottomOut;
                    PubHS128Code[PubHS128Cnt].TextAlignment := taCenter;
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
        Printer.EndDoc;
    end;
  end;
end;

end.