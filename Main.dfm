object FormFastReportInvoiceBot: TFormFastReportInvoiceBot
  Left = 0
  Top = 0
  Caption = 'FormFastReportInvoiceBot'
  ClientHeight = 359
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 56
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Start Bot'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 200
    Top = 16
    Width = 289
    Height = 321
    Lines.Strings = (
      'Log')
    TabOrder = 1
  end
  object TableInvoice: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'Logo'
        DataType = ftBlob
      end
      item
        Name = 'InvoiceFrom'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Date'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Payment_Terms'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'Due_Date'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PO_Number'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Bill_To'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Ship_To'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'Notes'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'Terms'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'Subtotal'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end
      item
        Name = 'Tax'
        DataType = ftFloat
      end
      item
        Name = 'Shipping'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'Amount_Paid'
        DataType = ftFloat
      end
      item
        Name = 'Balance_Due'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 32
    Top = 280
    Content = {
      414442530F0000006B090000FF00010001FF02FF030400180000005400610062
      006C00650049006E0076006F006900630065000500180000005400610062006C
      00650049006E0076006F00690063006500060000000000070000080032000000
      090000FF0AFF0B040014000000490044005F0049006E0076006F006900630065
      00050014000000490044005F0049006E0076006F006900630065000C00010000
      000E000D000F0001100001110001120001130001140001150014000000490044
      005F0049006E0076006F00690063006500FEFF0B0400080000004C006F006700
      6F000500080000004C006F0067006F000C00020000000E0016000F0001100001
      1700011100011200011300011400011500080000004C006F0067006F00FEFF0B
      04001600000049006E0076006F00690063006500460072006F006D0005001600
      000049006E0076006F00690063006500460072006F006D000C00030000000E00
      18001900F40100000F0001100001110001120001130001140001150016000000
      49006E0076006F00690063006500460072006F006D001A00F4010000FEFF0B04
      0008000000440061007400650005000800000044006100740065000C00040000
      000E0018001900640000000F0001100001110001120001130001140001150008
      00000044006100740065001A0064000000FEFF0B04001A000000500061007900
      6D0065006E0074005F005400650072006D00730005001A000000500061007900
      6D0065006E0074005F005400650072006D0073000C00050000000E0018001900
      900100000F000110000111000112000113000114000115001A00000050006100
      79006D0065006E0074005F005400650072006D0073001A0090010000FEFF0B04
      00100000004400750065005F0044006100740065000500100000004400750065
      005F0044006100740065000C00060000000E0018001900640000000F00011000
      011100011200011300011400011500100000004400750065005F004400610074
      0065001A0064000000FEFF0B04001200000050004F005F004E0075006D006200
      6500720005001200000050004F005F004E0075006D006200650072000C000700
      00000E0018001900C80000000F00011000011100011200011300011400011500
      1200000050004F005F004E0075006D006200650072001A00C8000000FEFF0B04
      000E000000420069006C006C005F0054006F0005000E000000420069006C006C
      005F0054006F000C00080000000E0018001900F40100000F0001100001110001
      12000113000114000115000E000000420069006C006C005F0054006F001A00F4
      010000FEFF0B04000E00000053006800690070005F0054006F0005000E000000
      53006800690070005F0054006F000C00090000000E0018001900F40100000F00
      0110000111000112000113000114000115000E00000053006800690070005F00
      54006F001A00F4010000FEFF0B04000A0000004E006F0074006500730005000A
      0000004E006F007400650073000C000A0000000E0018001900E80300000F0001
      10000111000112000113000114000115000A0000004E006F007400650073001A
      00E8030000FEFF0B04000A0000005400650072006D00730005000A0000005400
      650072006D0073000C000B0000000E0018001900E80300000F00011000011100
      0112000113000114000115000A0000005400650072006D0073001A00E8030000
      FEFF0B04001000000053007500620074006F00740061006C0005001000000053
      007500620074006F00740061006C000C000C0000000E001B000F000110000111
      000112000113000114000115001000000053007500620074006F00740061006C
      00FEFF0B04001000000044006900730063006F0075006E007400050010000000
      44006900730063006F0075006E0074000C000D0000000E001B000F0001100001
      11000112000113000114000115001000000044006900730063006F0075006E00
      7400FEFF0B0400060000005400610078000500060000005400610078000C000E
      0000000E001B000F000110000111000112000113000114000115000600000054
      0061007800FEFF0B0400100000005300680069007000700069006E0067000500
      100000005300680069007000700069006E0067000C000F0000000E001B000F00
      0110000111000112000113000114000115001000000053006800690070007000
      69006E006700FEFF0B04000A00000054006F00740061006C0005000A00000054
      006F00740061006C000C00100000000E001B000F000110000111000112000113
      000114000115000A00000054006F00740061006C00FEFF0B0400160000004100
      6D006F0075006E0074005F00500061006900640005001600000041006D006F00
      75006E0074005F0050006100690064000C00110000000E001B000F0001100001
      11000112000113000114000115001600000041006D006F0075006E0074005F00
      5000610069006400FEFF0B040016000000420061006C0061006E00630065005F
      00440075006500050016000000420061006C0061006E00630065005F00440075
      0065000C00120000000E001B000F000110000111000112000113000114000115
      0016000000420061006C0061006E00630065005F00440075006500FEFEFF1CFE
      FF1DFEFF1EFF1F20000000000022002100FF2300000C00000002001000000046
      617374205265706F727420496E632E03000A00000030312E31302E3230323104
      001D00000042414E4B925320444F43554D454E5441525920434F4C4C45435449
      4F4E05000A00000030312E31302E323032310600080000003133343235323335
      0700400000004126522041646D696E6973747261746F722773204E616D65202D
      20446566204A616D204163636F756E74696E67202D20436974792C2053746174
      652C205A69700800400000004126522041646D696E6973747261746F72277320
      4E616D65202D20446566204A616D204163636F756E74696E67202D2043697479
      2C2053746174652C205A69700900340000004E6F746573202D20616E79207265
      6C6576616E7420696E666F726D6174696F6E206E6F7420616C72656164792063
      6F76657265640A00440000005465726D7320616E6420636F6E646974696F6E73
      202D206C61746520666565732C207061796D656E74206D6574686F64732C2064
      656C6976657279207363686564756C650B0000000000000000000C0000000000
      000024400D0000000000000024400E0000000000000014400F00000000000000
      00001000000000000000244011000000000000000000FEFEFEFEFEFF24FEFF25
      260006000000FF27FEFEFE0E004D0061006E0061006700650072001E00550070
      0064006100740065007300520065006700690073007400720079001200540061
      0062006C0065004C006900730074000A005400610062006C00650008004E0061
      006D006500140053006F0075007200630065004E0061006D0065000A00540061
      00620049004400240045006E0066006F0072006300650043006F006E00730074
      007200610069006E00740073001E004D0069006E0069006D0075006D00430061
      00700061006300690074007900180043006800650063006B004E006F0074004E
      0075006C006C00140043006F006C0075006D006E004C006900730074000C0043
      006F006C0075006D006E00100053006F007500720063006500490044000E0064
      00740049006E0074003300320010004400610074006100540079007000650014
      00530065006100720063006800610062006C006500120041006C006C006F0077
      004E0075006C006C000800420061007300650014004F0041006C006C006F0077
      004E0075006C006C0012004F0049006E0055007000640061007400650010004F
      0049006E00570068006500720065001A004F0072006900670069006E0043006F
      006C004E0061006D0065000C006400740042006C006F006200100042006C006F
      006200440061007400610018006400740041006E007300690053007400720069
      006E0067000800530069007A006500140053006F007500720063006500530069
      007A00650010006400740044006F00750062006C0065001C0043006F006E0073
      0074007200610069006E0074004C00690073007400100056006900650077004C
      006900730074000E0052006F0077004C00690073007400060052006F0077000A
      0052006F0077004900440016007200730055006E006300680061006E00670065
      0064001A0052006F0077005000720069006F0072005300740061007400650010
      004F0072006900670069006E0061006C001800520065006C006100740069006F
      006E004C006900730074001C0055007000640061007400650073004A006F0075
      0072006E0061006C001200530061007600650050006F0069006E0074000E0043
      00680061006E00670065007300}
    object TableInvoiceID_Invoice: TIntegerField
      FieldName = 'ID_Invoice'
    end
    object TableInvoiceLogo: TGraphicField
      FieldName = 'Logo'
      BlobType = ftGraphic
    end
    object TableInvoiceInvoiceFrom: TStringField
      FieldName = 'InvoiceFrom'
      Size = 500
    end
    object TableInvoiceDate: TStringField
      FieldName = 'Date'
      Size = 100
    end
    object TableInvoicePayment_Terms: TStringField
      FieldName = 'Payment_Terms'
      Size = 400
    end
    object TableInvoiceDue_Date: TStringField
      FieldName = 'Due_Date'
      Size = 100
    end
    object TableInvoicePO_Number: TStringField
      FieldName = 'PO_Number'
      Size = 200
    end
    object TableInvoiceBill_To: TStringField
      FieldName = 'Bill_To'
      Size = 500
    end
    object TableInvoiceShip_To: TStringField
      FieldName = 'Ship_To'
      Size = 500
    end
    object TableInvoiceNotes: TStringField
      FieldName = 'Notes'
      Size = 1000
    end
    object TableInvoiceTerms: TStringField
      FieldName = 'Terms'
      Size = 1000
    end
    object TableInvoiceSubtotal: TFloatField
      FieldName = 'Subtotal'
    end
    object TableInvoiceDiscount: TFloatField
      FieldName = 'Discount'
    end
    object TableInvoiceTax: TFloatField
      FieldName = 'Tax'
    end
    object TableInvoiceShipping: TFloatField
      FieldName = 'Shipping'
    end
    object TableInvoiceTotal: TFloatField
      FieldName = 'Total'
    end
    object TableInvoiceAmount_Paid: TFloatField
      FieldName = 'Amount_Paid'
    end
    object TableInvoiceBalance_Due: TFloatField
      FieldName = 'Balance_Due'
    end
  end
  object TableItems: TFDMemTable
    Active = True
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'ID_Invoice'
    MasterSource = DataSource1
    MasterFields = 'ID_Invoice'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 120
    Top = 280
    Content = {
      414442530F000000A7020000FF00010001FF02FF030400140000005400610062
      006C0065004900740065006D0073000500140000005400610062006C00650049
      00740065006D007300060000000000070000080032000000090000FF0AFF0B04
      0014000000490044005F0049006E0076006F0069006300650005001400000049
      0044005F0049006E0076006F006900630065000C00010000000E000D000F0001
      100001110001120001130001140001150014000000490044005F0049006E0076
      006F00690063006500FEFF0B0400160000004400650073006300720069007000
      740069006F006E00050016000000440065007300630072006900700074006900
      6F006E000C00020000000E0016001700F40100000F0001100001110001120001
      1300011400011500160000004400650073006300720069007000740069006F00
      6E001800F4010000FEFF0B0400100000005100750061006E0074006900740079
      000500100000005100750061006E0074006900740079000C00030000000E000D
      000F00011000011100011200011300011400011500100000005100750061006E
      007400690074007900FEFF0B0400080000005200610074006500050008000000
      52006100740065000C00040000000E0019000F00011000011100011200011300
      011400011500080000005200610074006500FEFEFF1AFEFF1BFEFF1CFF1D1E00
      00000000FF1F00000C000000010024000000466173745265706F72742056434C
      2032303231205374616E646172642045646974696F6E02000200000003000000
      000000B07240FEFEFF1D1E0001000000FF1F00000C0000000100240000004661
      73745265706F727420464D582032303231205374616E64617264204564697469
      6F6E02000100000003000000000000B07240FEFEFEFEFEFF20FEFF2122000400
      0000FF23FEFEFE0E004D0061006E0061006700650072001E0055007000640061
      007400650073005200650067006900730074007200790012005400610062006C
      0065004C006900730074000A005400610062006C00650008004E0061006D0065
      00140053006F0075007200630065004E0061006D0065000A0054006100620049
      004400240045006E0066006F0072006300650043006F006E0073007400720061
      0069006E00740073001E004D0069006E0069006D0075006D0043006100700061
      006300690074007900180043006800650063006B004E006F0074004E0075006C
      006C00140043006F006C0075006D006E004C006900730074000C0043006F006C
      0075006D006E00100053006F007500720063006500490044000E006400740049
      006E007400330032001000440061007400610054007900700065001400530065
      006100720063006800610062006C006500120041006C006C006F0077004E0075
      006C006C000800420061007300650014004F0041006C006C006F0077004E0075
      006C006C0012004F0049006E0055007000640061007400650010004F0049006E
      00570068006500720065001A004F0072006900670069006E0043006F006C004E
      0061006D00650018006400740041006E007300690053007400720069006E0067
      000800530069007A006500140053006F007500720063006500530069007A0065
      0010006400740044006F00750062006C0065001C0043006F006E007300740072
      00610069006E0074004C00690073007400100056006900650077004C00690073
      0074000E0052006F0077004C00690073007400060052006F0077000A0052006F
      0077004900440010004F0072006900670069006E0061006C001800520065006C
      006100740069006F006E004C006900730074001C005500700064006100740065
      0073004A006F00750072006E0061006C001200530061007600650050006F0069
      006E0074000E004300680061006E00670065007300}
    object TableItemsID_Invoice: TIntegerField
      FieldName = 'ID_Invoice'
    end
    object TableItemsDescription: TStringField
      FieldName = 'Description'
      Size = 500
    end
    object TableItemsQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object TableItemsRate: TFloatField
      FieldName = 'Rate'
    end
  end
  object DataSource1: TDataSource
    DataSet = TableInvoice
    Left = 72
    Top = 216
  end
  object frxReport1: TfrxReport
    Tag = 21650
    Version = '2021.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44482.760868182900000000
    ReportOptions.LastChange = 44509.913152523100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportAbstractOnReportPrint'
    Left = 32
    Top = 40
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'InvoiceDB'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'Invoice_Items'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      VGuides.Strings = (
        '16,00'
        '546,67'
        '561,55047'
        '705,56765')
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Color = clGrayText
      Frame.Typ = []
      LargeDesignHeight = True
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 115.314230000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 546.670000000000000000
          Top = 11.338590000000000000
          Width = 170.078850000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'INVOICE')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 23.559060000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 98.267780000000000000
          DataField = 'Logo'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Frame.Typ = []
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 546.670000000000000000
          Top = 75.590600000000000000
          Width = 170.078850000000000000
          Height = 34.015770000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."ID_Invoice"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 226.771800000000000000
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxDBDataset1
        DataSetName = 'InvoiceDB'
        RowCount = 0
        Stretched = True
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 58.621280000000000000
          Width = 340.157700000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataField = 'InvoiceFrom'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InvoiceDB."InvoiceFrom"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 22.677165350000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Bill To')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 227.283000000000000000
          Top = 102.047310000000000000
          Width = 94.488250000000000000
          Height = 22.677165350000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Ship To')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 139.842610000000000000
          Width = 181.417322830000000000
          Height = 71.811070000000000000
          StretchMode = smActualHeight
          DataField = 'Bill_To'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InvoiceDB."Bill_To"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 208.385350000000000000
          Top = 139.842610000000000000
          Width = 181.417440000000000000
          Height = 79.370130000000000000
          StretchMode = smActualHeight
          DataField = 'Ship_To'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InvoiceDB."Ship_To"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 468.968700000000000000
          Top = 60.472480000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Date:')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 60.472480000000000000
          Width = 144.017180000000000000
          Height = 18.897650000000000000
          DataField = 'Date'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."Date"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 404.716690000000000000
          Top = 100.118980000000000000
          Width = 139.842610000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Payment Terms:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 100.118980000000000000
          Width = 144.017180000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'Payment_Terms'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."Payment_Terms"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 450.071050000000000000
          Top = 145.473340000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Due Date:')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 145.473340000000000000
          Width = 144.017180000000000000
          Height = 18.897650000000000000
          DataField = 'Due_Date'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."Due_Date"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 440.843160000000000000
          Top = 179.489110000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PO Number:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 179.489110000000000000
          Width = 144.017180000000000000
          Height = 18.897650000000000000
          DataField = 'PO_Number'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."PO_Number"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 406.827390000000000000
          Top = 136.063080000000000000
          Width = 298.740260000000000000
          Frame.Typ = []
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 1080.945580000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 572.889060000000000000
          Width = 145.221640000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page] of [TotalPages#]')
          Formats = <
            item
            end
            item
            end>
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
          Fill.BackColor = clMaroon
          Frame.Color = clGrayText
          Frame.Typ = []
          Shape = skRoundRectangle
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 45.354360000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 340.157700000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantity')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 452.181750000000000000
          Top = 45.354360000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Rate')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 577.063630000000000000
          Top = 45.354360000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Amount')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 7.559060000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, DetailD' +
              'ata1) '
            
              '- (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1)/100 * <InvoiceDB."Discount">) )'
            
              '+ (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1) '
            
              '- (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1)/100 * <InvoiceDB."Discount">) )/100*<InvoiceDB."Tax">  '
            '+ <InvoiceDB."Shipping"> - <InvoiceDB."Amount_Paid"> ] $')
          ParentFont = False
          Processing.ProcessAt = paDataFinished
        end
        object InvoiceDBBalance_Due: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 437.063630000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Balance_Due :')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 215.433210000000000000
        Top = 597.165740000000000000
        Width = 718.110700000000000000
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 26.456710000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Subtotal:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 26.456710000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, DetailDa' +
              'ta1)] $')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 90.708720000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Tax ([InvoiceDB."Tax"]%):')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 86.929190000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[ (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1) '
            
              '- (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1)/100 * <InvoiceDB."Discount">) )/100*<InvoiceDB."Tax">  ] ' +
              '$')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 60.472480000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Discount ([InvoiceDB."Discount"]%):')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 56.692950000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, DetailD' +
              'ata1)/100 * <InvoiceDB."Discount">) ] $')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 120.944960000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Shipping :')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 120.944960000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."Shipping"] $')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 154.960730000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 154.960730000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, DetailD' +
              'ata1) '
            
              '- (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1)/100 * <InvoiceDB."Discount">) )'
            
              '+ (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1) '
            
              '- (Sum(<Invoice_Items."Quantity">*<Invoice_Items."Rate">, Detail' +
              'Data1)/100 * <InvoiceDB."Discount">) )/100*<InvoiceDB."Tax">  '
            '+ <InvoiceDB."Shipping">] $')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 425.725040000000000000
          Top = 185.196970000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Amount Paid:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 185.196970000000000000
          Width = 144.017180000000000000
          Height = 22.677180000000000000
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[InvoiceDB."Amount_Paid"] $')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 83.149660000000000000
        Top = 835.276130000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'InvoiceDB'
        RowCount = 0
        Stretched = True
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Notes:')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 45.354360000000000000
          Width = 689.567650000000000000
          Height = 37.795300000000000000
          StretchMode = smActualHeight
          DataField = 'Notes'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InvoiceDB."Notes"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'Invoice_Items'
        RowCount = 0
        Stretched = True
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 7.559060000000000000
          Width = 321.260050000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          DataField = 'Description'
          DataSet = frxDBDataset2
          DataSetName = 'Invoice_Items'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Invoice_Items."Description"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 336.140520000000000000
          Top = 7.559060000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDataset2
          DataSetName = 'Invoice_Items'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Invoice_Items."Quantity"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 452.181750000000000000
          Top = 7.559060000000000000
          Width = 94.488250000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDataset2
          DataSetName = 'Invoice_Items'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Invoice_Items."Rate"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 561.550470000000000000
          Top = 7.559060000000000000
          Width = 144.017180000000000000
          Height = 26.456710000000000000
          DataSet = frxDBDataset2
          DataSetName = 'Invoice_Items'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<Invoice_Items."Quantity">*<Invoice_Items."Rate">] $')
          ParentFont = False
        end
      end
      object MasterData5: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 79.370130000000000000
        Top = 941.102970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'InvoiceDB'
        RowCount = 0
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 18.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Terms:')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 45.354360000000000000
          Width = 689.567650000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          DataField = 'Terms'
          DataSet = frxDBDataset1
          DataSetName = 'InvoiceDB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[InvoiceDB."Terms"]')
          ParentFont = False
        end
      end
    end
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 32
    Top = 104
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'InvoiceDB'
    CloseDataSource = False
    DataSet = TableInvoice
    BCDToCurrency = False
    DataSetOptions = []
    Left = 120
    Top = 40
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'Invoice_Items'
    CloseDataSource = False
    DataSet = TableItems
    BCDToCurrency = False
    DataSetOptions = []
    Left = 120
    Top = 104
  end
end
