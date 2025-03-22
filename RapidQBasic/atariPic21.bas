Application.Title = "ATARI XL/XE Pictures Viewer"

'******************************
'Includes
'******************************

$Include "Rapidq.inc"
$Include ".\inc\QAbout.inc"
$Include ".\Inc\QBitmapEx.inc"

'******************************
'Deklarace procedur a funkcí
'******************************
Declare Sub CrFrmPaleta()
Declare Sub klik(Sender as QLabel)
Declare Sub Dklik(Sender as QLabel)
Declare Sub butOKClick(Sender as QButton)
Declare Sub CrFrmSada()
Declare Sub butSadaOKClick(sender as QButton)
Declare Sub fontShow()
Declare Sub canSadaObnovit()
Declare Sub frmPicViewKeyPress(Key AS BYTE)
Declare Sub mnuOpenClick(Sender as QMenuItem)
Declare Sub mnuExitClick(Sender as QMenuItem)
Declare Sub mnuSaveAsClick(Sender as QMenuItem)
DEclare Sub mnuCopyClick()
Declare Sub mnuDefPalClick()
Declare Sub mnuLoadPalClick(sender as QMenuItem)
Declare Sub mnuPalRedrawClick(sender as QMenuItem)
Declare Sub mnuDefFontClick()
Declare Sub mnuLoadFontClick()
Declare Sub mnuFontShowClick()
Declare Sub mnuFontRedrawClick(sender as QMenuItem)
Declare Sub mnuWarningsClick(sender as QMenuItem)
Declare Sub mnuAboutClick(Sender as QMenuItem)
Declare Sub PrepinacFormatu(sender as QMenuItem)
Declare Sub NastavBarvu(sender as QLabel)
Declare Sub VykreslitRamecek(sender as QLabel)
Declare Sub VypnoutRamecek()
Declare Sub Pokusna(sender as QLabel)
Declare Sub MADVelikost()
Declare Sub NormVelikost()
Declare Sub Zobrazit()
Declare Sub DMPrevest(jak as Integer)
Declare Sub MADPrevest(jak as Integer)
Declare Sub MicPrevest(jak as Integer)
Declare Sub GR15Prevest(jak as Integer)
Declare Sub GR7Prevest(jak as Integer)
Declare Sub GR5Prevest(jak as Integer)
Declare Sub GR3Prevest(jak as Integer)
Declare Sub DRWPrevest(jak as Integer)
Declare Sub FWAPrevest(jak as Integer)
Declare Sub ZnakSaduPrevest()
Declare Function NactiKoaInfo() as Integer
Declare SUb ShowKoaInfo()
Declare Sub KoaPrevest(jak as Integer)
Declare Sub KoaSou2(kterak as Byte)
Declare Sub obnovit()
Declare Sub pokus(sender as QMenuItem)
Declare Sub Vymazat()
Declare Sub Negativ()
Declare Sub BajtGR8(bajt as Byte, p as Integer, y as Integer)
Declare Sub BajtGR15(bajt as Byte, p as Integer, y as Integer)
Declare Sub BajtGR5(bajt as Byte, px as Integer, py as Integer)
Declare Sub BajtGR3(bajt as Byte, px as Integer, py as Integer)
Declare Sub BajtZnaku(bajt as Byte, px as Integer, y as Integer)
Declare Sub NacistSoubor(ktery as String)
Declare Sub Ukazat()
Declare Sub obrPamClear()
Declare Sub chkMonoClick()
DEclare Sub ZapsatPanely()
Declare Sub InitAtariBarvy()
Declare Sub NactiDefSadu()
Declare Sub BarvoveRegistry()
Declare Sub Nastartovat()

Declare Function BezCesty(co as String) as String

'******************************
'Dimenzování globálních promìnných a konstant
'******************************

Const pfDesignMaster = 1
Const pfMadDesign = 2
Const pfGR15 = 16
Const pfMicroPainter = 17
Const pfKoala = 18
Const pfFunWithArt = 19
Const pfDrawit = 33
Const pfGR7 = 32
Const pfGR5 = 48
Const pfGR3 = 64
Const pfHumbleDesign = 80
Const pfZnakSada = 128
Const MADsirka = 512
Const MADvyska = 256
Const DMsirka = 320
Const DMvyska = 192
Const sirkaformu = 330
Const vyskaformu = 322

Dim cas1 as QTimer
Dim soubor as String
Dim picFormat as integer
Dim obrBMP as QBitmap
Dim strBuffer as String
Dim obrfile as QFILESTREAM
Dim obrPam as QMEMORYSTREAM
Dim parsoubor as String
Dim parformat as String
Dim parzobrazit as String
Dim parsavename as String
Dim setcol(0 to 4) as Long
Dim AtariBarva(0 to 255) as Long
Dim paleta as String
Dim openFilter as String
Dim palzmena as Integer
DIm CurrFormat as String
Dim aktvelikost as Long
Dim polesada(0 to 1023) as Byte
Dim schranka as QBitmapEx
Dim sadaBMP as QBitmap
Dim sada as String
Dim formsirka as Integer
Dim formvyska as Integer

' zaznamy v hlavicce souboru Koala
Dim koaInfId as String
Dim koaInfHedLen as Integer
Dim koaInfVer as Byte
Dim koaInfKomp as Byte
Dim koaInfGrMod as Byte
Dim koaInfMem as String
Dim koaInfCol708 as Byte
Dim koaInfCol709 as Byte
Dim koaInfCol710 as Byte
Dim koaInfCol711 as Byte
Dim koaInfCol712 as Byte
Dim koaInfFileLen as Integer
Dim koaInfRezerve as String
Dim koaInfNazev as String
Dim koaInfAuthor as String
Dim koaInfPozn1 as String
Dim koaInfPozn2 as String
Dim koaInfHedEnd as Byte

Dim koax as Integer
Dim koay as Integer
Dim ukazatel as Integer

' promìnné pro frmPaleta
Dim frmPaleta as QForm
Dim butOk as QButton
Dim ctverecek(0 to 255) as QLabel

Dim frmSada as QForm
Dim butSadaOk as QButton
Dim cansada as QCanvas

'******************************
' Creates
'******************************

Create frmPicView as QForm
      Caption = "Atari XL/XE Picture Viewer"
      Top     = 121
      Left    = 1581
      Width   = 330
      Height  = 322
      BorderStyle = bsSingle
      Color   = &HD8E9EC
      OnShow = Nastartovat
      OnKeyPress = frmPicViewKeyPress
End Create
Create barStatus as QStatusBar
      Parent  = frmPicView
      Top     = 312
      Left    = 0
      Width   = 469
      Height  = 19
      Hint = "Velikost / Formát / Paleta / Sada"
      ShowHint = True
      AddPanels  "Velikost", "Format", "Paleta", "Sada"
      Panel(0).Width = 60
      Panel(1).Width = 85
      Panel(2).Width = 85
End Create
Create mnuMain as QMainMenu
      Parent = frmPicView
      Create mnuFile as QMenuItem
           Caption = "Soubor"
           Create mnuOpen as QMenuItem
                 Caption = "Otevøít ..."
                 ShortCut = "CTRL+O"
                 OnClick = mnuOpenClick
           End Create
           Create mnuSave as QMenuItem
                 Caption = "Uložit"
                 ShortCut = "CTRL+S"
           End Create
           Create mnuSaveAs as QMenuItem
                 Caption = "Uložit jako ..."
                 OnClick = mnuSaveAsClick
           End Create
           Create mnuPrint as QMenuItem
                 Caption = "Tisk ..."
                 ShortCut = "CTRL+P"
                 Enabled = False
           End Create
           Create mnuExit as QMenuItem
                 Caption = "Konec"
                 ShortCut = "Esc"
                 OnClick = mnuExitClick
           End Create
      End Create
      Create mnuEdit as QMenuItem
           Caption = "Úpravy"
           Create mnuCopy as QMenuItem
                Caption = "Kopírovat"
                ShortCut = "Ctrl+C"
                OnClick = mnuCopyClick
           End Create
      End Create
      Create mnuFormat as QMenuItem
           Caption = "Formát"
           Create mnuDMaster as QMenuItem
                Caption = "Design Master"
                Tag = 1
                Checked = True
                OnClick = PrepinacFormatu
           End Create
           Create mnuMAD as QMenuItem
                Caption = "MAD Designer"
                Tag = 2
                Enabled = True
                OnClick = PrepinacFormatu
           End Create
           Create mnuHumble as QMenuItem
                Caption = "Humble Design"
                Tag = 80
                Enabled = False
                OnClick = PrepinacFormatu
           End Create
           Create mnuMicro as QMenuItem
                Caption = "Micro Painter"
                Tag = 17
                OnClick = PrepinacFormatu
           End Create
           Create mnuKoala as QMenuItem
                Caption = "Koala Illustrator"
                Tag = 18
                Enabled = True
                OnClick = PrepinacFormatu
           End Create
           Create mnuDraWit as QMenuItem
                Caption = "Draw It"
                Tag = 33
                OnClick = PrepinacFormatu
           End Create
           Create mnuFWA as QMenuItem
                Caption = "Fun With Art"
                Tag = 19
                Enabled = True
                OnClick = PrepinacFormatu
           End Create
           Create mnuGR15 as QMenuItem
                Caption = "Graphics 15"
                Tag = 16
                OnClick = PrepinacFormatu
           End Create
           Create mnuGR7 as QMenuItem
                Caption = "Graphics 7"
                Tag = 32
                OnClick = PrepinacFormatu
           End Create
           Create mnuGR5 as QMenuItem
                Caption = "Graphics 5"
                Tag = 48
                OnClick = PrepinacFormatu
           End Create
           Create mnuGR3 as QMenuItem
                Caption = "Graphics 3"
                Tag = 64
                Enabled = True
                OnClick = PrepinacFormatu
           End Create
           Create mnuZnakSada as QMenuItem
                Caption = "Znaková sada"
                Tag = 128
                OnClick = PrepinacFormatu
           End Create
      End Create
      Create mnuSettings as QMenuItem
           Caption = "Nastavení"
           Create mnuPaleta as QMenuItem
                Caption = "Paleta barev"
                Create mnuDefPal as QMenuItem
                     Caption = "Vestavìná"
                     OnClick = mnuDefPalClick
                End Create
                Create mnuLoadPal as QMenuItem
                     Caption = "Naèíst paletu..."
                     OnClick = mnuLoadPalClick
                End Create
                Create mnuPalRedraw as QMenuItem
                     Caption = "Pøekreslit obr. pøi zmìnì palety"
                     Checked = False
                     OnClick = mnuPalRedrawClick
                End Create
           End Create
           Create mnuFont as QMenuItem
                Caption = "Znaková sada"
                Create mnuDEfFont as QMenuItem
                     Caption = "Vestavìná"
                     OnClick = mnuDefFontClick
                End Create
                Create mnuLoadFont as QMenuItem
                     Caption = "Naèíst znakovou sadu..."
                     OnClick = mnuLoadFontClick
                End Create
                Create mnuFontShow as QMenuItem
                     Caption = "Zobrazit aktuální znakovou sadu..."
                     OnClick = mnuFontShowClick
                End Create
                Create mnuFontRedraw as QMenuItem
                     Caption = "Pøekreslit obr. pøi zmìnì sady"
                     Hint = "Pouze u Humble Design obrázku"
                     OnClick = mnuFontRedrawClick
                End Create
           End Create
           Create mnuWarnings as QMenuItem
                Caption = "Zobrazovat varování"
                Checked = False
                OnClick = mnuWarningsClick
           End Create
      End Create
      Create mnuHelp as QMenuItem
           Caption = "Nápovìda"
           Create mnuIndex as QMenuItem
                Caption = "Obsah"
                OnClick = pokus
                Enabled = False
           End Create
           Create mnuAbout as QMenuItem
                Caption = "O programu"
                OnClick = mnuAboutClick
           End Create
      End Create
End Create
Create canpicpop as QPOPUPMENU
     Create canpicopCopy as QMenuItem
          Caption = "Kopírovat"
          OnClick = mnuCopyClick
     End Create
     Create canpicpopRedraw as QMenuItem
          Caption = "Pøekreslit"
          OnClick = Zobrazit
     End Create
End Create
Create barTools as QPanel
      Parent  = frmPicView
      Top     = 0
      Left    = 0
      Width   = 322
      Height  = 53
      Caption = ""
      Color   = &HD8E9EC
      Align = alTop
      BorderStyle = bsSingle
      OnMouseMOve = VypnoutRamecek
End Create
Create canPic as QCanvas
      Parent  = frmPicView
      Top     = 56
      Left    = 2
      Width   = 320
      Height  = 192
      Color   = &HFFFFFF
      POPUPMENU   = canpicpop
      OnPaint = obnovit
End Create
Create OpenDialog1 as QOpenDialog
      Caption = "Otevøít obrázek ATARI"
      FileName = ""
      Filter = "Obrázky (*.pic)|*.pic|MicroPainter (*.mic)|*.mic|Všechny soubory (*.*)|*.*"
      FilterIndex = 1
      InitialDir = ""
End Create
Create SaveDialog1 as QSaveDialog
      Caption = "Uložit jako BMP"
      FileName = ""
      Filter = "Windows Bitmap (*.bmp)|*.bmp|Všechny soubory (*.*)|*.*"
      FilterIndex = 1
      InitialDir = ""
End Create
Create georger420 as QAbout
      AppName = "ATARI XL/XE Pictures Viewer"
      AppVersion = "0.0.21"
      Caption = "Informace o programu"
      Text = ""
      Web = ""
      EMail = "rockgeorge420@gmail.com"
End Create
Create chkNegativ as QCheckBox
      Parent  = barTools
      Top     = 4
      Left    = 6
      Width   = 57
      Height  = 17
      Caption = "Negativ"
      Checked = False
      OnClick = Negativ
End Create

Create Label1 as QLabel
      Parent  = barTools
      Top     = 1
      Left    = 105
      Width   = 58
      Height  = 13
      Caption = "SETCOLOR"
      Color   = &HD8E9EC
End Create
Create Label2 as QLabel
      Parent  = barTools
      Top     = 15
      Left    = 101
      Width   = 66
      Height  = 13
      Caption = "0   1   2   3   4"
      Color   = &HD8E9EC
End Create
Create ramecek as QCanvas
      Parent = barTools
      Width = 17
      Height = 17
      Visible = False
End Create
Create lblSetCol0 as QLabel
      Parent  = barTools
      AutoSize = False
      Top     = 29
      Left    = 98
      Width   = 13
      Height  = 13
      Caption = ""
      Color   = &HFFFFFF
      LowerColor = &H808080
      UpperColor = &H000000
      Hint = "Barvový registr 712"
      ShowHint = True
      Tag = 0
      OnDblClick = NastavBarvu
End Create
Create lblSetCol1 as QLabel
      Parent  = barTools
      AutoSize = False
      Top     = 29
      Left    = 113
      Width   = 13
      Height  = 13
      Caption = ""
      Color   = &HFFFFFF
      LowerColor = &H808080
      UpperColor = &H000000
      Hint = "Barvový registr 708"
      ShowHint = True
      Tag = 1
      OnDblClick = NastavBarvu
End Create
Create lblSetCol2 as QLabel
      Parent  = barTools
      AutoSize = False
      Top     = 29
      Left    = 128
      Width   = 13
      Height  = 13
      Caption = ""
      Color   = &HFFFFFF
      LowerColor = &H808080
      UpperColor = &H000000
      Hint = "Barvový registr 709"
      ShowHint = True
      Tag = 2
      OnDblClick = NastavBarvu
End Create
Create lblSetCol3 as QLabel
      Parent  = barTools
      AutoSize = False
      Top     = 29
      Left    = 143
      Width   = 13
      Height  = 13
      Caption = ""
      Color   = &HFFFFFF
      LowerColor = &H808080
      UpperColor = &H000000
      Hint = "Barvový registr 710"
      ShowHint = True
      Tag = 3
      OnDblClick = NastavBarvu
End Create
Create lblSetCol4 as QLabel
      Parent  = barTools
      AutoSize = False
      Top     = 29
      Left    = 158
      Width   = 13
      Height  = 13
      Caption = ""
      Color   = &HFFFFFF
      LowerColor = &H808080
      UpperColor = &H000000
      Hint = "Barvový registr 711"
      ShowHint = True
      Tag = 4
      OnDblClick = NastavBarvu
End Create
Create chkMono as QCheckBox
      Parent  = barTools
      Top     = 22
      Left    = 6
      Width   = 80
      Height  = 17
      checked = False
      Hint = "Kreslit pouze èernobíle!"
      ShowHint = True
      Caption = "Monochrom"
      OnClick = chkMonoClick
End Create

'******************************
'Procedury a funkce
'******************************

Sub MADVelikost()
     dim pom as Integer
     frmPicView.Width = sirkaformu + (MADsirka - DMsirka)
     frmPicView.Height = vyskaformu + (MADvyska - DMvyska)
     canpic.Width = MADsirka
     canpic.Height = MADvyska
     obrBMP.Width = canpic.Width
     obrBMP.Height = canpic.Height
End Sub

Sub NormVelikost()
     dim pom as Integer
     frmPicView.Width = sirkaformu
     frmPicView.Height = vyskaformu
     canpic.Width = DMsirka
     canpic.Height = DMvyska
     obrBMP.Width = canpic.Width
     obrBMP.Height = canpic.Height
End Sub

Sub mnuOpenClick(Sender as QMenuItem)
     OpenDialog1.Caption = "Otevøít obrázek ATARI"
     OpenDialog1.Filter = openFilter
     If OpenDialog1.Execute then
          soubor = openDialog1.FileName
          NacistSoubor(soubor)
          chkNegativ.Checked = False
          chkMono.Checked = False
          palzmena = 0
          Zobrazit
     end if
End Sub

Sub mnuSaveAsClick(Sender as QMenuItem)
    if Savedialog1.Execute then
         soubor = savedialog1.FileName
         obrBMP.SaveToFile(soubor)
    end if
End Sub


Sub NacistSoubor(ktery as String)
     obrpam.Close
     obrFile.Open(ktery,fmOpenRead)
     obrPam.CopyFrom(obrFile, obrFile.Size)
     obrFile.Close
     aktvelikost = obrPam.Size
     ZapsatPanely
     chkNegativ.Checked = False
     frmPicView.Caption = BezCesty(ktery)
End Sub

Sub mnuExitClick(Sender as QMenuItem)
     frmPicView.Close
End Sub

Sub mnuAboutClick(Sender as QMenuItem)
     georger420.Show
End Sub

Sub mnuCopyClick()
     schranka.bmp=obrBMP.bmp
     schranka.CopyToClipboard
End Sub


Sub mnuLoadPalClick(sender as QMenuItem)
     Dim palFile as QFileStream
     Dim i as integer
     Dim vysledek
     Dim hlaska as string
     Opendialog1.Filter = "Atari paleta (*.act)|*.act|Všechny soubory (*.*)|*.*"
     OpenDialog1.Caption = "Naèíst paletu barev ATARI XL/XE"
     if Opendialog1.Execute then
          paleta = OpenDialog1.FileName
          palFile.Open(paleta,fmOpenRead)
          if palFile.Size <> 768 then
               hlaska = "Zvolený soubor patrnì není paleta barev ATARI!" & chr$(13) & chr$(10) & chr$(13) & chr$(10)
               hlaska = hlaska & "Chcete pøesto soubor nahrát jako paletu barev?
               vysledek = MessageDlg(hlaska, mtWarning, mbYes OR mbNo, 0)
          else
               vysledek = mrYes
          end if
          if vysledek = mrYes then
               palFile.Position = 0
               For i = 0 to 255
                   AtariBarva(i) = 0
                   AtariBarva(i) = palFile.ReadNum(1) + palFile.ReadNum(1) * 256 + palFile.ReadNum(1) * 65536
               Next I
               mnuLoadPal.Checked = True
               mnuDefpal.Checked = false
               BarvoveRegistry
          end if
          palFile.Close
          ZapsatPanely
          If mnuPalRedraw.Checked then
               Zobrazit
          End If
     end if
End Sub

Sub mnuDefPalClick()
     InitAtariBarvy
     BarvoveRegistry
     mnuLoadPal.Checked = False
     mnuDefpal.Checked = True
     paleta = "Vestavìná"
     ZapsatPanely
     if mnupalRedraw.Checked = True then
          Zobrazit
     end if
End Sub

Sub mnuPalRedrawClick(sender as QMenuItem)
     if mnupalRedraw.Checked = True then
          mnupalRedraw.Checked = False
     else
          mnupalRedraw.Checked = True
     end if
End Sub

Sub mnuDefFontClick()
     mnuDefFont.Checked = True
     mnuLoadFont.Checked = False
     NactiDefSadu
     sada = "Vestavìná"
     ZapsatPanely
     if mnuFontRedraw.Checked = True then
          Zobrazit
     End If
End Sub

Sub mnuLoadFontClick()
     Dim sadaFile as QFileStream
     Dim i as integer
     Dim vysledek
     Dim hlaska as string
     Opendialog1.Filter = "Znaková sada (*.fnt)|*.fnt|Všechny soubory (*.*)|*.*"
     OpenDialog1.Caption = "Naèíst znakovou sadu ATARI XL/XE"
     if Opendialog1.Execute then
          sada = OpenDialog1.FileName
          sadaFile.Open(sada,fmOpenRead)
          if sadaFile.Size <> 1024 then
               hlaska = "Zvolený soubor patrnì není znaková sada ATARI!" & chr$(13) & chr$(10) & chr$(13) & chr$(10)
               hlaska = hlaska & "Chcete pøesto soubor nahrát jako znakovou sadu?
               vysledek = MessageDlg(hlaska, mtWarning, mbYes OR mbNo, 0)
          else
               vysledek = mrYes

          end if
          if vysledek = mrYes then
               sadaFile.Position = 0
               For i = 0 to 1023
                   poleSada(i) = 0

                   poleSada(i) = sadaFile.ReadNum(1)
               Next I
               mnuLoadFont.Checked = True
               mnuDefFont.Checked = false
          end if
          sadaFile.Close
          ZapsatPanely
     end if
End Sub


Sub mnuFontRedrawClick(sender as QMenuItem)
     If mnuFontRedraw.Checked = True then
          mnuFontRedraw.Checked = False
     else
          mnuFontRedraw.Checked = True
     End If
End SUb

Sub mnuFontShowClick()
   fontShow
   frmSada.ShowModal
End Sub

Sub mnuWarningsClick(sender as QMenuItem)
     If mnuWarnings.Checked = True then
          mnuWarnings.Checked = False
     Else
          mnuWarnings.Checked = True
     End If
End Sub



Sub PrepinacFormatu(sender as QMenuItem)
     Dim klic as Integer
     klic = sender.Tag
     Select Case klic
          case pfDesignMaster
               mnuDmaster.Checked = True
               CurrFormat = mnuDmaster.Caption
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Design Master (*.pic)|*.pic|Všechny soubory (*.*)|*.*"
          case pfMadDesign
               mnuDmaster.Checked = False
               mnuMad.Checked = True
               CurrFormat = mnuMad.Caption
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "MAD Design (*.mbg)|*.mbg|Všechny soubory (*.*)|*.*"
          case pfHumbleDesign
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = True
               CurrFormat = mnuHumble.Caption
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = True
               openFilter = "Humble Design (*.hd)|*.hd|Všechny soubory (*.*)|*.*"
          case pfGR15
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = True
               CurrFormat = mnuGR15.Caption
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Graphics 15 (*.g15)|*.g15|Všechny soubory (*.*)|*.*"
          case pfMicroPainter
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = True
               CurrFormat = mnuMicro.Caption
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Micro Painter (*.mic)|*.mic|Všechny soubory (*.*)|*.*"
          case pfKoala
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = True
               CurrFormat = mnuKoala.Caption
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Koala (*.koa)|*.koa|Koala (*.pic)|*.pic|Všechny soubory (*.*)|*.*"
          case pfFunWithArt
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = True
               CurrFormat = mnuFWA.Caption
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Fun With Art (*.fwa)|*.fwa|Všechny soubory (*.*)|*.*"
          case pfDrawIt
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = True
               CurrFormat = mnuDraWit.Caption
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Draw It (*.dr*|*.dr*|Všechny soubory (*.*)|*.*"
          case pfGR7
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = True
               CurrFormat = mnuGR7.Caption
               mnuGR5.Checked = False
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Graphic 7 (*.gr7)|*.gr7|Všechny soubory (*.*)|*.*"
          case pfGR5
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = True
               CurrFormat = mnuGR5.Caption
               mnuGR3.Checked = False
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Graphics 5 (*.gr5)|*.gr5|Všechny soubory (*.*)|*.*"
          case pfGR3
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuGR3.Checked = True
               CurrFormat = mnuGR3.Caption
               mnuZnakSada.Checked = False
               mnuFontRedraw.Enabled = False
               openFilter = "Graphics 3 (*.gr3)|*.gr3|Všechny soubory (*.*)|*.*"
          case pfZnakSada
               mnuDmaster.Checked = False
               mnuMad.Checked = False
               mnuHumble.Checked = False
               mnuMicro.Checked = False
               mnuKoala.Checked = False
               mnuDrawit.Checked = False
               mnuFWA.Checked = False
               mnuGR15.Checked = False
               mnuGR7.Checked = False
               mnuGR5.Checked = False
               mnuZnakSada.Checked = True
               mnuGR3.Checked = False
               mnuFontRedraw.Enabled = False
               CurrFormat = mnuZnakSada.Caption
               openFilter = "Znaková sada (*.fnt)|*.fnt|Všechny soubory (*.*)|*.*"
     End Select
     ZapsatPanely
     palzmena = 0
     Zobrazit
End Sub

Sub Vymazat()
     Dim x as integer
     Dim y as Integer
     Dim ksirka as Integer
     Dim kvyska as Integer
     ksirka = obrBMP.Width - 1
     kvyska = obrBMP.Height - 1
     For y = 0 to kvyska
          If mnuZnakSada.Checked then
               sadaBMP.Line 0,y,ksirka,y,AtariBarva(SetCol(2))
          else
               obrBMP.Line 0,y,ksirka,y,AtariBarva(SetCol(2))
          End If
     next y
     Obnovit
End Sub

Sub Zobrazit()
     If mnuDmaster.Checked = True then
          NormVelikost
          DMPrevest(chkNegativ.Checked)
     End if
     If mnuMAD.Checked = True then
           MADvelikost
           MADPrevest(chkNegativ.Checked)
     End if
     If mnuHumble.Checked = True then
          'NormVelikost
          'DMPrevest(chkNegativ.Checked)
     End if
     If mnuMicro.Checked = True then
          NormVelikost
          MicPrevest(chkNegativ.Checked)
     End if
     If mnuKoala.Checked = True then
          NormVelikost
          KoaPrevest(chkNegativ.Checked)
     End if
     If mnuDrawit.Checked = True then
         NormVelikost
         DRWPrevest(chkNegativ.Checked)
     End if
     If mnuFWA.Checked = True then
          NormVelikost
          FWAPrevest(chkNegativ.Checked)
     End if
     If mnuGR15.Checked = True then
           NormVelikost
           GR15Prevest(chkNegativ.Checked)
     End if
     If mnuGR7.Checked = True then
           NormVelikost
           GR7Prevest(chkNegativ.Checked)
     End if
     If mnuGR5.Checked = True then
          NormVelikost
          GR5Prevest(chkNegativ.Checked)
     End if
     If mnuGR3.Checked = True then
          NormVelikost
          GR3Prevest(chkNegativ.Checked)
     End if
     If mnuZnakSada.Checked = True then
          NormVelikost
          ZnakSaduPrevest
     End if
End Sub

Sub DMPrevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim j as Integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     obrPam.Position = 0
     delka = 0
     For j = 0 to 191
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR8 b, l, j
          Next l
     Next j
     Obnovit
End Sub

Sub MADPrevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim j as Integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     obrPam.Position = 0
     delka = 0
     For j = 0 to 255
          For l = 0 to 63
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR8 b, l, j
          Next l
     Next j
     Obnovit
End Sub


Sub BajtGR8(bajt as Byte, p as Integer, y as Integer)
     Dim k as Integer
     Dim x as Integer
     k = 8 * p
     if (bajt AND 128) = 128 then
          x = k
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 64) = 64 then
          x = k + 1
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 32) = 32 then
          x = k + 2
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 16) = 16 then
          x = k + 3
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 8) = 8 then
          x = k + 4
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 4) = 4 then
          x = k + 5
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 2) = 2 then
          x = k + 6
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
     if (bajt AND 1) = 1 then
          x = k + 7
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     End If
End Sub

Sub BajtZnaku(bajt as Byte, px as Integer, y as Integer)
     Dim x as Integer
     x = px
     if (bajt AND 128) = 128 then
          obrBMP.Pset x, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 64) = 64 then
          obrBMP.Pset x + 1, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 1, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 32) = 32 then
          obrBMP.Pset x + 2, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 2, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 16) = 16 then
          obrBMP.Pset x + 3, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 3, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 8) = 8 then
          obrBMP.Pset x + 4, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 4, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 4) = 4 then
          obrBMP.Pset x + 5, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 5, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 2) = 2 then
          obrBMP.Pset x + 6, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 6, y, AtariBarva(SetCol(2))
     End If
     if (bajt AND 1) = 1 then
          obrBMP.Pset x + 7, y, AtariBarva(SetCol(1))
     Else
          obrBMP.Pset x + 7, y, AtariBarva(SetCol(2))
     End If
End Sub

Sub ZnakSaduPrevest()
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim k as Integer
     dim pom as String
     dim delka as integer
     Vymazat
      if palzmena = 0 then
          obrPam.Position = 0
          setCol(0) = 15
          lblSetCol0.Color = AtariBarva(SetCol(0))
          SetCol(1) = 0
          lblSetCol1.Color = AtariBarva(SetCol(1))
          SetCol(2) = 15
          lblSetCol2.Color = AtariBarva(SetCol(2))
          SetCol(3) = 0
          lblSetCol3.Color = AtariBarva(SetCol(3))
      end if
     obrBMP.FillRect(0,0,320,192,AtariBarva(SetCol(0)))
     obrPam.Position = 0
     delka = 0
     For j = 0 to 4
          For l = 0 to 25
               x = 4 + l * 12
               k = k + 1
               For i = 0 to 7
                    y = 44 + j * 30
                    delka = delka + 1
                    if delka <= obrPam.Size then
                         b = obrPam.ReadNum(1)
                         BajtZnaku b, x, y + i
                         b = b XOR 255
                         BajtZnaku b, x, y + 12 + i
                    end if

               Next i
               Obnovit
          Next l
     Next j
     obrBMP.TextOut((320 - obrBMP.TextWidth(BezCesty(soubor))) / 2,10,BezCesty(soubor),AtariBarva(SetCol(1)),AtariBarva(SetCol(0)))
     Obnovit
End Sub

Sub MicPrevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     If palzmena = 0 then
          obrPam.Position = 7681
          SetCol(1) = obrPam.ReadNum(1)
          Setcol(2) = obrPam.ReadNum(1)
          SetCol(3) = obrPam.ReadNum(1)
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
     End if
     obrPam.Position = 0
     delka = 0
     For j = 0 to 191
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR15 b, l, j
          Next l
     Next j
     Obnovit
End Sub

Sub GR15Prevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     obrPam.Position = 0
     If palzmena = 0 then
          For i = 1 to 4
               SetCol(i) = obrPam.ReadNum(1)
          Next i
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
          lblSetCol4.Color = Ataribarva(SetCol(4))
     Else
          For i = 1 to 5
               b = obrPam.ReadNum(1)
          Next i
     End If
     '********* Vykreslovani

     delka = 0
     For j = 0 to 191
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR15 b, l, j
          Next l
     Next j
     Obnovit
End Sub

Sub DRWPrevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     If palzmena = 0 then
          obrPam.Position = 3841
          SetCol(2) = obrPam.ReadNum(1)
          Setcol(3) = obrPam.ReadNum(1)
          SetCol(1) = obrPam.ReadNum(1)
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
     End if
     obrPam.Position = 0
     delka = 0
     For j = 0 to 190 Step 2
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR15 b, l, j
               BajtGR15 b, l, j + 1
          Next l
     Next j
     Obnovit

End Sub

Sub GR7Prevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     obrPam.Position = 0
     If palzmena = 0 then
          SetCol(1) = obrPam.ReadNum(1)
          Setcol(2) = obrPam.ReadNum(1)
          SetCol(3) = obrPam.ReadNum(1)
          SetCol(4) = obrPam.ReadNum(1)
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
          lblSetCol4.Color = Ataribarva(SetCol(4))
     Else
          For i = 1 to 5
               b = obrPam.ReadNum(1)
          Next i
     End if
     delka = 0
     For j = 0 to 190 Step 2
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR15 b, l, j
               BajtGR15 b, l, j + 1
          Next l
     Next j
     Obnovit
End Sub

Sub GR3Prevest(jak as Integer)
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     obrPam.Position = 0
     If palzmena = 0 then
          SetCol(1) = obrPam.ReadNum(1)
          Setcol(2) = obrPam.ReadNum(1)
          SetCol(3) = obrPam.ReadNum(1)
          SetCol(4) = obrPam.ReadNum(1)
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
          lblSetCol4.Color = Ataribarva(SetCol(4))
     Else
          For i = 1 to 5
               b = obrPam.ReadNum(1)
          Next i
     End if
     delka = 0
     For j = 0 to 191 Step 8
          For l = 0 to 319 step 32
               delka = delka + 1
               if delka < obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR3 b, l, j
          Next l
     Next j
     frmPicView.Caption = Str$(delka)
     Obnovit
End Sub

Sub GR5Prevest(jak as Integer)
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     obrPam.Position = 0
     If palzmena = 0 then
          SetCol(1) = obrPam.ReadNum(1)
          Setcol(2) = obrPam.ReadNum(1)
          SetCol(3) = obrPam.ReadNum(1)
          SetCol(4) = obrPam.ReadNum(1)
          SetCol(0) = obrPam.ReadNum(1)
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
          lblSetCol4.Color = Ataribarva(SetCol(4))
     Else
          For i = 1 to 5
               b = obrPam.ReadNum(1)
          Next i
     End if
     delka = 0
     For j = 0 to 191 Step 4
          For l = 0 to 319 step 16
               delka = delka + 1
               if delka < obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR5 b, l, j
          Next l
     Next j
     Obnovit
End Sub

Sub FWAPrevest(jak as Integer)
     Dim X as Integer
     Dim y as integer
     Dim i as integer
     Dim l as integer
     dim b as byte
     dim c as byte
     dim pom as String
     dim delka as integer
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     '********* Naètení barev do barvových registrù
     obrPam.Position = 0
     b = obrPam.ReadNum(1)
     c = obrPam.ReadNum(1)
     if (b<>254 or c<>254) and mnuWarnings.Checked = True then
          if soubor<>"" then
               MessageBox("Obrázek pravdìpodobnì není formátu Fun With Art!", "POZOR", 0)
          end if
     end if
     If palzmena = 0 then
          For i = 0 to 3
               SetCol(i) = obrPam.ReadNum(1)
          Next i
          lblSetCol0.Color = Ataribarva(SetCol(0))
          lblSetCol1.Color = Ataribarva(SetCol(1))
          lblSetCol2.Color = Ataribarva(SetCol(2))
          lblSetCol3.Color = Ataribarva(SetCol(3))
          lblSetCol4.Color = Ataribarva(SetCol(4))
     Else
          For i = 1 to 4
               b = obrPam.ReadNum(1)
          Next i
     End If
     For i = 7 to 262
          b = obrPam.ReadNum(1)
     next i
     '********* Vykreslovani
     delka = 0
     For j = 0 to 191
          if j = 102 then
               for l = 1 to 16
                    b = obrPam.ReadNum(1)
               next l
          end if
          For l = 0 to 39
               delka = delka + 1
               if delka <= obrPam.Size then
                    b = obrPam.ReadNum(1)
               else
                    b = 0
               end if
               if jak <> 0 then
                    b = b XOR 255
               End If
               BajtGR15 b, l, j
          Next l
     Next j
     Obnovit
End Sub

Sub BajtGR15(bajt as Byte, p as Integer, y as Integer)
     Dim pom as byte
     Dim kterabarva as Integer
     Dim k as Integer
     k = 8 * p
     Pom = bajt
     kterabarva = pom Mod 4
     obrBMP.PSet k + 6, y, AtariBarva(SetCol(kterabarva))
     obrBMP.PSet k + 7, y, AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.PSet k + 4, y, AtariBarva(SetCol(kterabarva))
     obrBMP.PSet k + 5, y, AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.PSet k + 2, y, AtariBarva(SetCol(kterabarva))
     obrBMP.PSet k + 3, y, AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.PSet k + 0, y, AtariBarva(SetCol(kterabarva))
     obrBMP.PSet k + 1, y, AtariBarva(SetCol(kterabarva))
End Sub

Sub pokus(sender as QMenuItem)
   obrBMP.FillRect 0,0,319,191,&HFFFFFF
   obrBMP.Rectangle 0,0,319,191,&HFF0000
   obrBMP.Line 0,0,319,191,&H00FF00
   obrBMP.Circle 50,50,100,100,&H0000FF,&H00FFFF
   obrBMP.Rectangle 200,100,250,180,&HFF00FF
   obrBMP.FillRect 201,101,249,179,&H0000FF
   obnovit
End Sub

Sub BajtGR3(bajt as Byte, px as Integer, py as Integer)
     Dim pom as byte
     Dim kterabarva as Integer
     Dim k as Integer
     pom = bajt
     kterabarva = pom Mod 4
     obrBMP.FillRect px +24,py,px + 32,py + 8,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px + 16,py,px + 24,py + 8,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px + 8,py,px + 16,py + 8,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px,py,px + 8,py + 8,AtariBarva(SetCol(kterabarva))
End Sub

Sub BajtGR5(bajt as Byte, px as Integer, py as Integer)
     Dim pom as byte
     Dim kterabarva as Integer
     Dim k as Integer
     pom = bajt
     kterabarva = pom Mod 4
     obrBMP.FillRect px +12,py,px + 16,py + 4,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px + 8,py,px + 12,py + 4,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px + 4,py,px + 8,py + 4,AtariBarva(SetCol(kterabarva))
     pom = pom \ 4
     kterabarva = pom Mod 4
     obrBMP.FillRect px,py,px + 4,py + 4,AtariBarva(SetCol(kterabarva))
End Sub

Function NactiKoaInfo() as Integer
     Dim i as integer
     Dim b as Byte
     obrPam.Position = 0
     'identifikacni bajty
     koaInfID = ""
     For i = 1 to 4
          koaInfId = koaInfId & Chr$(obrPam.ReadNum(1))
     next i
     'delka hlavicky
     koaInfHedLen = obrPam.ReadNum(1) + 256 * obrPam.ReadNum(1)
     'verze programu Koala
      koaInfVer = obrPam.ReadNum(1)
     'komprese
      koaInfKomp = obrPam.ReadNum(1)
      'graficky mod
      koaInfGrMod = obrPam.ReadNum(1)
      'konfigurace obrazove pameti
      koaInfMem = ""
      For i = 1 to 4
           koaInfMem = koaInfMem & Chr$(obrPam.ReadNum(1))
      next i
      'obsah barvovych registru
      koaInfCol708 = obrPam.ReadNum(1)
      koaInfCol709 = obrPam.ReadNum(1)
      koaInfCol710 = obrPam.ReadNum(1)
      koaInfCol711 = obrPam.ReadNum(1)
      koaInfCol712 = obrPam.ReadNum(1)
      'delka souboru
      koaInfFileLen = obrPam.ReadNum(1) + 256 * obrPam.ReadNum(1)
      'rezerva
      koaInfRezerve = Chr$(obrPam.ReadNum(1)) & Chr$(obrPam.ReadNum(1))
      'nazev obrazku
      koaInfNazev = Chr$(obrPam.ReadNum(1))
      'autor obrazku
      koaInfAuthor = Chr$(obrPam.ReadNum(1))
      'poznamky
      koaInfPozn1 = Chr$(obrPam.ReadNum(1))
      koaInfPozn2 = Chr$(obrPam.ReadNum(1))
      'konec hlavicky
      koaInfHedEnd = obrPam.ReadNum(1)
      if koaInfId = (Chr$(255) & Chr$(128) & Chr$(201) & Chr$(199)) then
           NactiKoaInfo = 1
      Else
           NactiKoaInfo = 0
      End If
End Function

SUb ShowKoaInfo()
     Dim CrLf as String
     Dim pom as String
     Dim i as Integer

     CrLf = Chr$(13) & Chr$(10)
     if NactiKoaInfo <> 1 then
          pom = "Obrázek Není Formátu KOALA!"
     else
          pom = "Identifikace formátu: "
          For i = 1 to 4
               pom = pom & Str$(Asc(Mid$(koaInfId,i,1)))
               if i<4 then
                    pom = pom & ", "
               End If
          Next i
          pom = pom & " - Formát KOALA!" & & CrLf
          pom = pom & "Délka hlavièky: " & Str$(koaInfHedLen) & CrLf
          pom = pom & "Verze programu KOALA: " & Str$(koaInfVer) & CrLf
          pom = pom & "Druh komprese: " & Str$(koaInfKomp)
          If koaInfKomp = 0 then
               pom = pom & " - bez komprese" & CrLf
          else
               If koaInfKomp = 1 then
                    pom = pom & " - svislá komprese" & CrLf
               Else
                    If koaInfKomp = 2 then
                         pom = pom & " - vodorovná komprese" & CrLf
                    Else
                         pom = pom & " - NEZNÁMÁ komprese!" & CrLf
                    End IF
               End if
          End if
          pom = pom & "Grafický mod ANTIC: " &  & Str$(koaInfGrMod) & CrLf
          pom = pom & "Konfigurace obrazové pamìti: "
          For i = 1 to 4
               pom = pom & Str$(Asc(Mid$(koaInfMem,i,1)))
               if i<4 then
                    pom = pom & ", "
               End If
          Next i
          pom = pom & CrLf
          pom = pom & "Obsahy barvových registrù 708 až 712: "
          pom = pom & Str$(koaInfCol708) & ", " & Str$(koaInfCol709) & ", "
          pom = pom & Str$(koaInfCol710) & ", " & Str$(koaInfCol711) & ", "
          pom = pom & Str$(koaInfCol712) & CrLf
          pom = pom & "Délka souboru zmenšená o 1 bajt: " &  & Str$(koaInfFileLen) & CrLf
          pom = pom & "Rezerva: " & Str$(Asc(Mid$(koaInfMem,1,1))) & ", " & Str$(Asc(Mid$(koaInfMem,2,1))) & CrLf
          pom = pom & "Název obrázku: " & koaInfNazev & CrLf
          pom = pom & "Autor obrázku: " & koaInfAuthor & CrLf
          pom = pom & "Poznámka 1: " & koaInfPozn1 & CrLf
          pom = pom & "Poznámka 2: " & koaInfPozn2 & CrLf
          pom = pom & "Konec hlavièky: " & Str$(koaInfHedEnd)
     End If
     MessageBox(pom, "Koala Info", 0)
End Sub

Sub KoaPrevest(jak as Integer)
     Dim b as Byte
     Dim bkod as Byte
     Dim i as Integer
     dim kolik as Integer
     Dim koliklo as Byte
     Dim kolikhi as Byte
     Dim koaflag as Byte
     obrBMP.Monochrome = chkMono.Checked
     Vymazat
     koaflag = 0
     if NactiKoaInfo <> 1 then
          if mnuWarnings.Checked then
               MessageBox("Obrázek není formátu Koala!", "Koala Info", 0)
          End If
     else
          if mnuWarnings.Checked then
               ShowKoaInfo
          End If
          if palzmena = 0 then
               SetCol(0) = koaInfCol712
               SetCol(1) = koaInfCol708
               SetCol(2) = koaInfCol709
               SetCol(3) = koaInfCol710
               SetCol(4) = koaInfCol711
               lblSetCol0.Color = Ataribarva(SetCol(0))
               lblSetCol1.Color = Ataribarva(SetCol(1))
               lblSetCol2.Color = Ataribarva(SetCol(2))
               lblSetCol3.Color = Ataribarva(SetCol(3))
               lblSetCol4.Color = Ataribarva(SetCol(4))
               frmPicView.Repaint
          End If

          if koaInfKomp = 0 then
               For ukazatel = 0 to 7679
                    bkod = obrPam.ReadNum(1)
                    if jak <> 0 then
                         bkod = bkod XOR 255
                    End If
                    KoaSou2 2
                    BajtGR15 bkod, koax, koay
               Next ukazatel
          Else
            ukazatel = 0
            koax = 0
            koay = 0
            While (ukazatel < 7679) AND (koaflag = 0)
               b = obrPam.ReadNum(1)
               If (b>0) and (b <=127) then
                    bkod = obrPam.ReadNum(1)
                    if jak <> 0 then
                         bkod = bkod XOR 255
                    End If
                    kolik = b
                    For i = 1 to kolik
                         BajtGR15 bkod, koax, koay
                         Koasou2 koaInfKomp
                         ukazatel = ukazatel + 1
                    Next i
               else
                    If b=0 then

                         kolikhi = obrPam.ReadNum(1)
                         koliklo = obrPam.ReadNum(1)
                         kolik = koliklo + 256 * kolikhi
                         bkod = obrPam.ReadNum(1)
                         if jak <> 0 then
                              bkod = bkod XOR 255
                         End If
                         For i = 1 to kolik
                              BajtGR15 bkod, koax, koay
                              Koasou2 koaInfKomp
                              ukazatel = ukazatel + 1
                         next i
                    Else
                         if b = 128 then
                              kolikhi = obrPam.ReadNum(1)
                              koliklo = obrPam.ReadNum(1)
                              kolik = koliklo + 256 * kolikhi
                              For i = 1 to kolik
                                   bkod = obrPam.ReadNum(1)
                                   if jak <> 0 then
                                        bkod = bkod XOR 255
                                   End If
                                   BajtGR15 bkod, koax, koay
                                   Koasou2 koaInfKomp
                                   ukazatel = ukazatel + 1
                              Next i
                         Else
                              kolik = b - 128
                              For i = 1 to kolik
                                   bkod = obrPam.ReadNum(1)
                                   if jak <> 0 then
                                        bkod = bkod XOR 255
                                   End If
                                   BajtGR15 bkod, koax, koay
                                   Koasou2 koaInfKomp
                                   ukazatel = ukazatel + 1
                              Next i
                         End if
                    End if
               End if
            Wend
          End If
     end if
     Obnovit
End Sub

Sub KoaSou2(kterak as Byte)
     If kterak = 1 then
          koay = koay + 2
          if koay = 192 then
               koay = 1
          end if
          if koay = 193 then
               koay = 0
               koax = koax + 1
          end if
          if x = 40 then
               koaflag = 112
          End if
     else
          koax++
          if koax = 40 then
               koay++
               koax = 0
          end if
          if y>191 then
               koaglag = 111
          End if
     End If
End Sub

Sub obnovit()
     canPic.Draw 0, 0, obrBMP.BMP
End Sub

Sub Negativ()
     Zobrazit
End Sub

Sub obrPamClear()
    Dim i as Integer
    Dim kuk as String
    kuk = ""
    For i = 1 to 7680
         kuk = kuk & chr$(0)
    Next i
    obrpam.WriteStr(kuk, Len(kuk))
End Sub

Sub Ukazat()
     parsoubor = Command$(1)
     parformat = Command$(2)
     parzobrazit = Command$(3)
     parsavename = Command$(4)
     if parsoubor<>"" then
          NacistSoubor(parsoubor)
          Zobrazit
          ZapsatPanely
     End if
     cas1.Enabled = False
End Sub

Sub chkMonoClick()
     Zobrazit
End Sub

Sub BarvoveRegistry()
     Setcol(1) = 154
     lblSetCol1.Color = AtariBarva(SetCol(1))
     SetCol(2) = 148
     lblSetCol2.Color = AtariBarva(SetCol(2))
     SetCol(3) = 15
     lblSetCol3.Color = AtariBarva(SetCol(3))
     SetCol(4) = 0
     lblSetCol4.Color = AtariBarva(SetCol(4))
End Sub

$Include "ABarvy.INC"
$Include "defsada.INC"

Sub CrFrmPaleta()
      Dim i as Integer
      Dim j as Integer
      Dim k as Integer

      frmPaleta.Caption = "Paleta barev"
      frmPaleta.Width   = 477
      frmPaleta.Height  = 365
      frmPaleta.BorderStyle = bsDialog

     For i = 0 to 15
          For j = 0 to 15
               k = 16 * i + j
               ctverecek(k).AutoSize = False
               ctverecek(k).Parent = frmPaleta
               ctverecek(k).Height = 13
               ctverecek(k).Width = 13
               ctverecek(k).Top = 10 + i * 15
               ctverecek(k).Left = 10 + j * 15
               ctverecek(k).Color = AtariBarva(k)
               ctverecek(k).Hint = Str$(k)
               ctverecek(k).ShowHint = True
               ctverecek(k).OnClick = Klik
               ctverecek(k).OnDblClick = DKlik
          Next j
     Next I

     butOk.Parent = frmPaleta
     butOk.Top = ctverecek(255).Top + 22
     butOk.Left = ctverecek(253).Left
     butOk.Width = 43
     butOk.Height = 22
     butOk.Caption = "OK"
     butOK.OnClick = butOKClick

     frmPaleta.Top = frmPicView.Top + 50
     frmPaleta.Left = frmPicView.Left + 50
     frmPaleta.Width = 266 '26 + 16 * 15
     frmPaleta.Height = frmPaleta.Width + 54
End SUb

Sub klik(Sender as QLabel)
     frmPaleta.Hint = sender.Hint
     frmPaleta.Color = AtariBarva(Val(sender.Hint))
End Sub

Sub DKlik(Sender as QLabel)
     frmPaleta.Hint = sender.Hint
     frmPaleta.Color = AtariBarva(Val(sender.Hint))
     frmPaleta.Close
End Sub

Sub CrFrmSada()
     frmSada.Height = 126
     frmSada.Width = 138
     frmSada.BorderStyle = bsDialog
     frmsada.Center
     frmSada.OnShow = cansadaobnovit
     canSada.Parent = frmSada
     cansada.Left = 2
     cansada.Top = 2
     cansada.Width = 128
     cansada.Height = 64
     cansada.Color = &HFFFFFF
     cansada.OnPaint = canSadaObnovit
     butSadaOK.Parent = frmSada
     butSadaOk.Top = cansada.Top + cansada.Height + 4
     butSadaOk.Height = 20
     butSadaOk.Width = 30
     butSadaOk.Left = cansada.Left + cansada.Width - butSadaOk.Width
     butSadaOK.Caption = "OK"
     butSadaOK.OnClick = ButSadaOKClick
End Sub

Sub ButSadaOKClick(sender as QButton)
     frmSada.Close
End Sub

Sub fontShow()
     Dim i as Integer
     Dim j as Integer
     Dim k as Integer
     Dim n as Integer
     Dim x as Integer
     Dim y as Integer
     Dim bajt as Byte
     sadaBMP.Width = cansada.Width
     sadaBMP.Height = cansada.Height
     sadaBMP.FillRect 0, 0, 128,64, &HFFFFFF
     n = 0
     For i = 0 to 7
          y = 8 * i
          For j = 0 to 15
               x = 8 * j
               For k = 0 to 7
                    bajt = poleSada(n)
                    if (bajt AND 128) = 128 then
                         sadaBMP.Pset x, y + k, &H000000
                    End If
                    if (bajt AND 64) = 64 then
                         sadaBMP.Pset x + 1, y + k, &H000000
                    End If
                    if (bajt AND 32) = 32 then
                         sadaBMP.Pset x + 2, y + k, &H000000
                    End If
                    if (bajt AND 16) = 16 then
                         sadaBMP.Pset x + 3, y + k, &H000000
                    End If
                    if (bajt AND 8) = 8 then
                         sadaBMP.Pset x + 4, y + k, &H000000
                    End If
                    if (bajt AND 4) = 4 then
                         sadaBMP.Pset x + 5, y + k, &H000000
                    End If
                    if (bajt AND 2) = 2 then
                         sadaBMP.Pset x + 6, y + k, &H000000
                    End If
                    if (bajt AND 1) = 1 then
                         sadaBMP.Pset x + 7, y + k, &H000000
                    End If
                    n = n + 1
               next k
          Next i
     Next i
     cansada.Draw 0, 0, sadaBMP.BMP
     frmSada.Caption = BezCesty(sada)
End Sub

Sub CanSadaObnovit()
     canSada.Draw 0, 0, sadaBMP.BMP
End Sub


Sub VykreslitRamecek(sender as QLabel)
    Dim key as Integer
    Dim rbarva as Long
    key = sender.Tag
    barstatus.SimpleText = Str$(key)
    if key = 0  then
             rbarva = 256*65536 - lblSetCol0.Color
             ramecek.Top = lblSetCol0.Top - 2
             ramecek.Left = lblSetCol0.Left - 2
             ramecek.Rectangle 0,0,16,16,rbarva
             ramecek.Rectangle 1,1,15,15,rbarva
    End If
    If key = 1  then
             rbarva = 256*65536 - lblSetCol1.Color
             ramecek.Top = lblSetCol1.Top - 2
             ramecek.Left = lblSetCol1.Left - 2
             ramecek.Rectangle 0,0,16,16,rbarva
             ramecek.Rectangle 1,1,15,15,rbarva
     End if
     if key = 2 then
             rbarva = 256*65536 - lblSetCol2.Color
             ramecek.Top = lblSetCol2.Top - 2
             ramecek.Left = lblSetCol2.Left - 2
             ramecek.Rectangle 0,0,16,16,rbarva
             ramecek.Rectangle 1,1,15,15,rbarva
      End If
      If key = 3 then
             rbarva = 256*65536 - lblSetCol3.Color
             ramecek.Top = lblSetCol3.Top - 2
             ramecek.Left = lblSetCol3.Left - 2
             ramecek.Rectangle 0,0,16,16,rbarva
             ramecek.Rectangle 1,1,15,15,rbarva
      End If
      If key = 4 then
             rbarva = 256*65536 - lblSetCol4.Color
             ramecek.Top = lblSetCol4.Top - 2
             ramecek.Left = lblSetCol4.Left - 2
             ramecek.Rectangle 0,0,16,16,rbarva
             ramecek.Rectangle 1,1,15,15,rbarva
      End If
    ramecek.Visible = True
End Sub

Sub Pokusna(sender as QLabel)
    barstatus.SimpleText = Str$(Sender.Tag)
End Sub

Sub VypnoutRamecek()
    ramecek.Visible = False
End Sub

Sub butOKClick(sender as QButton)
     frmPaleta.Close
End Sub

Sub NastavBarvu(sender as QLabel)
    Dim i as Integer
    Dim BarReg as Integer
    Dim ddd as String
    BarReg = sender.Tag
    For i = 0 to 255
         ctverecek(i).Color = AtariBarva(i)
    Next i
    frmPaleta.Hint = Str$(BarReg)
    frmPaleta.Color = AtariBarva(SetCol(BarReg))
    frmPaleta.Caption = paleta
    frmPaleta.ShowModal
    SetCol(BarReg) = Val(frmPaleta.Hint)
    Sender.Color = AtariBarva(SetCol(BarReg))
    palzmena = 1
    if mnuPalRedraw.Checked = True then
         Zobrazit
    end if

End Sub

Sub Nastartovat()
     cas1.Interval = 50
     cas1.Enabled = True
End Sub

Sub ZapsatPanely()
     barStatus.Clear
     barStatus.AddPanels Str$(aktvelikost), CurrFormat, BezCesty(paleta), BezCesty(sada)
     barstatus.Panel(0).Width = 50
     barstatus.Panel(1).Width = 85
     barstatus.Panel(2).Width = 85
End SUb


Sub frmPicViewKeyPress(Key AS BYTE)
     Showmessage Str$(Key)
End Sub


Function BezCesty(co as String) as String
     Dim i as Integer
     Dim velco as Integer
     Dim k as Integer
     velco = Len(co)
     k = 0
     For i = velco to 1 Step - 1
          If Mid$(co, i, 1) = "\" then
               Exit For
          End if
          k = k + 1
     Next i
     BezCesty = Right$(co,k)
End Function

'******************************
'Hlavní program
'******************************

cas1.OnTimer = Ukazat
mnuDefPalClick
mnuDefFontClick
mnupalRedraw.Checked = true
mnuFontRedraw.Enabled = False
obrBMP.Height = canPic.Height
obrBMP.Width = canPic.Width
sadaBMP.Height = canPic.Height
sadaBMP.Width = canPic.Width

openFilter = "Design Master (*.pic)|*.pic|Všechny soubory (*.*)|*.*"
CurrFormat = mnuDmaster.Caption
aktvelikost = 0
BarvoveRegistry
CrFrmPaleta
CrFrmSada
ZapsatPanely
frmPicView.Center
frmPicView.ShowModal
