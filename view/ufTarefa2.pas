unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufPadrao, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TTarefa = class(TThread)
  protected
    procedure Execute; override;
  private
    FNomeInstancia: string;
    FPosicao: Integer;
    FMaxIntervalo: Integer;
    FMemo: TMemo;
    FProgressBar: TProgressBar;
  public
    constructor Create(AMaxIntervalo: Integer; AMemo: TMemo; AProgressBar: TProgressBar); reintroduce;
    procedure Sincronizar;
  end;

  TfTarefa2 = class(TfPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtQtdeThreads: TEdit;
    edtIntervalo: TEdit;
    pgbTarefa: TProgressBar;
    btnExecutar: TButton;
    GroupBox1: TGroupBox;
    mmLog: TMemo;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FListExec: TList;
    procedure LimpaListaExecucao;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TTarefa }

constructor TTarefa.Create(AMaxIntervalo: Integer; AMemo: TMemo; AProgressBar: TProgressBar);
begin
  inherited Create(False);
  Self.FreeOnTerminate := True;

  FProgressBar := AProgressBar;
  FMemo := AMemo;
  FMaxIntervalo := AMaxIntervalo;

  FNomeInstancia := Self.ThreadID.ToString + ' - Iniciando processamento';
  FPosicao := 0;
end;

procedure TTarefa.Execute;
var
  I: Integer;
  lInterv: Integer;
begin
  inherited;
  while not Terminated do
  begin
    for I := 0 to 100 do
    begin
      FPosicao := I;
      lInterv := Random(FMaxIntervalo);
      Self.Synchronize(Sincronizar);
      Sleep(lInterv);
      if Terminated then
        Break;
    end;
    FPosicao := 0;
    FNomeInstancia := Self.ThreadID.ToString + ' - Processamento finalizado';
    Self.Synchronize(Sincronizar);
    Terminate;
  end;
end;

procedure TTarefa.Sincronizar;
begin
  if FNomeInstancia <> EmptyStr then
    FMemo.Lines.Add(FNomeInstancia);

  FProgressBar.Position := FPosicao;

  FNomeInstancia := EmptyStr;
end;

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
var
  I: Integer;
  lTarefa: TTarefa;
begin
  mmLog.Lines.Clear;
  LimpaListaExecucao;
  for I := 0 to StrToIntDef(edtQtdeThreads.Text, 0) - 1 do
  begin
    lTarefa := TTarefa.Create(StrToIntDef(edtIntervalo.Text, 0), mmLog, pgbTarefa);
    FListExec.Add(lTarefa);
  end;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FListExec.Count > 0 then
    LimpaListaExecucao;

  FreeAndNil(FListExec);
  inherited;
end;

procedure TfTarefa2.FormCreate(Sender: TObject);
begin
  inherited;
  FListExec := TList.Create;
end;

procedure TfTarefa2.LimpaListaExecucao;
var
  I: Integer;
  Item: TTarefa;
begin
  for I := FListExec.Count - 1 downto 0 do
  begin
    Item := TTarefa(FListExec.Items[I]);
    if (Item <> nil) and (not Item.Terminated) then
      Item.Terminate;
  end;
  FListExec.Clear;
end;

initialization

RegisterClass(TfTarefa2);

end.
