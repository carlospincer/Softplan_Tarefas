unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uspQuery, ufPadrao, FireDAC.Phys.FBDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes;

type
  TfTarefa1 = class(TfPadrao)
    Panel1: TPanel;
    Panel3: TPanel;
    btnGeraSQL: TButton;
    GroupBox2: TGroupBox;
    mmTabelas: TMemo;
    GroupBox3: TGroupBox;
    mmCondicoes: TMemo;
    GroupBox1: TGroupBox;
    mmColunas: TMemo;
    GroupBox4: TGroupBox;
    mmSQL: TMemo;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
var
  FspQuery : TspQuery;
begin
  FspQuery := TspQuery.Create(nil);
  try
    try
      FspQuery.spTabelas.Text := mmTabelas.Lines.Text;
      FspQuery.spColunas.Text := mmColunas.Lines.Text;
      FspQuery.spCondicoes.Text := mmCondicoes.Lines.Text;
      FspQuery.GeraSQL;
      mmSQL.Text := FspQuery.SQL.Text;
    except
      on e: Exception do
        MessageDlg('Erro:' + e.Message, mtError, [mbOK], 0);
    end;
  finally
    FreeAndNil(FspQuery);
  end;
end;

initialization
  RegisterClass(TfTarefa1);

end.
