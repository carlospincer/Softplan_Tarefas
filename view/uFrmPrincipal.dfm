object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Softplan'
  ClientHeight = 574
  ClientWidth = 781
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mnTarefas
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object tbMDI: TToolBar
    Left = 0
    Top = 552
    Width = 781
    Height = 22
    Align = alBottom
    AutoSize = True
    ButtonWidth = 57
    Caption = 'tbMDI'
    TabOrder = 0
  end
  object mnTarefas: TMainMenu
    Left = 264
    Top = 48
    object arefa11: TMenuItem
      Caption = 'Tarefas'
      object TfTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = onAction
      end
      object TfTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = onAction
      end
      object TfTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = onAction
      end
    end
  end
end
