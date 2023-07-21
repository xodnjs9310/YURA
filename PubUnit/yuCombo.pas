unit yuCombo;

interface

uses
  Windows, StdCtrls, Classes, TntStdCtrls;

type
  TComboBox = class(StdCtrls.TComboBox)
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
  private
    FUseMouseWheel: Boolean;
  public
    Property UseMouseWheel: Boolean Read FUseMouseWheel Write FUseMouseWheel;
  end;

type
  TTntComboBox = class(TntStdCtrls.TTntComboBox)
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
  private
    FUseMouseWheel: Boolean;
  public
    Property UseMouseWheel: Boolean Read FUseMouseWheel Write FUseMouseWheel;
  end;

implementation

function TComboBox.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
    if not FUseMouseWheel then Result := True;
end;

function TTntComboBox.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
begin
    if not FUseMouseWheel then Result := True;
end;

end.
 