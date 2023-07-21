unit yuAdvGrid;

interface

uses
  Windows, StdCtrls, Classes, Grids, BaseGrid, AdvGrid;

type
  TAdvStringGrid = class(AdvGrid.TAdvStringGrid)
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  private
  public
  end;

implementation

function TAdvStringGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
var
    lc : Integer;
begin
    if (goRowSelect in Options) and Navigation.KeepHorizScroll then begin
        StartUpdate;
        lc := LeftCol;
        Result := inherited DoMouseWheelDown(Shift,MousePos);
        LeftCol := lc;
        ResetUpdate;
    end else begin
        DoMouseWheelUp(Shift,MousePos);
        Result := inherited DoMouseWheelDown(Shift,MousePos);
    end;
end;
end.

