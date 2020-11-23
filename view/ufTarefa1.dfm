inherited fTarefa1: TfTarefa1
  Caption = 'fTarefa1'
  ClientHeight = 553
  ClientWidth = 780
  ExplicitWidth = 786
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 774
    Height = 547
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 770
    ExplicitHeight = 488
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 255
      Width = 766
      Height = 33
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 196
      ExplicitWidth = 762
      object btnGeraSQL: TButton
        AlignWithMargins = True
        Left = 687
        Top = 4
        Width = 75
        Height = 25
        Align = alRight
        Caption = 'GeraSQL'
        TabOrder = 0
        OnClick = btnGeraSQLClick
        ExplicitLeft = 683
      end
    end
    object GroupBox2: TGroupBox
      Left = 256
      Top = 1
      Width = 255
      Height = 251
      Align = alLeft
      Caption = 'Tabelas'
      TabOrder = 1
      ExplicitHeight = 192
      object mmTabelas: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 245
        Height = 228
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 169
      end
    end
    object GroupBox3: TGroupBox
      Left = 511
      Top = 1
      Width = 262
      Height = 251
      Align = alClient
      Caption = 'Condi'#231#245'es'
      TabOrder = 2
      ExplicitWidth = 258
      ExplicitHeight = 192
      object mmCondicoes: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 252
        Height = 228
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 248
        ExplicitHeight = 169
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 255
      Height = 251
      Align = alLeft
      Caption = 'Colunas'
      TabOrder = 3
      ExplicitHeight = 192
      object mmColunas: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 245
        Height = 228
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 169
      end
    end
    object GroupBox4: TGroupBox
      Left = 1
      Top = 291
      Width = 772
      Height = 255
      Align = alBottom
      Caption = 'SQL Gerado'
      TabOrder = 4
      ExplicitTop = 232
      ExplicitWidth = 768
      object mmSQL: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 762
        Height = 232
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 758
      end
    end
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 892
    Top = 427
  end
end
