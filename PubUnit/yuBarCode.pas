unit yuBarCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  Buttons, StdCtrls, Printers, TntGraphics, TntClasses, TypInfo, pBarcode1D, pBarcode2D, pQRCode,
  pCode128, pPDF417, pDataMatrix, pDataMatrixEcc200, pCore1D, Clipbrd, ComObj;

  procedure PrintBarCode(Txt : string);
  procedure GetMargin(var MarginsTop, MarginsLeft: integer);

implementation

procedure GetMargin(var MarginsTop, MarginsLeft : integer);
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

procedure PrintBarCode(Txt : string);
var
    PositionList : TStringList;
    MyTxt : string;
    xMargin, yMargin : integer;
    DisPlayCheck : boolean;
    DisplayFontSize : integer;
    DisplayFontName : string;

    HSQRCode : TBarcode2D_QRCode;
    HS128Code : TBarcode1D_Code128;
    HSPDF417 : TBarcode2D_PDF417;
    HSDataMatrix : TBarcode2D_DataMatrix;
    HSDataMatrixEcc200 : TBarcode2D_DataMatrixEcc200;
begin
    PositionList := TStringList.Create;
  try
    PositionList.Clear;
    PositionList.CommaText := Txt;

    if UpperCase(Trim(PositionList.Strings[0])) = '1D' then begin
        MyTxt := Trim(PositionList.Strings[7]);
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
    end else begin
        MyTxt := Trim(PositionList.Strings[5]);
    end;

    GetMargin(xMargin,yMargin);
    if UpperCase(Trim(PositionList.Strings[0])) = 'QR' then begin
        HSQRCode := TBarcode2D_QRCode.Create(nil);
        HSQRCode.Barcode := MyTxt;
        HSQRCode.BarcodeWidth := 20;
        HSQRCode.BarcodeHeight := 20;
        HSQRCode.EccLevel := elLowest;
        HSQRCode.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
        FreeAndNil(HSQRCode);
    end else if UpperCase(Trim(PositionList.Strings[0])) = 'PDF417' then begin
        HSPDF417 := TBarcode2D_PDF417.Create(nil);
        HSPDF417.Barcode := MyTxt;
        HSPDF417.BarcodeWidth := 20;
        HSPDF417.BarcodeHeight := 20;
        HSPDF417.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
        FreeAndNil(HSPDF417);
    end else if (UpperCase(Trim(PositionList.Strings[0])) = 'MATRIX') or (UpperCase(Trim(PositionList.Strings[0])) = 'ECC200') then begin
        HSDataMatrixEcc200 := TBarcode2D_DataMatrixEcc200.Create(nil);
        HSDataMatrixEcc200.Barcode := MyTxt;
        HSDataMatrixEcc200.BarcodeWidth := 20;
        HSDataMatrixEcc200.BarcodeHeight := 20;
        HSDataMatrixEcc200.Print(StrToInt(Trim(PositionList.Strings[1]))+xMargin,StrToInt(Trim(PositionList.Strings[2]))-yMargin,StrToFloat(Trim(PositionList.Strings[3])),StrToInt(Trim(PositionList.Strings[4])));
        FreeAndNil(HSDataMatrixEcc200);
    end else if UpperCase(Trim(PositionList.Strings[0])) = '1D' then begin
        HS128Code := TBarcode1D_Code128.Create(nil);
        HS128Code.Barcode := MyTxt;
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
    end;

  finally
    FreeAndNil(PositionList);
  end;
end;

end.
 