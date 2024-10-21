object Form1: TForm1
  Left = 178
  Top = 177
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 464
    Top = 21
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 194
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 649
    Height = 16
    TabOrder = 1
  end
  object Button2: TButton
    Left = 8
    Top = 64
    Width = 194
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081
    TabOrder = 2
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 95
    Width = 649
    Height = 105
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 304
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 488
    Top = 366
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 5
    OnClick = Button3Click
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 366
    Width = 185
    Height = 121
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 224
    Width = 648
    Height = 120
    DataSource = DataSource2
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.txt'
    FileName = 'atc'
    Filter = '*.txt'
    InitialDir = 'd:\atc'
    Left = 216
    Top = 8
  end
  object Table1: TTable
    TableType = ttDBase
    Left = 352
    Top = 368
  end
  object DataSource1: TDataSource
    DataSet = RxQuery1
    Left = 224
    Top = 368
  end
  object RxQuery1: TRxQuery
    Active = True
    DatabaseName = 'atc'
    SQL.Strings = (
      
        'SELECT Atc."Index", Atc."Date", Atc."Time", TimeR, Nom, NomPr, L' +
        'ine, Telefon'
      'FROM "atc.DBF" Atc'
      'WHERE  Nom = '#39'201'#39' ')
    Macros = <>
    Left = 224
    Top = 424
  end
  object DataSource2: TDataSource
    DataSet = Table2
    Left = 264
    Top = 368
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'atc'
    TableName = 'TP.DBF'
    Left = 392
    Top = 368
  end
  object RxQuery2: TRxQuery
    DatabaseName = 'atc'
    Macros = <>
    Left = 264
    Top = 424
  end
  object DataSource3: TDataSource
    DataSet = RxQuery3
    Left = 304
    Top = 368
  end
  object RxQuery3: TRxQuery
    DatabaseName = 'atc'
    SQL.Strings = (
      'SELECT NAME, ABC, AB, INF, TEH, NAME1'
      'FROM "TP.dbf" Tp'
      'WHERE  (ABC = :abc)')
    Macros = <>
    Left = 304
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'abc'
        ParamType = ptUnknown
      end>
  end
  object Database1: TDatabase
    AliasName = 'ATC'
    Connected = True
    DatabaseName = 'ATC'
    SessionName = 'Default'
    Left = 432
    Top = 368
  end
end
