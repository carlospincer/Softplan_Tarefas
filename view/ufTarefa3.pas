unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadrao, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfTarefa3 = class(TfPadrao)
    Panel1: TPanel;
    gridDados: TDBGrid;
    Panel2: TPanel;
    edtTotal: TEdit;
    edtTotalDiv: TEdit;
    btnTotal: TButton;
    btnTotalDiv: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FcdsDados: TClientDataSet;
    FdsDados: TDataSource;
    procedure CriaDados;
    procedure PopulaDados;
    function GetTotal: Double;
    function GetTotalDivisao: Double;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  edtTotal.Text := FormatFloat('###,##0.00', GetTotal);
end;

procedure TfTarefa3.btnTotalDivClick(Sender: TObject);
begin
  edtTotalDiv.Text := FormatFloat('###,##0.00', GetTotalDivisao);
end;

procedure TfTarefa3.CriaDados;
begin
  FcdsDados := TClientDataSet.Create(nil);
  FcdsDados.Close;
  FcdsDados.FieldDefs.Clear;
  FcdsDados.FieldDefs.Add('IDProjeto', ftInteger);
  FcdsDados.FieldDefs.Add('NomeProjeto', ftString, 50);
  FcdsDados.FieldDefs.Add('Valor', ftCurrency);
  FcdsDados.CreateDataSet;

  FdsDados := TDataSource.Create(nil);
  FdsDados.DataSet := FcdsDados;

  gridDados.DataSource := FdsDados;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FdsDados);
  FreeAndNil(FcdsDados);
  inherited;
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
  inherited;
  CriaDados;
  PopulaDados;
end;

function TfTarefa3.GetTotal: Double;
begin
  Result := 0;
  FcdsDados.First;
  while not FcdsDados.Eof do
  begin
    Result := Result + FcdsDados.FieldByName('Valor').AsCurrency;
    FcdsDados.Next;
  end;
end;

function TfTarefa3.GetTotalDivisao: Double;
var
  lDiv: Double;
  lAnterior: Double;
begin
  lDiv := 0;
  lAnterior:= 0;
  FcdsDados.First;
  while not FcdsDados.Eof do
  begin
    if lAnterior > 0 then
      lDiv := lDiv + FcdsDados.FieldByName('Valor').AsCurrency / lAnterior;
    lAnterior := FcdsDados.FieldByName('Valor').AsCurrency;
    FcdsDados.Next;
  end;
  Result := lDiv;
end;

procedure TfTarefa3.PopulaDados;
var
  I: Integer;
begin
  for I := 1 to 10 do
  begin
    FcdsDados.Append;
    FcdsDados.FieldByName('IDProjeto').AsInteger := I;
    FcdsDados.FieldByName('NomeProjeto').AsString := 'Projeto ' + I.ToString;
    FcdsDados.FieldByName('Valor').AsCurrency := I * 10;
    FcdsDados.Post;
  end;

end;

initialization

RegisterClass(TfTarefa3);

end.
