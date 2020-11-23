unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    fspCondicoes: TStringList;
    fspColunas: TStringList;
    fspTabelas: TStringList;
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure GeraSQL;
    destructor Destroy; override;
  published
    { Published declarations }
    property spCondicoes: TStringList read fspCondicoes write fspCondicoes;
    property spColunas: TStringList read fspColunas write fspColunas;
    property spTabelas: TStringList read fspTabelas write fspTabelas;
  end;

implementation

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited;
  fspCondicoes := TStringList.Create;
  fspColunas := TStringList.Create;
  fspTabelas := TStringList.Create;
end;

destructor TspQuery.Destroy;
begin
  FreeAndNil(fspCondicoes);
  FreeAndNil(fspColunas);
  FreeAndNil(fspTabelas);
  inherited;
end;

procedure TspQuery.GeraSQL;
var
  I: Integer;
begin
  SQL.Clear;
  if fspTabelas.Count <> 1 then
    raise Exception.Create('Quantidade de tabelas informada é inválida, Informe uma tabela');

  SQL.Add('SELECT ');
  for I := 0 to fspColunas.Count - 1 do
  begin
    if I = fspColunas.Count - 1 then
      SQL.Add('       ' + fspColunas.Strings[I])
    else
      SQL.Add('       ' + fspColunas.Strings[I] + ',');
  end;
  SQL.Add('  FROM ' + Trim(fspTabelas.Strings[0]));

  if fspCondicoes.Count > 0 then
  begin
    if Pos('WHERE', UpperCase(fspCondicoes.Text)) = 0 then
      SQL.Add(' WHERE ' + Trim(fspCondicoes.Text))
    else
      SQL.Add(Trim(fspCondicoes.Text));
  end;
end;

end.
