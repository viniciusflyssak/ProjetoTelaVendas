object frmPrincipal: TfrmPrincipal
  Left = 336
  Top = 83
  Caption = 'Tela de Vendas'
  ClientHeight = 657
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPedidoEditarCancelar: TPanel
    Left = 312
    Top = 292
    Width = 273
    Height = 53
    TabOrder = 1
    object lblPedidoEditarCancelar: TLabel
      Left = 8
      Top = 12
      Width = 184
      Height = 23
      Caption = 'N'#250'mero do pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnDblClick = btnSelecionarClick
    end
    object edtNumeroPedido: TEdit
      Left = 198
      Top = 8
      Width = 65
      Height = 37
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      OnExit = edtNumeroPedidoExit
      OnKeyPress = edtNumeroPedidoKeyPress
    end
  end
  object pnlPesquisa: TPanel
    Left = 262
    Top = 192
    Width = 353
    Height = 273
    TabOrder = 2
    object lblPesquisa: TLabel
      Left = 8
      Top = 3
      Width = 239
      Height = 25
      Caption = 'Produtos encontrados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSelecionar: TSpeedButton
      Left = 232
      Top = 239
      Width = 113
      Height = 26
      Caption = 'Selecionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnSelecionarClick
    end
    object btnCancelar: TSpeedButton
      Left = 8
      Top = 239
      Width = 113
      Height = 26
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarClick
    end
    object dbgPesquisaProduto: TDBGrid
      Left = 8
      Top = 32
      Width = 337
      Height = 201
      DataSource = dtsPesquisa
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = btnSelecionarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PRECO'
          ReadOnly = True
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end>
    end
    object dbgPesquisaCliente: TDBGrid
      Left = 8
      Top = 32
      Width = 337
      Height = 201
      DataSource = dtsPesquisa
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = btnSelecionarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_CLIENTE'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_CLIENTE'
          ReadOnly = True
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Title.Caption = 'Cidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF'
          Visible = True
        end>
    end
  end
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 657
    Align = alClient
    TabOrder = 0
    object lblProduto: TLabel
      Left = 638
      Top = 129
      Width = 119
      Height = 33
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblQuantidade: TLabel
      Left = 638
      Top = 214
      Width = 166
      Height = 33
      Caption = 'Quantidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValor: TLabel
      Left = 638
      Top = 292
      Width = 81
      Height = 33
      Caption = 'Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnGravar: TSpeedButton
      Left = 638
      Top = 552
      Width = 225
      Height = 57
      Caption = 'Gravar Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnGravarClick
    end
    object lblPedido: TLabel
      Left = 392
      Top = 132
      Width = 103
      Height = 33
      Caption = 'Pedido:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPesquisaProduto: TSpeedButton
      Left = 869
      Top = 168
      Width = 34
      Height = 31
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C01E0000C01E00000000000000000000000000020590
        0004950104900000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000989898989898989898000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000090E912849CE1E4FFF0110C001048E00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000009D9D9DB9B9B9C1C1C1A4A4A49797
        9700000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000009129DCBEBFF
        5F97FF1E4FFF0110C001048E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000A0A0A0F3F3F3D6D6D6C1C1C1A4A4A4979797000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000002048F3557D5D9F0FF5F97FF1E4FFF0110C001048E00
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000989898BFBFBFF6F6F6D6D6D6C1C1
        C1A4A4A497979700000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000009502038C
        375DDAD9F0FF5F97FF1E4FFF0110C001048E0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000989898979797C2C2C2F6F6F6D6D6D6C1C1C1A4A4A4979797000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000009501038C3B64E0D9F0FF5F97FF1E4FFF01
        10C001048E000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000989898969696C4C4C4F6F6
        F6D6D6D6C1C1C1A4A4A497979700000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009501038B3E68E3D9F0FF5F97FF1E4FFF0110C001048E0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000989898969696C6C6C6F6F6F6D6D6D6C1C1C1A4A4A4979797
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000007501038A416DE7D9F0FF5F
        97FF1E4FFF0110C001038F000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000008F8F8F9696
        96C8C8C8F6F6F6D6D6D6C1C1C1A4A4A497979700000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000008101038A4374EDD9F0FF5F97FF1535A90403090503030000
        0000000003010105020205020205020200000000000000000000000000000000
        0000000000000000000000000000929292969696CACACAF6F6F6D6D6D6A9A9A9
        6D6D6D6B6B6B6464646464646868686969696A6A6A6969696464646464640000
        0000000000000000000000000000000000000000000000000000008701038A44
        77EF88ABC5131118573535070303050303281111411C1C4C20204C20203D1A1A
        200D0D0603030402020000000000000000000000000000000000000000000000
        00949494969696CBCBCBD4D4D47B7B7B9E9E9E6C6C6C6B6B6B8282828F8F8F93
        93939393938C8C8C7D7D7D6B6B6B696969000000000000000000000000000000
        00000000000000000000000000007F01038708080EC9C7C71915152611114F24
        247946469F6868C18989C99696BB8F8F916666562B2B180B0B06020200000000
        0000000000000000000000000000000000000000929292959595737373E5E5E5
        7E7E7E818181969696AEAEAEC2C2C2D3D3D3D9D9D9D3D3D3BDBDBD9B9B9B7979
        796B6B6B00000000000000000000000000000000000000000000000000000000
        0000030202221F1F311E1E582D2DA46C6CBD8181C08686CA9797D1A7A7D9B4B4
        DDBCBCD4B4B47045451D0D0D0502020000000000000000000000000000000000
        000000000000000000006969698585858A8A8A9C9C9CC4C4C4D0D0D0D2D2D2D9
        D9D9DFDFDFE4E4E4E7E7E7E3E3E3ABABAB7C7C7C6A6A6A000000000000000000
        000000000000000000000000000000000000000000050303502828A56E6EBD81
        81BD8181C59090D0A3A3D9B6B6E2C6C6E9D3D3E9D3D3DDC2C2633A3A0A050500
        00000000000000000000000000000000000000000000000000006464646B6B6B
        989898C5C5C5D0D0D0D0D0D0D6D6D6DEDEDEE5E5E5EBEBEBEFEFEFEFEFEFE9E9
        E9A3A3A36E6E6E64646400000000000000000000000000000000000000000000
        00000000002B16167E4D4DBD8181BD8181BD8181C99696D4ABABE0C0C0EAD5D5
        F3E7E7F4E9E9EBD8D8B49292361B1B0403030000000000000000000000000000
        00000000000000000000646464848484B1B1B1D0D0D0D0D0D0D0D0D0D9D9D9E1
        E1E1E9E9E9F0F0F0F6F6F6F7F7F7F1F1F1D3D3D38A8A8A696969000000000000
        000000000000000000000000000000000000040202482626A46D6DBD8181BD81
        81BD8282C99797D5ACACE1C2C2EDDADAF8F2F2FAF4F4EEDDDDE2C6C65D353507
        0404000000000000000000000000000000000000000000000000696969959595
        C5C5C5D0D0D0D0D0D0D1D1D1D9D9D9E1E1E1EAEAEAF2F2F2FAFAFAFBFBFBF3F3
        F3EBEBEBA0A0A06D6D6D00000000000000000000000000000000000000000000
        0000050303522D2DBB8080BD8181BD8181BD8181C79393D3A9A9DDBDBDE7D0D0
        EFE0E0F0E1E1E9D3D3DEC0C0774F4F0A06060000000000000000000000000000
        000000000000000000006B6B6B9A9A9AD0D0D0D0D0D0D0D0D0D0D0D0D7D7D7E0
        E0E0E7E7E7EFEFEFF4F4F4F5F5F5EFEFEFE9E9E9B0B0B0707070000000000000
        000000000000000000000000000000000000060303553131C79595DDBDBDD7B1
        B1BF8383C48C8CCE9F9FD7B1B1E0C0C0E5CACAE5CBCBE0C2C2D8B4B47951510D
        07070000000000000000000000000000000000000000000000006C6C6C9D9D9D
        D8D8D8E7E7E7E3E3E3D1D1D1D5D5D5DCDCDCE3E3E3E9E9E9ECECECEDEDEDE9E9
        E9E4E4E4B1B1B171717100000000000000000000000000000000000000000000
        0000060404482A2ABA8686F4EAEAEAD4D4CA9898BD8282C79292CFA1A1D5ADAD
        D9B5B5D9B5B5D5AFAFD0A3A36942420905050000000000000000000000000000
        000000000000000000006C6C6C969696D1D1D1F8F8F8F0F0F0D9D9D9D1D1D1D7
        D7D7DDDDDDE2E2E2E4E4E4E4E4E4E2E2E2DEDEDEA8A8A86E6E6E000000000000
        0000000000000000000000000000000000000101012919198E5E5EE7D0D0EDDA
        DAE1C4C4C48E8EBF8383C59090CA9999CE9E9ECE9F9FCB9A9AB58484472B2B06
        0303000000000000000000000000000000000000000000000000666666858585
        BABABAEFEFEFF2F2F2EAEAEAD5D5D5D1D1D1D6D6D6DADADADCDCDCDCDCDCDBDB
        DBCFCFCF9696966C6C6C00000000000000000000000000000000000000000000
        00000000000906065F3D3DC49292F0E1E1EAD4D4E2C6C6D8B1B1C08686C08686
        C28989C28A8AC086867B5050180F0F0101010000000000000000000000000000
        000000000000000000006464646F6F6FA3A3A3D6D6D6F5F5F5F0F0F0EBEBEBE3
        E3E3D2D2D2D2D2D2D4D4D4D4D4D4D2D2D2B1B1B17A7A7A676767000000000000
        000000000000000000000000000000000000000000040303231616744C4CC797
        97EBD8D8EBD8D8E7CFCFC18989BD8181BD8181BD81818C5D5D3E262606040400
        00000000000000000000000000000000000000000000000000000000006B6B6B
        828282AEAEAED9D9D9F1F1F1F1F1F1EEEEEED3D3D3D0D0D0D0D0D0D0D0D0BABA
        BA9191916C6C6C00000000000000000000000000000000000000000000000000
        0000000000000000050303281B1B6B4747A47373CFA1A1DCBBBBBF8484BD8181
        B179797D53533E29290604040000000000000000000000000000000000000000
        000000000000000000000000000000006B6B6B858585AAAAAAC6C6C6DDDDDDE7
        E7E7D1D1D1D0D0D0CBCBCBB2B2B29292926C6C6C646464000000000000000000
        0000000000000000000000000000000000000000000000000000000503030F0B
        0B412D2D6443437A53537D55556F4B4B4D34341C131306050500000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000006B6B6B747474959595A7A7A7B2B2B2B3B3B3ACACAC9B9B9B7E7E7E6D6D
        6D64646400000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000704040906060905050C08080A0707
        0704040000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000006464646D6D6D6F6F6F6E
        6E6E7171717070706D6D6D646464000000000000000000000000}
      NumGlyphs = 2
      OnClick = btnPesquisaProdutoClick
    end
    object lblTotal: TLabel
      Left = 272
      Top = 576
      Width = 79
      Height = 33
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 16
      Top = 137
      Width = 104
      Height = 33
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnPesquisaCliente: TSpeedButton
      Left = 222
      Top = 176
      Width = 34
      Height = 31
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000C01E0000C01E00000000000000000000000000020590
        0004950104900000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000989898989898989898000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000090E912849CE1E4FFF0110C001048E00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000009D9D9DB9B9B9C1C1C1A4A4A49797
        9700000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000009129DCBEBFF
        5F97FF1E4FFF0110C001048E0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000A0A0A0F3F3F3D6D6D6C1C1C1A4A4A4979797000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000002048F3557D5D9F0FF5F97FF1E4FFF0110C001048E00
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000989898BFBFBFF6F6F6D6D6D6C1C1
        C1A4A4A497979700000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000009502038C
        375DDAD9F0FF5F97FF1E4FFF0110C001048E0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000989898979797C2C2C2F6F6F6D6D6D6C1C1C1A4A4A4979797000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000009501038C3B64E0D9F0FF5F97FF1E4FFF01
        10C001048E000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000989898969696C4C4C4F6F6
        F6D6D6D6C1C1C1A4A4A497979700000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009501038B3E68E3D9F0FF5F97FF1E4FFF0110C001048E0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000989898969696C6C6C6F6F6F6D6D6D6C1C1C1A4A4A4979797
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000007501038A416DE7D9F0FF5F
        97FF1E4FFF0110C001038F000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000008F8F8F9696
        96C8C8C8F6F6F6D6D6D6C1C1C1A4A4A497979700000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000008101038A4374EDD9F0FF5F97FF1535A90403090503030000
        0000000003010105020205020205020200000000000000000000000000000000
        0000000000000000000000000000929292969696CACACAF6F6F6D6D6D6A9A9A9
        6D6D6D6B6B6B6464646464646868686969696A6A6A6969696464646464640000
        0000000000000000000000000000000000000000000000000000008701038A44
        77EF88ABC5131118573535070303050303281111411C1C4C20204C20203D1A1A
        200D0D0603030402020000000000000000000000000000000000000000000000
        00949494969696CBCBCBD4D4D47B7B7B9E9E9E6C6C6C6B6B6B8282828F8F8F93
        93939393938C8C8C7D7D7D6B6B6B696969000000000000000000000000000000
        00000000000000000000000000007F01038708080EC9C7C71915152611114F24
        247946469F6868C18989C99696BB8F8F916666562B2B180B0B06020200000000
        0000000000000000000000000000000000000000929292959595737373E5E5E5
        7E7E7E818181969696AEAEAEC2C2C2D3D3D3D9D9D9D3D3D3BDBDBD9B9B9B7979
        796B6B6B00000000000000000000000000000000000000000000000000000000
        0000030202221F1F311E1E582D2DA46C6CBD8181C08686CA9797D1A7A7D9B4B4
        DDBCBCD4B4B47045451D0D0D0502020000000000000000000000000000000000
        000000000000000000006969698585858A8A8A9C9C9CC4C4C4D0D0D0D2D2D2D9
        D9D9DFDFDFE4E4E4E7E7E7E3E3E3ABABAB7C7C7C6A6A6A000000000000000000
        000000000000000000000000000000000000000000050303502828A56E6EBD81
        81BD8181C59090D0A3A3D9B6B6E2C6C6E9D3D3E9D3D3DDC2C2633A3A0A050500
        00000000000000000000000000000000000000000000000000006464646B6B6B
        989898C5C5C5D0D0D0D0D0D0D6D6D6DEDEDEE5E5E5EBEBEBEFEFEFEFEFEFE9E9
        E9A3A3A36E6E6E64646400000000000000000000000000000000000000000000
        00000000002B16167E4D4DBD8181BD8181BD8181C99696D4ABABE0C0C0EAD5D5
        F3E7E7F4E9E9EBD8D8B49292361B1B0403030000000000000000000000000000
        00000000000000000000646464848484B1B1B1D0D0D0D0D0D0D0D0D0D9D9D9E1
        E1E1E9E9E9F0F0F0F6F6F6F7F7F7F1F1F1D3D3D38A8A8A696969000000000000
        000000000000000000000000000000000000040202482626A46D6DBD8181BD81
        81BD8282C99797D5ACACE1C2C2EDDADAF8F2F2FAF4F4EEDDDDE2C6C65D353507
        0404000000000000000000000000000000000000000000000000696969959595
        C5C5C5D0D0D0D0D0D0D1D1D1D9D9D9E1E1E1EAEAEAF2F2F2FAFAFAFBFBFBF3F3
        F3EBEBEBA0A0A06D6D6D00000000000000000000000000000000000000000000
        0000050303522D2DBB8080BD8181BD8181BD8181C79393D3A9A9DDBDBDE7D0D0
        EFE0E0F0E1E1E9D3D3DEC0C0774F4F0A06060000000000000000000000000000
        000000000000000000006B6B6B9A9A9AD0D0D0D0D0D0D0D0D0D0D0D0D7D7D7E0
        E0E0E7E7E7EFEFEFF4F4F4F5F5F5EFEFEFE9E9E9B0B0B0707070000000000000
        000000000000000000000000000000000000060303553131C79595DDBDBDD7B1
        B1BF8383C48C8CCE9F9FD7B1B1E0C0C0E5CACAE5CBCBE0C2C2D8B4B47951510D
        07070000000000000000000000000000000000000000000000006C6C6C9D9D9D
        D8D8D8E7E7E7E3E3E3D1D1D1D5D5D5DCDCDCE3E3E3E9E9E9ECECECEDEDEDE9E9
        E9E4E4E4B1B1B171717100000000000000000000000000000000000000000000
        0000060404482A2ABA8686F4EAEAEAD4D4CA9898BD8282C79292CFA1A1D5ADAD
        D9B5B5D9B5B5D5AFAFD0A3A36942420905050000000000000000000000000000
        000000000000000000006C6C6C969696D1D1D1F8F8F8F0F0F0D9D9D9D1D1D1D7
        D7D7DDDDDDE2E2E2E4E4E4E4E4E4E2E2E2DEDEDEA8A8A86E6E6E000000000000
        0000000000000000000000000000000000000101012919198E5E5EE7D0D0EDDA
        DAE1C4C4C48E8EBF8383C59090CA9999CE9E9ECE9F9FCB9A9AB58484472B2B06
        0303000000000000000000000000000000000000000000000000666666858585
        BABABAEFEFEFF2F2F2EAEAEAD5D5D5D1D1D1D6D6D6DADADADCDCDCDCDCDCDBDB
        DBCFCFCF9696966C6C6C00000000000000000000000000000000000000000000
        00000000000906065F3D3DC49292F0E1E1EAD4D4E2C6C6D8B1B1C08686C08686
        C28989C28A8AC086867B5050180F0F0101010000000000000000000000000000
        000000000000000000006464646F6F6FA3A3A3D6D6D6F5F5F5F0F0F0EBEBEBE3
        E3E3D2D2D2D2D2D2D4D4D4D4D4D4D2D2D2B1B1B17A7A7A676767000000000000
        000000000000000000000000000000000000000000040303231616744C4CC797
        97EBD8D8EBD8D8E7CFCFC18989BD8181BD8181BD81818C5D5D3E262606040400
        00000000000000000000000000000000000000000000000000000000006B6B6B
        828282AEAEAED9D9D9F1F1F1F1F1F1EEEEEED3D3D3D0D0D0D0D0D0D0D0D0BABA
        BA9191916C6C6C00000000000000000000000000000000000000000000000000
        0000000000000000050303281B1B6B4747A47373CFA1A1DCBBBBBF8484BD8181
        B179797D53533E29290604040000000000000000000000000000000000000000
        000000000000000000000000000000006B6B6B858585AAAAAAC6C6C6DDDDDDE7
        E7E7D1D1D1D0D0D0CBCBCBB2B2B29292926C6C6C646464000000000000000000
        0000000000000000000000000000000000000000000000000000000503030F0B
        0B412D2D6443437A53537D55556F4B4B4D34341C131306050500000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000006B6B6B747474959595A7A7A7B2B2B2B3B3B3ACACAC9B9B9B7E7E7E6D6D
        6D64646400000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000704040906060905050C08080A0707
        0704040000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000006464646D6D6D6F6F6F6E
        6E6E7171717070706D6D6D646464000000000000000000000000}
      NumGlyphs = 2
      OnClick = btnPesquisaClienteClick
    end
    object BtnAdicionar: TSpeedButton
      Left = 750
      Top = 384
      Width = 113
      Height = 41
      Caption = 'Adicionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnAdicionarClick
    end
    object btnCancelarPedido: TSpeedButton
      Left = 16
      Top = 513
      Width = 240
      Height = 57
      Caption = 'Cancelar Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnCancelarPedidoClick
    end
    object btnEditarPedido: TSpeedButton
      Left = 16
      Top = 442
      Width = 240
      Height = 57
      Caption = 'Carregar Pedido '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnEditarPedidoClick
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 922
      Height = 80
      Align = alTop
      Caption = 'Tela de Vendas'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -32
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edtNomeProduto: TEdit
      Left = 718
      Top = 168
      Width = 145
      Height = 31
      TabStop = False
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtQuantidade: TEdit
      Left = 638
      Top = 253
      Width = 225
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 5
    end
    object edtValor: TEdit
      Left = 638
      Top = 331
      Width = 225
      Height = 31
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object dbgPedido: TDBGrid
      Left = 272
      Top = 168
      Width = 353
      Height = 402
      DataSource = dtsPedidos
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgPedidoKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          ReadOnly = True
          Title.Caption = 'C'#243'digo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          ReadOnly = True
          Title.Caption = 'Descricao'
          Width = 100
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Caption = 'Qtde'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALOR_UNITARIO'
          Title.Caption = 'Vlr.  Unit'#225'rio'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          ReadOnly = True
          Title.Caption = 'Vlr. Total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ITENS_PEDIDO'
          ReadOnly = True
          Width = 0
          Visible = True
        end>
    end
    object edtTotal: TEdit
      Left = 376
      Top = 576
      Width = 249
      Height = 33
      Alignment = taRightJustify
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object edtCodProduto: TEdit
      Left = 638
      Top = 168
      Width = 74
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 3
      OnExit = edtCodProdutoExit
    end
    object edtCodCliente: TEdit
      Left = 16
      Top = 176
      Width = 49
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      OnExit = edtCodClienteExit
    end
    object edtNomeCliente: TEdit
      Left = 71
      Top = 176
      Width = 145
      Height = 31
      TabStop = False
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object dtsPedidos: TDataSource
    Left = 56
    Top = 88
  end
  object QryPesquisa: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connection
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 120
    Top = 88
  end
  object dtsPesquisa: TDataSource
    AutoEdit = False
    DataSet = QryPesquisa
    Left = 88
    Top = 88
  end
end