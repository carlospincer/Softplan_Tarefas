inherited fTarefa3: TfTarefa3
  Caption = 'fTarefa3'
  ClientHeight = 329
  ClientWidth = 567
  OnShow = FormShow
  ExplicitWidth = 573
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 232
    Width = 567
    Height = 97
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 423
      Top = 3
      Width = 44
      Height = 13
      Caption = 'Total R$:'
    end
    object Label2: TLabel
      Left = 423
      Top = 47
      Width = 85
      Height = 13
      Caption = 'Total divis'#245'es R$:'
    end
    object edtTotal: TEdit
      Left = 423
      Top = 18
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      Text = '0,00'
    end
    object edtTotalDiv: TEdit
      Left = 423
      Top = 62
      Width = 121
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      Text = '0,00'
    end
    object btnTotal: TButton
      Left = 328
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Obter Total'
      TabOrder = 2
      OnClick = btnTotalClick
    end
    object btnTotalDiv: TButton
      Left = 296
      Top = 59
      Width = 107
      Height = 25
      Caption = 'Obter Total Divis'#245'es'
      TabOrder = 3
      OnClick = btnTotalDivClick
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 561
    Height = 226
    Align = alClient
    TabOrder = 0
    object gridDados: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 553
      Height = 218
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'IDProjeto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeProjeto'
          Width = 331
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor'
          Width = 119
          Visible = True
        end>
    end
  end
end
