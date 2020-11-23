program ProvaDelphiApp;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  ufPadrao in 'view\ufPadrao.pas' {fPadrao},
  ufTarefa1 in 'view\ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'view\ufTarefa2.pas' {fTarefa2},
  ufTarefa3 in 'view\ufTarefa3.pas' {fTarefa3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
