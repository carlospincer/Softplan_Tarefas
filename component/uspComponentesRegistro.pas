unit uspComponentesRegistro;

interface

uses
  System.SysUtils, System.Classes, uspQuery;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

end.
