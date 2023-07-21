unit TntHangul;

interface

uses
  Messages, Classes, TntStdCtrls;

type
  TTntEdit = class(TntStdCtrls.TTntEdit)
  private
    FIgnoreChar: boolean;
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
  public
  end;

implementation

constructor TTntEdit.Create(AOwner: TComponent);

begin
  inherited Create(AOwner);
  FIgnoreChar := false;
end;

procedure TTntEdit.WndProc(var Message: TMessage);
var
  OldText: string;
  OldSelStart: integer;
begin
  case Message.Msg of
    WM_IME_ENDCOMPOSITION:
    begin
      OldSelStart := SelStart;
      OldText := self.Text;
      inherited;
      self.Text := OldText;
      SelStart := OldSelStart;
      FIgnoreChar := true;
    end;
    WM_CHAR:
    begin
      FIgnoreChar := false;
      inherited;
    end;
    WM_IME_CHAR:
      if FIgnoreChar then
        FIgnoreChar := false
      else
        inherited;
    else
      inherited;
  end;
end;

end.
 