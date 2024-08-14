unit U_formulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Buttons,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBQuery, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBasic,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Black, dxSkinOffice2019Colorful,
  dxSkinOffice2019DarkGray, dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDBEdit;

type
  Tfrm_principal = class(TForm)
    pnl_cabecalho: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnl_rodape: TPanel;
    Image1: TImage;
    Shape1: TShape;
    pnl_menu: TPanel;
    pnl_paciente: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    pnl_consulta: TPanel;
    DBGrid1: TDBGrid;
    btn_excluir: TBitBtn;
    btn_novo: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_gravar: TBitBtn;
    btn_imprimir: TBitBtn;
    edt_buscar: TEdit;
    btn_pesquisar: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    db_formulario: TIBDatabase;
    conexao: TIBTransaction;
    ds_formulario: TDataSource;
    q_formulario: TIBQuery;
    q_formularioID: TIntegerField;
    q_formularioNOME: TIBStringField;
    q_formularioCPF: TIBStringField;
    q_formularioDATA_AVALIACAO: TDateField;
    q_formularioIDADE: TIntegerField;
    q_formularioSEXO: TIBStringField;
    q_formularioPATOLOGIAS: TIBStringField;
    q_formularioDIAGNOSTICO: TIBStringField;
    q_formularioOBSERVACAO: TIBStringField;
    q_formularioENDERECO_ID: TIntegerField;
    q_formularioCELULAR: TIBStringField;
    edt_nome: TDBEdit;
    msk_cpf: TcxDBMaskEdit;
    edt_idade: TDBEdit;
    chk_fem: TDBCheckBox;
    chk_masc: TDBCheckBox;
    msk_celular: TcxDBMaskEdit;
    msk_data: TcxDBMaskEdit;
    edt_logradouro: TDBEdit;
    edt_num: TDBEdit;
    edt_bairro: TDBEdit;
    edt_cidade: TDBEdit;
    edt_estado: TDBEdit;
    mem_diag: TDBMemo;
    mem_obs: TDBMemo;
    edt_id: TDBEdit;
    mem_pat: TDBMemo;
    dst_paciente: TIBDataSet;
    dst_endereco: TIBDataSet;
    procedure Image1Click(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure chk_femininoClick(Sender: TObject);
    procedure chk_masculinoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dst_pacienteAfterOpen(DataSet: TDataSet);
    procedure dst_pacienteAfterClose(DataSet: TDataSet);
    procedure dst_enderecoBeforePost(DataSet: TDataSet);

  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation

{$R *.dfm}


procedure Tfrm_principal.btn_cancelarClick(Sender: TObject);
var
  limparForm : Integer;
begin
  // Visibilidade do panel de consulta ao clicar
  pnl_paciente.Visible := False;
  pnl_consulta.Visible := True;
  // Limpar form
  for limparForm := 0 to ComponentCount - 1 do
  begin
    if Components[limparForm] is TEdit then
      TEdit(Components[limparForm]).Text := ''
    else if Components[limparForm] is TMemo then
      TMemo(Components[limparForm]).Lines.Clear
    else if Components[limparForm] is TCheckBox then
      TCheckBox(Components[limparForm]).Checked := False;
  end;
end;

procedure Tfrm_principal.btn_novoClick(Sender: TObject);
begin
  // Visibilidade do panel de novo ao clicar
  pnl_paciente.Visible := True;
  pnl_consulta.Visible := False;

  //dst_formulario.Append;

end;

procedure Tfrm_principal.chk_femininoClick(Sender: TObject);
begin
  // Faz checagem sem possibilidade de check ambos
  chk_masc.Checked := not chk_fem.Checked;

end;

procedure Tfrm_principal.chk_masculinoClick(Sender: TObject);
begin
  chk_fem.Checked := not chk_masc.Checked;
end;

procedure Tfrm_principal.dst_enderecoBeforePost(DataSet: TDataSet);
begin
  if dst_paciente.State in [dsInsert, dsEdit] then
  begin
    dst_paciente.Post;
  end;

  //dst_enderecoID.AsInteger := dst_pacienteID.AsInteger;
end;

procedure Tfrm_principal.dst_pacienteAfterClose(DataSet: TDataSet);
begin
  dst_endereco.Close;
end;

procedure Tfrm_principal.dst_pacienteAfterOpen(DataSet: TDataSet);
begin
  dst_endereco.Close;

  dst_endereco.Params[0].AsInteger := dst_paciente.FieldByName('ID').Value;

  dst_endereco.Open;
end;

procedure Tfrm_principal.FormShow(Sender: TObject);
begin
  dst_paciente.Open;
  dst_endereco.Open;
end;

procedure Tfrm_principal.Image1Click(Sender: TObject);
begin
  // Fecha o sistema ao clicar na imagem 'fechar'
  Application.Terminate;
end;

end.
