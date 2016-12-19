object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 356
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 8
    Top = 147
    Width = 89
    Height = 25
    Caption = #1048#1089#1082#1072#1090#1100' '#1092#1072#1081#1083#1099
    TabOrder = 0
    OnClick = Button1Click
  end
  object JvIPAddress1: TJvIPAddress
    Left = 395
    Top = 77
    Width = 150
    Height = 21
    Address = 167776555
    ParentColor = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 134
    Top = 147
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object JvDirectoryEdit1: TJvDirectoryEdit
    Left = 8
    Top = 104
    Width = 201
    Height = 21
    DialogKind = dkWin32
    InitialDir = 'C:\'
    TabOrder = 3
    Text = #1091#1082#1072#1078#1080#1090#1077' '#1087#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' gaia'
  end
  object ListBox1: TListBox
    Left = 224
    Top = 104
    Width = 777
    Height = 97
    ItemHeight = 13
    TabOrder = 4
  end
  object ListBox2: TListBox
    Left = 224
    Top = 207
    Width = 236
    Height = 97
    ItemHeight = 13
    TabOrder = 5
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 256
    Top = 56
  end
end
