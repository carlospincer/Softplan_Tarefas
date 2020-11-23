inherited fTarefa2: TfTarefa2
  Caption = 'fTarefa2'
  ClientHeight = 344
  ClientWidth = 552
  OnCreate = FormCreate
  ExplicitWidth = 558
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 546
    Height = 62
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 66
      Height = 13
      Caption = 'Qtde Threads'
    end
    object Label2: TLabel
      Left = 104
      Top = 5
      Width = 151
      Height = 13
      Caption = 'Intervalo Maximo Milissegundos'
    end
    object edtQtdeThreads: TEdit
      Left = 16
      Top = 24
      Width = 66
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 0
      Text = '1'
    end
    object edtIntervalo: TEdit
      Left = 104
      Top = 24
      Width = 151
      Height = 21
      Alignment = taRightJustify
      NumbersOnly = True
      TabOrder = 1
      Text = '1000'
    end
    object btnExecutar: TButton
      Left = 465
      Top = 22
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 2
      OnClick = btnExecutarClick
    end
  end
  object pgbTarefa: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 312
    Width = 546
    Height = 25
    Margins.Top = 0
    Margins.Bottom = 7
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 252
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 71
    Width = 546
    Height = 238
    Align = alClient
    Caption = 'Log'
    TabOrder = 2
    ExplicitLeft = 1
    ExplicitTop = 53
    ExplicitWidth = 544
    ExplicitHeight = 192
    object mmLog: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 536
      Height = 215
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 534
      ExplicitHeight = 169
    end
  end
end
