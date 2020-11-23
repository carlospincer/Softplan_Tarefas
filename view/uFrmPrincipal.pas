unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery, AdvTabSet,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    mnTarefas: TMainMenu;
    arefa11: TMenuItem;
    TfTarefa1: TMenuItem;
    TfTarefa2: TMenuItem;
    TfTarefa3: TMenuItem;
    tbMDI: TToolBar;
    procedure onAction(Sender: TObject);
    procedure OnClick(Sender: TObject);
    procedure onDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CtrlMDI(AForm: TForm);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.CtrlMDI(AForm: TForm);
var
  Botao: TBitBtn;
begin
  Botao := TBitBtn.Create(tbMDI);
  Botao.Parent := tbMDI;
  Botao.Align := alRight;
  Botao.Caption := AForm.Caption;
  Botao.InsertComponent(AForm);
  Botao.OnClick := OnClick;
  tbMDI.Realign;
end;

procedure TfrmPrincipal.onAction(Sender: TObject);
var
  Form: TForm;
  Classe: TFormClass;
begin
  Classe := TFormClass(FindClass(TWinControl(Sender).Name));
  Form := Classe.Create(nil);
  Form.onDestroy := onDestroy;
  Form.Show;
  CtrlMDI(Form);
end;

procedure TfrmPrincipal.OnClick(Sender: TObject);
begin
  TForm(TBitBtn(Sender).Components[0]).Show;
end;

procedure TfrmPrincipal.onDestroy(Sender: TObject);
var
  I: Integer;
  btn: TBitBtn;
begin
  for I := 0 to tbMDI.ComponentCount - 1 do
  begin
    if (tbMDI.Components[I] is TBitBtn) then
    begin
      btn :=  TBitBtn(tbMDI.Components[I]);
      if (btn.ComponentCount > 0) and (btn.Components[0] = TComponent(Sender)) then
      begin
        btn.Visible := False;
        btn.FreeOnRelease;
        btn.Refresh;
        tbMDI.Refresh;
        tbMDI.Realign;
      end;
    end;
  end;

end;

end.
