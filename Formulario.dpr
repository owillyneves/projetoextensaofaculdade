program Formulario;

uses
  Vcl.Forms,
  U_formulario in 'U_formulario.pas' {frm_principal},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.Run;
end.
