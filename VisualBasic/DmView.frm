VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmDmView 
   Caption         =   "ATARI Pictures Viewer"
   ClientHeight    =   5820
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10425
   LinkTopic       =   "Form1"
   ScaleHeight     =   388
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   695
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton butKoala 
      Caption         =   "Koala"
      Height          =   330
      Left            =   9135
      TabIndex        =   26
      Top             =   90
      Width           =   1170
   End
   Begin VB.CommandButton butMicro 
      Caption         =   "Micro Painter"
      Height          =   330
      Left            =   7875
      TabIndex        =   25
      Top             =   105
      Width           =   1170
   End
   Begin VB.CommandButton butRepaint 
      Caption         =   "Repaint"
      Height          =   330
      Left            =   4305
      TabIndex        =   24
      Top             =   1050
      Width           =   960
   End
   Begin VB.CommandButton butGRAPHICS15 
      Caption         =   "Graphics 15"
      Height          =   330
      Left            =   6720
      TabIndex        =   18
      Top             =   105
      Width           =   1065
   End
   Begin VB.FileListBox lstFile1 
      Height          =   2430
      Left            =   105
      TabIndex        =   4
      Top             =   3255
      Width           =   2430
   End
   Begin VB.CommandButton butNegativ 
      Caption         =   "Negative"
      Height          =   330
      Left            =   6720
      TabIndex        =   17
      Top             =   1470
      Width           =   855
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   330
      Left            =   6090
      TabIndex        =   16
      Top             =   525
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   582
      _Version        =   393216
      Max             =   1000
      Enabled         =   -1  'True
   End
   Begin VB.TextBox txtVynechat 
      Alignment       =   1  'Right Justify
      Height          =   330
      Left            =   5565
      TabIndex        =   14
      Text            =   "0"
      Top             =   525
      Width           =   435
   End
   Begin VB.CommandButton butHumble 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Humble Design"
      Height          =   330
      Left            =   5355
      TabIndex        =   11
      ToolTipText     =   "Displays selected picture."
      Top             =   105
      Width           =   1275
   End
   Begin VB.CommandButton butViewMAD 
      BackColor       =   &H00C0C0C0&
      Caption         =   "MAD Design"
      Height          =   330
      Left            =   3990
      TabIndex        =   10
      ToolTipText     =   "Displays selected picture."
      Top             =   105
      Width           =   1275
   End
   Begin VB.CommandButton butAbout 
      Caption         =   "About"
      Height          =   330
      Left            =   2625
      TabIndex        =   9
      Top             =   1470
      Width           =   750
   End
   Begin VB.TextBox txtPattern 
      Height          =   330
      Left            =   105
      TabIndex        =   8
      Text            =   "*.*"
      Top             =   105
      Width           =   2430
   End
   Begin VB.CommandButton butSave 
      Caption         =   "Convert To BMP"
      Height          =   330
      Left            =   3780
      TabIndex        =   7
      ToolTipText     =   "Converts picture to bmp format and saves that one into the same directory."
      Top             =   1470
      Width           =   1485
   End
   Begin VB.CommandButton butSaveAs 
      Caption         =   "BMP Save As"
      Height          =   330
      Left            =   5355
      TabIndex        =   6
      ToolTipText     =   "Converts picture to BMP format and saves that one with selected file name."
      Top             =   1470
      Width           =   1275
   End
   Begin VB.CommandButton butView 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Design Master"
      Height          =   330
      Left            =   2625
      TabIndex        =   5
      ToolTipText     =   "Displays selected picture."
      Top             =   105
      Width           =   1275
   End
   Begin VB.DirListBox lstDir1 
      Height          =   2115
      Left            =   105
      TabIndex        =   3
      Top             =   945
      Width           =   2430
   End
   Begin VB.DriveListBox lstDrive1 
      Height          =   315
      Left            =   105
      TabIndex        =   2
      Top             =   525
      Width           =   2430
   End
   Begin VB.CommandButton butExit 
      Caption         =   "Exit"
      Height          =   330
      Left            =   7665
      TabIndex        =   1
      Top             =   1470
      Width           =   750
   End
   Begin VB.PictureBox obr1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      Height          =   2880
      Left            =   2655
      ScaleHeight     =   196.085
      ScaleMode       =   0  'User
      ScaleWidth      =   324.051
      TabIndex        =   0
      Top             =   1890
      Width           =   4800
   End
   Begin VB.Label labBarva 
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   225
      Index           =   4
      Left            =   3885
      TabIndex        =   23
      Top             =   1155
      Width           =   225
   End
   Begin VB.Label labBarva 
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   225
      Index           =   3
      Left            =   3570
      TabIndex        =   22
      Top             =   1155
      Width           =   225
   End
   Begin VB.Label labBarva 
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   225
      Index           =   2
      Left            =   3255
      TabIndex        =   21
      Top             =   1155
      Width           =   225
   End
   Begin VB.Label labBarva 
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   225
      Index           =   1
      Left            =   2940
      TabIndex        =   20
      Top             =   1155
      Width           =   225
   End
   Begin VB.Label labBarva 
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Height          =   225
      Index           =   0
      Left            =   2625
      TabIndex        =   19
      Top             =   1155
      Width           =   225
   End
   Begin VB.Label lblVynechat 
      Caption         =   "Vynechat:"
      Height          =   330
      Left            =   4725
      TabIndex        =   15
      Top             =   525
      Width           =   750
   End
   Begin VB.Label lblDelka2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H80000009&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "0"
      Height          =   330
      Left            =   3255
      TabIndex        =   13
      Top             =   525
      Width           =   1065
   End
   Begin VB.Label lblDelka 
      Caption         =   "Délka:"
      Height          =   225
      Left            =   2625
      TabIndex        =   12
      Top             =   525
      Width           =   540
   End
End
Attribute VB_Name = "frmDmView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
  
  Const DelDMaster = 7680
  Const ColDMaster = 40
  Const RowDMaster = 192
  Const DelMAD = 16384
  Const ColMAD = 64
  Const RowMAD = 256
  Const DMaster = "DMaster"
  Const MAD = "MAD"
  Const HumbleD = "HumbleD"
  Const Graphics15 = "Graphics15"
  Const DelG15 = 7685
  Const ColG15 = 40
  Const RowG15 = 192
  Const MicroP = "MicroP"
  Const DelMicroP = 7684
    
  '*************************
  Dim PicFormat As String
  Dim adresar As String
  Dim soubor As String
  Dim jmenosouboru As String
  Dim jeobraz As Boolean
  Dim buffer As String
  Dim fvyska As Integer
  Dim fsirka As Integer
  Dim ovyska As Integer
  Dim osirka As Integer
  Dim delsoub As Integer
  Dim Barvy(4) As Long
  Dim AtariBarva(255) As Long
  Dim videobuf As String
  '***************************
  'Variables for Humble Design View
  Dim ukaz As Integer
  Dim fontbuf As String
  Dim mask(7) As Byte
Sub InitAtariBarvy()
    AtariBarva(0) = 0
    AtariBarva(1) = 1842204
    AtariBarva(2) = 3684408
    AtariBarva(3) = 5789784
    AtariBarva(4) = 7895160
    AtariBarva(5) = 9474192
    AtariBarva(6) = 11053224
    AtariBarva(7) = 12369084
    AtariBarva(8) = 13421772
    AtariBarva(9) = 14211288
    AtariBarva(10) = 15000804
    AtariBarva(11) = 15527148
    AtariBarva(12) = 15790320
    AtariBarva(13) = 16316664
    AtariBarva(14) = 16579836
    AtariBarva(15) = 16579836
    AtariBarva(16) = 5176
    AtariBarva(17) = 270428
    AtariBarva(18) = 536704
    AtariBarva(19) = 1328292
    AtariBarva(20) = 2383048
    AtariBarva(21) = 2128096
    AtariBarva(22) = 1872124
    AtariBarva(23) = 1878268
    AtariBarva(24) = 1885436
    AtariBarva(25) = 3460348
    AtariBarva(26) = 5036284
    AtariBarva(27) = 5301500
    AtariBarva(28) = 5567740
    AtariBarva(29) = 7665916
    AtariBarva(30) = 10026236
    AtariBarva(31) = 10026236
    AtariBarva(32) = 268356
    AtariBarva(33) = 1055856
    AtariBarva(34) = 1844380
    AtariBarva(35) = 2111664
    AtariBarva(36) = 2117832
    AtariBarva(37) = 2124000
    AtariBarva(38) = 1868028
    AtariBarva(39) = 2395388
    AtariBarva(40) = 2922748
    AtariBarva(41) = 3714300
    AtariBarva(42) = 4506876
    AtariBarva(43) = 5817596
    AtariBarva(44) = 7128316
    AtariBarva(45) = 8705276
    AtariBarva(46) = 10544380
    AtariBarva(47) = 10544380
    AtariBarva(48) = 267336
    AtariBarva(49) = 792700
    AtariBarva(50) = 1318064
    AtariBarva(51) = 1581256
    AtariBarva(52) = 1844444
    AtariBarva(53) = 3684588
    AtariBarva(54) = 5525752
    AtariBarva(55) = 6316284
    AtariBarva(56) = 7106812
    AtariBarva(57) = 8158460
    AtariBarva(58) = 9211132
    AtariBarva(59) = 10263804
    AtariBarva(60) = 11315452
    AtariBarva(61) = 12368124
    AtariBarva(62) = 13419772
    AtariBarva(63) = 13419772
    AtariBarva(64) = 6816772
    AtariBarva(65) = 7082040
    AtariBarva(66) = 7348336
    AtariBarva(67) = 9185416
    AtariBarva(68) = 10760356
    AtariBarva(69) = 12073144
    AtariBarva(70) = 13384908
    AtariBarva(71) = 14435544
    AtariBarva(72) = 15225064
    AtariBarva(73) = 16014580
    AtariBarva(74) = 16542972
    AtariBarva(75) = 16546044
    AtariBarva(76) = 16286972
    AtariBarva(77) = 16553212
    AtariBarva(78) = 16557308
    AtariBarva(79) = 16557308
    AtariBarva(80) = 7865384
    AtariBarva(81) = 8652864
    AtariBarva(82) = 9440344
    AtariBarva(83) = 10232944
    AtariBarva(84) = 11024520
    AtariBarva(85) = 12599460
    AtariBarva(86) = 14436544
    AtariBarva(87) = 15488208
    AtariBarva(88) = 16538848
    AtariBarva(89) = 16542952
    AtariBarva(90) = 16547056
    AtariBarva(91) = 16550136
    AtariBarva(92) = 16554236
    AtariBarva(93) = 16556284
    AtariBarva(94) = 16558332
    AtariBarva(95) = 16558332
    AtariBarva(96) = 8914996
    AtariBarva(97) = 11274304
    AtariBarva(98) = 13634640
    AtariBarva(99) = 13641828
    AtariBarva(100) = 13649016
    AtariBarva(101) = 13912204
    AtariBarva(102) = 14176416
    AtariBarva(103) = 15489200
    AtariBarva(104) = 16539836
    AtariBarva(105) = 16541892
    AtariBarva(106) = 16544972
    AtariBarva(107) = 16548048
    AtariBarva(108) = 16552148
    AtariBarva(109) = 16555224
    AtariBarva(110) = 16558300
    AtariBarva(111) = 16558300
    AtariBarva(112) = 8395780
    AtariBarva(113) = 10757124
    AtariBarva(114) = 13118472
    AtariBarva(115) = 13909028
    AtariBarva(116) = 14437444
    AtariBarva(117) = 15489100
    AtariBarva(118) = 16541784
    AtariBarva(119) = 16544868
    AtariBarva(120) = 16547952
    AtariBarva(121) = 16552064
    AtariBarva(122) = 16556176
    AtariBarva(123) = 16558228
    AtariBarva(124) = 16560284
    AtariBarva(125) = 16563372
    AtariBarva(126) = 16566464
    AtariBarva(127) = 16566464
    AtariBarva(128) = 8913932
    AtariBarva(129) = 10491936
    AtariBarva(130) = 11807800
    AtariBarva(131) = 12860488
    AtariBarva(132) = 14175320
    AtariBarva(133) = 15489120
    AtariBarva(134) = 16540776
    AtariBarva(135) = 16544888
    AtariBarva(136) = 16549000
    AtariBarva(137) = 16551056
    AtariBarva(138) = 16554136
    AtariBarva(139) = 16556196
    AtariBarva(140) = 16559280
    AtariBarva(141) = 16562360
    AtariBarva(142) = 16564416
    AtariBarva(143) = 16564416
    AtariBarva(144) = 5777436
    AtariBarva(145) = 7616540
    AtariBarva(146) = 9455644
    AtariBarva(147) = 11295772
    AtariBarva(148) = 12873756
    AtariBarva(149) = 13403184
    AtariBarva(150) = 14194760
    AtariBarva(151) = 15509580
    AtariBarva(152) = 16561236
    AtariBarva(153) = 16565360
    AtariBarva(154) = 16570508
    AtariBarva(155) = 16570512
    AtariBarva(156) = 16571544
    AtariBarva(157) = 16573612
    AtariBarva(158) = 16574656
    AtariBarva(159) = 16574656
    AtariBarva(160) = 16428
    AtariBarva(161) = 20536
    AtariBarva(162) = 24644
    AtariBarva(163) = 1079360
    AtariBarva(164) = 2135100
    AtariBarva(165) = 2923592
    AtariBarva(166) = 3713108
    AtariBarva(167) = 5553244
    AtariBarva(168) = 7393376
    AtariBarva(169) = 7921768
    AtariBarva(170) = 8713328
    AtariBarva(171) = 9238652
    AtariBarva(172) = 9763972
    AtariBarva(173) = 10812568
    AtariBarva(174) = 11861164
    AtariBarva(175) = 11861164
    AtariBarva(176) = 540680
    AtariBarva(177) = 545804
    AtariBarva(178) = 813072
    AtariBarva(179) = 818192
    AtariBarva(180) = 1085460
    AtariBarva(181) = 1352728
    AtariBarva(182) = 1357852
    AtariBarva(183) = 1624092
    AtariBarva(184) = 1628192
    AtariBarva(185) = 2942020
    AtariBarva(186) = 4255852
    AtariBarva(187) = 5043320
    AtariBarva(188) = 5831808
    AtariBarva(189) = 7928984
    AtariBarva(190) = 10026160
    AtariBarva(191) = 10026160
    AtariBarva(192) = 540676
    AtariBarva(193) = 806916
    AtariBarva(194) = 1074180
    AtariBarva(195) = 1340420
    AtariBarva(196) = 1345544
    AtariBarva(197) = 1611784
    AtariBarva(198) = 1879048
    AtariBarva(199) = 1885256
    AtariBarva(200) = 2152580
    AtariBarva(201) = 2418828
    AtariBarva(202) = 2422936
    AtariBarva(203) = 4258984
    AtariBarva(204) = 5831860
    AtariBarva(205) = 7142600
    AtariBarva(206) = 8453340
    AtariBarva(207) = 8453340
    AtariBarva(208) = 799744
    AtariBarva(209) = 1326084
    AtariBarva(210) = 1853452
    AtariBarva(211) = 1858604
    AtariBarva(212) = 2126924
    AtariBarva(213) = 2392152
    AtariBarva(214) = 2658404
    AtariBarva(215) = 2924672
    AtariBarva(216) = 3453088
    AtariBarva(217) = 3719336
    AtariBarva(218) = 4247728
    AtariBarva(219) = 4511940
    AtariBarva(220) = 4776148
    AtariBarva(221) = 5042404
    AtariBarva(222) = 5307632
    AtariBarva(223) = 5307632
    AtariBarva(224) = 12324
    AtariBarva(225) = 14372
    AtariBarva(226) = 278560
    AtariBarva(227) = 1594448
    AtariBarva(228) = 3172480
    AtariBarva(229) = 3440788
    AtariBarva(230) = 3709100
    AtariBarva(231) = 3974336
    AtariBarva(232) = 4240596
    AtariBarva(233) = 3981528
    AtariBarva(234) = 3721440
    AtariBarva(235) = 3463392
    AtariBarva(236) = 3466464
    AtariBarva(237) = 5828844
    AtariBarva(238) = 8191224
    AtariBarva(239) = 8191224
    AtariBarva(240) = 6208
    AtariBarva(241) = 269400
    AtariBarva(242) = 533616
    AtariBarva(243) = 1063052
    AtariBarva(244) = 1855656
    AtariBarva(245) = 2385076
    AtariBarva(246) = 3175612
    AtariBarva(247) = 3704016
    AtariBarva(248) = 4493536
    AtariBarva(249) = 5021932
    AtariBarva(250) = 5811448
    AtariBarva(251) = 6075644
    AtariBarva(252) = 6340860
    AtariBarva(253) = 7390460
    AtariBarva(254) = 8440060
    AtariBarva(255) = 8440060
End Sub


Sub HumbleInit()
  Dim kde As String
  kde = App.Path
  mask(0) = 128
  mask(1) = 64
  mask(2) = 32
  mask(3) = 16
  mask(4) = 8
  mask(5) = 4
  mask(6) = 2
  mask(7) = 1
  Close #1
  Open kde & "\hsdesign.fnt" For Binary Access Read As #1
    fontbuf = Input(1024, #1)
  Close #1
  If Len(fontbuf) <> 1024 Then
    butHumble.Enabled = False
  End If
End Sub
    
Private Sub butAbout_Click()
  frmAbout.Show
End Sub

Sub butExit_Click()
  Unload Me
End Sub

Sub butGRAPHICS15_Click()
  Dim pom As Boolean
  Dim delobr As Integer
  PicFormat = Graphics15
  obr1.ScaleMode = vbPixels
  obr1.ScaleHeight = RowDMaster
  obr1.ScaleWidth = ColDMaster * 8
  obr1.Height = ovyska
  obr1.Width = osirka
  delobr = DelG15
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    If FileLen(jmenosouboru) < delobr + UpDown1.Value Then
      delobr = FileLen(jmenosouboru) - UpDown1.Value
    Else
      pom = NactiG15(jmenosouboru, delobr, ColG15, RowG15, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Private Sub butHumble_Click()
  Dim pom As Boolean
  Dim delobr As Integer
  PicFormat = HumbleD
  obr1.ScaleMode = vbPixels
  obr1.ScaleHeight = RowDMaster
  obr1.ScaleWidth = ColDMaster * 8
  obr1.Height = ovyska
  obr1.Width = osirka
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    delobr = FileLen(jmenosouboru)
    If FileLen(jmenosouboru) <> delobr Then
      MsgBox ("Delka: " & FileLen(jmenosouboru) & Chr(13) & Chr(10) & "Selected file is not picture of selected type!")
    Else
      pom = Nacti(jmenosouboru, delobr, ColDMaster, RowDMaster, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Private Sub butKoala_Click()
  Dim pom As Boolean
  Dim delobr As Long
  'PicFormat = Graphics15
  'obr1.ScaleMode = vbPixels
  'obr1.ScaleHeight = RowDMaster
  'obr1.ScaleWidth = ColDMaster * 8
  'obr1.Height = ovyska
  'obr1.Width = osirka
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  'obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    delobr = FileLen(jmenosouboru)
    If UpDown1.Value > delobr Then
      MsgBox ("Cannto ignore " & Str(UpDown1.Value) & "bytes!")
    Else
      pom = NactiKoala(jmenosouboru, delobr, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Function NactiKoala(obrazek As String, howmany As Long, vynech As Integer) As Boolean
  Dim pom As Boolean
  Dim bx As Integer
  Dim by As Integer
  Dim v As Integer
  Dim i As Integer
  Dim j As Integer
  Dim pocradku As Integer
  Dim pocsloupcu As Integer
  Dim kuk As String
  'On Error GoTo chyba
  buffer = ""
  buffer = Space$(howmany)
  Open obrazek For Binary Access Read As #1
    Get #1, , buffer
  Close #1
  If vynech > 0 Then
    buffer = Right(buffer, Len(buffer) - vynech)
  End If
  NactiKoala = True
  jeobraz = True
  pom = InfoKoala()
  If pom = False Then
    NactiKoala = False
    Exit Function
  Else
    pom = PrevedKoala()
    If pom = False Then
      NactiKoala = False
      Exit Function
    Else
      PicFormat = Graphics15
      pocradku = 192
      pocsloupcu = 40
      NactiBarvy
      v = 5
      For i = 0 To pocradku - 1
        For j = 0 To pocsloupcu - 1
          kuk = Mid(buffer, (pocsloupcu * i + j + 1) + v, 1)
          bx = 8 * j
          ZobrazG15 bx, i, Asc(kuk)
        Next j
      Next i
      NactiKoala = True
    End If
  End If
  Exit Function
chyba:
  Close #1
  NactiKoala = False
End Function
Function PrevedKoala() As Boolean
  Dim pom As Boolean
  Dim bajtuvradku As Integer
  Dim radku As Integer
  Dim i As Integer
  Dim pozice As Integer
  Dim komprese As Byte
  Dim delzahlavi As Integer
  videobuf = ""
  delzahlavi = Asc(Mid(buffer, 5, 1)) + 256 * Asc(Mid(buffer, 6, 1))
  komprese = CByte(Asc(Mid(buffer, 8, 1)))
  bajtuvradku = CByte(Asc(Mid(buffer, 11, 1)))
  radku = CByte(Asc(Mid(buffer, 13, 1)))
  'MsgBox ("Konec záhlaví: " & Str(Asc(Mid(buffer, delzahlavi + 1, 1))))
  pozice = delzahlavi + 2
  If komprese = 0 Then
    videobuf = videobuf & Right(buffer, Len(buffer) - delzahlavi)
  Else
    videobuf = String(7680, Chr(0))
    If komprese = 1 Then
      svisla pozice
    Else
      If komprese = 2 Then
        Vodorovna pozice
      End If
    End If
  End If
  videobuf = Mid(buffer, 14, 5) & videobuf
  buffer = ""
  buffer = videobuf
  PrevedKoala = True
End Function

Sub svisla(ukazatel As Integer)
  Dim i As Long
  Dim kolik As Long
  Dim flag As Byte
  Dim x As Integer
  Dim y As Integer
  Dim kam As Long
  Dim kod As Byte
  Dim lenbuf As Long
  Dim cislo As Byte
  Dim blb1 As Byte
  Dim blb2 As Long
  Dim gogo1 As String
  Dim gogo2 As String
  lenbuf = Len(buffer)
  x = 0
  y = 0
  flag = 0
  While (ukazatel < lenbuf) And (flag = 0)
    kod = Asc(Mid(buffer, ukazatel, 1))
    If kod = 0 Then
      ukazatel = ukazatel + 1
      gogo1 = Mid(buffer, ukazatel + 1, 1)
      gogo2 = Mid(buffer, ukazatel, 1)
      blb1 = Asc(gogo1)
      blb2 = Asc(gogo2)
      blb2 = blb2 * 256
      kolik = blb2 + blb1
      ukazatel = ukazatel + 2
      cislo = CByte(Asc(Mid(buffer, ukazatel, 1)))
      ukazatel = ukazatel + 1
      For i = 1 To kolik
        kam = 40 * y + x + 1
        Mid(videobuf, kam, 1) = Chr(cislo)
        y = y + 2
        If y = 192 Then
          y = 1
        End If
        If y = 193 Then
          y = 0
          x = x + 1
        End If
        If x > 39 Then
          flag = 255
          Exit For
        End If
      Next i
    Else
      If kod < 128 Then
        kolik = kod
        ukazatel = ukazatel + 1
        cislo = Asc(Mid(buffer, ukazatel, 1))
        ukazatel = ukazatel + 1
        For i = 1 To kolik
          kam = 40 * y + x + 1
          Mid(videobuf, kam, 1) = Chr(cislo)
          y = y + 2
          If y = 192 Then
            y = 1
          End If
          If y = 193 Then
            y = 0
            x = x + 1
          End If
          If x > 39 Then
            flag = 255
            Exit For
          End If
        Next i
      Else
        If kod = 128 Then
          ukazatel = ukazatel + 1
          gogo1 = Mid(buffer, ukazatel + 1, 1)
          gogo2 = Mid(buffer, ukazatel, 1)
          blb1 = Asc(gogo1)
          blb2 = Asc(gogo2)
          blb2 = 256 * blb2
          kolik = blb1 + blb2
          ukazatel = ukazatel + 2
          For i = 1 To kolik
            kam = y * 40 + x + 1
            cislo = Asc(Mid(buffer, ukazatel, 1))
            Mid(videobuf, kam, 1) = Chr(cislo)
            ukazatel = ukazatel + 1
            y = y + 2
            If y = 192 Then
              y = 1
            End If
            If y = 193 Then
              y = 0
              x = x + 1
            End If
            If x > 39 Then
              flag = 255
              Exit For
            End If
          Next i
        Else
          kolik = kod - 128
          ukazatel = ukazatel + 1
          For i = 1 To kolik
            cislo = Asc(Mid(buffer, ukazatel, 1))
            kam = 40 * y + x + 1
            Mid(videobuf, kam, 1) = Chr(cislo)
            ukazatel = ukazatel + 1
            y = y + 2
            If y = 192 Then
              y = 1
            End If
            If y = 193 Then
              y = 0
              x = x + 1
            End If
            If x > 39 Then
              flag = 255
              Exit For
            End If
          Next i
        End If
      End If
    End If
  Wend
  'MsgBox ("Rozbaleno!")
End Sub
Sub Vodorovna(ukazatel As Integer)
  Dim i As Long
  Dim kolik As Long
  Dim flag As Byte
  Dim x As Integer
  Dim y As Integer
  Dim kam As Long
  Dim kod As Byte
  Dim lenbuf As Long
  Dim cislo As Byte
  Dim blb1 As Byte
  Dim blb2 As Long
  Dim gogo1 As String
  Dim gogo2 As String
  lenbuf = Len(buffer)
  x = 0
  y = 0
  flag = 0
  While (ukazatel < lenbuf) And (flag = 0)
    kod = Asc(Mid(buffer, ukazatel, 1))
    If kod = 0 Then
      ukazatel = ukazatel + 1
      gogo1 = Mid(buffer, ukazatel + 1, 1)
      gogo2 = Mid(buffer, ukazatel, 1)
      blb1 = Asc(gogo1)
      blb2 = Asc(gogo2)
      blb2 = 256 * blb2
      kolik = blb1 + blb2
      ukazatel = ukazatel + 2
      cislo = Asc(Mid(buffer, ukazatel, 1))
      For i = 1 To kolik
        kam = 40 * y + x + 1
        Mid(videobuf, kam, 1) = Chr(cislo)
        x = x + 1
        If x = 40 Then
          x = 0
          y = y + 1
        End If
        If y > 191 Then
          flag = 255
          Exit For
        End If
      Next i
    Else
      If kod < 128 Then
        kolik = kod
        ukazatel = ukazatel + 1
        cislo = Asc(Mid(buffer, ukazatel, 1))
        ukazatel = ukazatel + 1
        For i = 1 To kolik
          kam = 40 * y + x + 1
          Mid(videobuf, kam, 1) = Chr(cislo)
          x = x + 1
          If x = 40 Then
            x = 0
            y = y + 1
          End If
          If y > 191 Then
            flag = 255
            Exit For
          End If
        Next i
      Else
        If kod = 128 Then
          ukazatel = ukazatel + 1
          gogo1 = Mid(buffer, ukazatel + 1, 1)
          gogo2 = Mid(buffer, ukazatel, 1)
          blb1 = Asc(gogo1)
          blb2 = Asc(gogo2)
          blb2 = 256 * blb2
          kolik = blb1 + blb2
          ukazatel = ukazatel + 2
          If ukazatel <= lenbuf Then
            For i = 1 To kolik
              kam = y * 40 + x + 1
              cislo = Asc(Mid(buffer, ukazatel, 1))
              Mid(videobuf, kam, 1) = Chr(cislo)
              ukazatel = ukazatel + 1
              If ukazatel > lenbuf Then
                Exit For
              End If
              x = x + 1
              If x = 40 Then
                x = 0
                y = y + 1
              End If
              If y > 191 Then
                flag = 255
                Exit For
              End If
            Next i
          End If
        Else
          kolik = kod - 128
          ukazatel = ukazatel + 1
          If ukazatel <= lenbuf Then
            For i = 1 To kolik
              kam = y * 40 + x + 1
              cislo = Asc(Mid(buffer, ukazatel, 1))
              Mid(videobuf, kam, 1) = Chr(cislo)
              ukazatel = ukazatel + 1
              If ukazatel > lenbuf Then
                Exit For
              End If
              x = x + 1
              If x = 40 Then
                x = 0
                y = y + 1
              End If
              If y > 191 Then
                flag = 255
                Exit For
              End If
            Next i
          End If
        End If
      End If
    End If
  Wend
  'MsgBox ("Rozbaleno")
End Sub

Function InfoKoala() As Boolean
  Dim KoalaStr As String
  Dim InfoStr As String
  Dim delzahlavi As Integer
  Dim komprese As Byte
  Dim i As Integer
  Dim bajtuvradku As Byte
  Dim radku As Byte
  Dim blokobrazu As Integer
  Dim pozice As Integer
  KoalaStr = Chr(255) & Chr(128) & Chr(201) & Chr(199)
  InfoStr = ""
  If Left(buffer, 4) <> KoalaStr Then
    InfoStr = "KoalaStr: '" & KoalaStr & "'" & Chr(13) & Chr(10)
    InfoStr = InfoStr & "Buffer: '" & Left(buffer, 4) & "'" & Chr(13) & Chr(10)
    InfoStr = InfoStr & "Obrázek není formátu Koala!"
    MsgBox (InfoStr)
    InfoKoala = False
  Else
    delzahlavi = Asc(Mid(buffer, 5, 1)) + 256 * Asc(Mid(buffer, 6, 1))
    InfoStr = "Délka záhlaví: " & Str(delzahlavi) & Chr(13) & Chr(10)
    InfoStr = InfoStr & "Verze programu: " & Str(Asc(Mid(buffer, 7, 1))) & Chr(13) & Chr(10)
    komprese = CByte(Asc(Mid(buffer, 8, 1)))
    InfoStr = InfoStr & "Komprese: "
    If komprese = 0 Then
      InfoStr = InfoStr & "žádná!"
    Else
      If komprese = 1 Then
        InfoStr = InfoStr & "svislá!"
      Else
        If komprese = 2 Then
          InfoStr = InfoStr & "vodorovná!"
        Else
          InfoStr = InfoStr & "chyba! Komprese = " & Str(komprese)
          InfoKoala = False
          MsgBox (InfoStr)
          Exit Function
        End If
      End If
    End If
    InfoStr = InfoStr & Chr(13) & Chr(10)
    InfoStr = InfoStr & "Antic mod: " & Str(Asc(Mid(buffer, 9, 1))) & Chr(13) & Chr(10)
    bajtuvradku = CByte(Asc(Mid(buffer, 11, 1)))
    radku = CByte(Asc(Mid(buffer, 13, 1)))
    InfoStr = InfoStr & "Délka øádku: " & Str(bajtuvradku) & Chr(13) & Chr(10)
    InfoStr = InfoStr & "Poèet øádkù: " & Str(radku) & Chr(13) & Chr(10)
    blokobrazu = CByte(Asc(Mid(buffer, 19, 1))) + 256 * CByte(Asc(Mid(buffer, 20, 1)))
    InfoStr = InfoStr & "Blok obrazu: " & Str(blokobrazu) & Chr(13) & Chr(10)
    pozice = 0
    i = 23
    pozice = InStr(i, buffer, Chr(155))
    If pozice = i Then
      InfoStr = InfoStr & "Název obrázku: " & Chr(13) & Chr(10)
      i = i + 1
    Else
      InfoStr = InfoStr & "Název obrázku: " & Mid(buffer, i, pozice - 1) & Chr(13) & Chr(10)
      i = pozice + 1
    End If
    pozice = InStr(i, buffer, Chr(155))
    If pozice = i Then
      i = i + 1
      InfoStr = InfoStr & "Autor: " & Chr(13) & Chr(10)
    Else
      InfoStr = InfoStr & "Autor: " & Mid(buffer, i, pozice - 1) & Chr(13) & Chr(10)
      i = pozice + 1
    End If
    pozice = InStr(i, buffer, Chr(155))
    If pozice = i Then
      InfoStr = InfoStr & "Text: " & Chr(13) & Chr(10)
      i = i + 1
    Else
      InfoStr = InfoStr & "Text: " & Mid(buffer, i, pozice - 1) & Chr(13) & Chr(10)
      i = pozice + 1
    End If
    pozice = InStr(i, buffer, Chr(155))
    If pozice = i Then
      i = i + 1
    Else
      InfoStr = InfoStr & "      " & Mid(buffer, i, pozice - 1) & Chr(13) & Chr(10)
      i = pozice + 1
    End If
    InfoStr = InfoStr & "Konec záhlaví: " & Str(Asc(Mid(buffer, i, 1)))
    MsgBox (InfoStr)
    InfoKoala = True
  End If
End Function


Private Sub butMicro_Click()
Dim pom As Boolean
  Dim delobr As Integer
  PicFormat = MicroP
  obr1.ScaleMode = vbPixels
  obr1.ScaleHeight = RowDMaster
  obr1.ScaleWidth = ColDMaster * 8
  obr1.Height = ovyska
  obr1.Width = osirka
  delobr = DelMicroP
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    If FileLen(jmenosouboru) < delobr + UpDown1.Value Then
      delobr = FileLen(jmenosouboru) - UpDown1.Value
    Else
      pom = NactiG15(jmenosouboru, delobr, ColG15, RowG15, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Private Sub butNegativ_Click()
  obr1.DrawMode = 6
  obr1.Line (0, 0)-(obr1.Width, obr1.Height), vbBlack, BF
End Sub

Private Sub butRepaint_Click()
  Dim radku As Integer
  Dim sloupcu As Integer
  Dim kuk
  Dim i As Integer
  Dim j As Integer
  Dim x As Integer
  Dim y As Integer
  Dim v As Integer
  obr1.DrawMode = 13
  obr1.Cls
  jeobraz = False
  radku = RowG15
  sloupcu = ColG15
  If PicFormat = Graphics15 Or PicFormat = MicroP Or PicFormat = DMaster Then
    If PicFormat = Graphics15 Then
      v = 5
    End If
    If PicFormat = MicroP Or PicFormat = DMaster Then
      v = 0
    End If
    For i = 0 To 4
      Barvy(i) = labBarva(i).BackColor
    Next i
    For i = 0 To radku - 1
      For j = 0 To sloupcu - 1
        kuk = Mid(buffer, (sloupcu * i + j + 1) + v, 1)
        x = 8 * j
        ZobrazG15 x, i, Asc(kuk)
      Next j
    Next i
  End If
  jeobraz = True
End Sub

Sub butSave_Click()
  Dim nazev As String
  Dim pozice As Integer
  If jeobraz = False Then
    MsgBox ("No picture for converion!")
  Else
    pozice = InStr(1, soubor, ".")
    If pozice > 0 Then
      nazev = Left(soubor, pozice) & "bmp"
    Else
      nazev = soubor & ".bmp"
    End If
    If Len(adresar) > 3 Then
      nazev = adresar & "\" & nazev
    Else
      nazev = adresar & nazev
    End If
    On Error GoTo chyba:
    SavePicture obr1.Image, nazev
    MsgBox ("File: " & nazev & " was successfully saved!")
    lstFile1.Refresh
    Exit Sub
  End If
chyba:
  MsgBox ("Error: File " & nazev & "couldn't by saved!")
End Sub

Sub butSaveAs_Click()
  Dim nazev As String
  Dim pozice As Integer
  Dim savename As String
  If jeobraz = False Then
    MsgBox ("No picture for saving!")
  Else
    pozice = InStr(1, soubor, ".")
    If pozice > 0 Then
      nazev = Left(soubor, pozice) & "bmp"
    Else
      nazev = soubor & ".bmp"
    End If
    savename = SaveDialog("*.bmp", "Save As", adresar)
    On Error GoTo chyba
    SavePicture obr1.Image, savename
    MsgBox ("File: " & nazev & " was successfully saved!")
    lstFile1.Refresh
  End If
  Exit Sub
chyba:
  MsgBox ("Error: File " & nazev & "couldn't by saved!")
End Sub

Sub butView_Click() 'Design Master
  Dim pom As Boolean
  Dim delobr As Integer
  PicFormat = DMaster
  obr1.ScaleMode = vbPixels
  obr1.ScaleHeight = RowDMaster
  obr1.ScaleWidth = ColDMaster * 8
  obr1.Height = ovyska
  obr1.Width = osirka
  delobr = DelDMaster
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    If FileLen(jmenosouboru) < delobr + UpDown1.Value Then
      delobr = FileLen(jmenosouboru) - UpDown1.Value
    Else
      pom = Nacti(jmenosouboru, delobr, ColDMaster, RowDMaster, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Function Nacti(obrazek As String, howmany As Integer, sloupcu As Integer, radku As Integer, vynech As Integer) As Boolean
  Dim kuk
  Dim kuk2 As String
  Dim i As Integer
  Dim j As Integer
  Dim bod As Integer
  Dim x As Integer
  Dim y As Integer
  Dim v As Integer
  Dim pom  As Boolean
  Dim prejit As String
  'On Error GoTo chyba
  obr1.Cls
  jeobraz = False
  Open obrazek For Binary Access Read As #1
  'kuk2 = Input(10, #1)
  If vynech > 0 Then
    prejit = Input(vynech, #1)
  End If
  buffer = Input(howmany, #1)
  Close #1
  If PicFormat = DMaster Or PicFormat = MAD Then
    For i = 0 To radku - 1
      For j = 0 To sloupcu - 1
        kuk = Mid(buffer, sloupcu * i + j + 1, 1)
        x = 8 * j
        Zobraz x, i, Asc(kuk)
      Next j
    Next i
  Else
    pom = ZobrazHumble()
  End If
  Nacti = True
  jeobraz = True
  Exit Function
chyba:
  Close #1
  Nacti = False
End Function

Function NactiG15(obrazek As String, howmany As Integer, sloupcu As Integer, radku As Integer, vynech As Integer) As Boolean
  Dim kuk
  Dim kuk2 As String
  Dim i As Integer
  Dim j As Integer
  Dim bod As Integer
  Dim x As Integer
  Dim y As Integer
  Dim v As Integer
  Dim sloupecku As Integer
  Dim prejit As String
  On Error GoTo chyba
  obr1.Cls
  jeobraz = False
  Open obrazek For Binary Access Read As #1
  If vynech > 0 Then
    prejit = Input(vynech, #1)
  End If
  buffer = Input(howmany, #1)
  Close #1
  If PicFormat = Graphics15 Or PicFormat = MicroP Then
    If PicFormat = Graphics15 Then
      v = 5
    End If
    If PicFormat = MicroP Then
      v = 0
    End If
    NactiBarvy
    For i = 0 To radku - 1
      For j = 0 To sloupcu - 1
        kuk = Mid(buffer, (sloupcu * i + j + 1) + v, 1)
        x = 8 * j
        ZobrazG15 x, i, Asc(kuk)
      Next j
    Next i
  End If
  NactiG15 = True
  jeobraz = True
  Exit Function
chyba:
  Close #1
  NactiG15 = False
End Function

Sub NactiBarvy()
  Dim i As Integer
  Dim cbarvy As Integer
  If PicFormat = Graphics15 Then
    For i = 1 To 4
      cbarvy = Asc(Mid(buffer, i, 1))
      Barvy(i) = AtariBarva(cbarvy)
      labBarva(i).BackColor = Barvy(i)
    Next i
    cbarvy = Asc(Mid(buffer, 5, 1))
    Barvy(0) = AtariBarva(cbarvy)
    labBarva(0).BackColor = Barvy(0)
  End If
  If PicFormat = MicroP Then
    For i = 0 To 3
      cbarvy = Asc(Mid(buffer, 7681 + i, 1))
      Barvy(i) = AtariBarva(cbarvy)
      labBarva(i).BackColor = Barvy(i)
    Next i
  End If
End Sub

Sub Zobraz(x As Integer, y As Integer, bajt As Byte)
  Dim pom As Byte
  pom = 128 And bajt
  If pom > 0 Then
    obr1.PSet (x, y), vbBlack
  End If
  pom = 64 And bajt
  If pom > 0 Then
    obr1.PSet (x + 1, y), vbBlack
  End If
  pom = 32 And bajt
  If pom > 0 Then
    obr1.PSet (x + 2, y), vbBlack
  End If
  pom = 16 And bajt
  If pom > 0 Then
    obr1.PSet (x + 3, y), vbBlack
  End If
  pom = 8 And bajt
  If pom > 0 Then
    obr1.PSet (x + 4, y), vbBlack
  End If
  pom = 4 And bajt
  If pom > 0 Then
    obr1.PSet (x + 5, y), vbBlack
  End If
  pom = 2 And bajt
  If pom > 0 Then
    obr1.PSet (x + 6, y), vbBlack
  End If
  pom = 1 And bajt
  If pom > 0 Then
    obr1.PSet (x + 7, y), vbBlack
  End If
End Sub

Sub ZobrazG15(x As Integer, y As Integer, bajt As Byte)
  Dim pom As Byte
  Dim kterabarva As Integer
  pom = bajt
  kterabarva = pom Mod 4
  obr1.PSet (x + 6, y), Barvy(kterabarva)
  obr1.PSet (x + 7, y), Barvy(kterabarva)
  pom = pom \ 4
  kterabarva = pom Mod 4
  obr1.PSet (x + 4, y), Barvy(kterabarva)
  obr1.PSet (x + 5, y), Barvy(kterabarva)
  pom = pom \ 4
  kterabarva = pom Mod 4
  obr1.PSet (x + 2, y), Barvy(kterabarva)
  obr1.PSet (x + 3, y), Barvy(kterabarva)
  pom = pom \ 4
  kterabarva = pom Mod 4
  obr1.PSet (x + 0, y), Barvy(kterabarva)
  obr1.PSet (x + 1, y), Barvy(kterabarva)
End Sub

Private Sub butViewMAD_Click()
  Dim pom As Boolean
  Dim piclen As Integer
  PicFormat = MAD
  obr1.Height = ovyska + 64
  obr1.Width = osirka + 192
  obr1.ScaleHeight = RowMAD
  obr1.ScaleWidth = ColMAD * 8
  piclen = DelMAD
  adresar = lstDir1.Path
  soubor = lstFile1.filename
  obr1.DrawMode = 13
  If Len(adresar) > 3 Then
    jmenosouboru = adresar & "\" & soubor
  Else
    jmenosouboru = adresar & soubor
  End If
  If soubor = "" Then
    MsgBox ("No file selected!")
  Else
    If FileLen(jmenosouboru) < piclen + UpDown1.Value Then
      piclen = FileLen(jmenosouboru) - UpDown1.Value
    Else
      pom = Nacti(jmenosouboru, piclen, ColMAD, RowMAD, UpDown1.Value)
      If pom = False Then
        MsgBox ("Reading of file failed!")
      End If
    End If
  End If
End Sub

Function ZobrazHumble() As Boolean
  Dim ukazatel As Long
  Dim prikaz As Integer
  Dim vel As Integer
  Dim yps As Single
  Dim pocet As Long
  Dim gogo1 As String
  Dim gogo2 As String
  Dim blb1 As Integer
  Dim blb2 As Integer
  Dim fibyte As Integer
  'gogo1 = Mid(buffer, 1, 1)
  'gogo2 = Mid(buffer, 2, 1)
  'blb1 = Asc(gogo1)
  'blb2 = Asc(gogo2)
  'blb2 = 256 * blb2
  buffer = Right(buffer, Len(buffer) - 2)
  pocet = Len(buffer)
  ukazatel = 1
  vel = 2
  yps = 192 / vel
  While ukazatel < pocet
    fibyte = Asc(Mid(buffer, ukazatel, 1))
    ukazatel = ukazatel + 1
    prikaz = fibyte And 254
    Select Case prikaz
      Case 0
        ukazatel = Bodik(ukazatel, fibyte)
      Case 32
        ukazatel = Usecka(ukazatel, fibyte)
      Case 64
        ukazatel = Boxik(ukazatel, fibyte)
      Case 96
        ukazatel = Kruh(ukazatel, fibyte)
      Case 128
        ukazatel = Oblouk(ukazatel, fibyte)
      Case 160
        ukazatel = Pismo(ukazatel, fibyte)
    End Select
  Wend
  ZobrazHumble = True
End Function

Function Bodik(ukaz2 As Long, fibajt As Integer) As Long
  Dim ZacX As Long
  Dim ZacY As Integer
  ZacX = PrvniCislo(ukaz2, fibajt)
  ukaz2 = ukaz2 + 1
  ZacY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  obr1.PSet (ZacX, ZacY), vbBlack
  Bodik = ukaz2
End Function

Function Usecka(ukaz2 As Long, fibajt As Integer) As Long
  Dim ZacX As Long
  Dim ZacY As Integer
  Dim KonX As Long
  Dim KonY As Integer
  ZacX = PrvniCislo(ukaz2, fibajt)
  ukaz2 = ukaz2 + 1
  ZacY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  KonX = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  KonY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  obr1.Line (ZacX, ZacY)-(KonX, KonY), vbBlack
  Usecka = ukaz2
End Function

Function Boxik(ukaz2 As Long, fibajt As Integer) As Long
  Dim ZacX As Long
  Dim ZacY As Integer
  Dim KonX As Long
  Dim KonY As Integer
  ZacX = PrvniCislo(ukaz2, fibajt)
  ukaz2 = ukaz2 + 1
  ZacY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  KonX = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  KonY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  obr1.Line (ZacX, ZacY)-(KonX, KonY), vbBlack, B
  Boxik = ukaz2
End Function

Function Kruh(ukaz2 As Long, fibajt As Integer) As Long
  Dim ZacX As Long
  Dim ZacY As Integer
  Dim polomer As Long
  ZacX = PrvniCislo(ukaz2, fibajt)
  ukaz2 = ukaz2 + 1
  ZacY = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  polomer = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  obr1.Circle (ZacX, ZacY), polomer, vbBlack
  Kruh = ukaz2
End Function

Function Oblouk(ukaz2 As Long, fibajt As Integer) As Long
  Const CisloPi = 3.141592653
  Dim ZacX As Long
  Dim ZacY As Integer
  Dim sx As Long
  Dim sy As Integer
  Dim polomer As Long
  Dim kol1 As Long
  Dim kol2 As Long
  Dim obvod As Single
  Dim omega1deg As Single
  Dim omega2deg As Single
  Dim omega1rad As Single
  Dim omega2rad As Single
  Dim x As Single
  Dim y As Single
  Dim x1 As Single
  Dim y1 As Single
  Dim l As Single
  Dim uhel As Single
  Dim krok As Single
  Dim alfa As Single
  sx = PrvniCislo(ukaz2, fibajt)
  ukaz2 = ukaz2 + 1
  sy = ByteCislo(ukaz2)
  ukaz2 = ukaz2 + 1
  polomer = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  kol1 = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  kol2 = DalsiCislo(ukaz2)
  ukaz2 = ukaz2 + 2
  'Zde následuje kreslení oblouku
  'ukaz2 = ukaz2 + 8
  Oblouk = ukaz2
End Function

Function Pismo(ukaz2 As Long, fibajt As Integer) As Long
  Dim ZacX As Long
  Dim ZacY As Integer
  Dim polomer As Integer
  Dim vx As Integer
  Dim vy As Integer
  Dim rot As Integer
  Dim znak As Integer
  'ZacX = PrvniCislo(ukaz2, fibajt)
  'ukaz2 = ukaz2 + 1
  'ZacY = ByteCislo(ukaz2)
  'ukaz2 = ukaz2 + 1
  'znak = ByteCislo(ukaz2)
  'ukaz2 = ukaz2 + 1
  'vx = ByteCislo(ukaz2)
  'ukaz2 = ukaz2 + 1
  'vy = ByteCislo(ukaz2)
  'ukaz2 = ukaz2 + 1
  'rot = ByteCislo(ukaz2)
  'ukaz2 = ukaz2 + 1
  'zde následuje psani znaku
  ukaz2 = ukaz2 + 6
  Pismo = ukaz2
End Function

Function PrvniCislo(ukaz2 As Long, fibajt As Integer) As Long
  Dim gogo1 As String
  Dim gogo2 As String
  Dim blb1 As Integer
  Dim blb2 As Long
  gogo1 = Mid(buffer, ukaz2, 1)
  blb1 = Asc(gogo1)
  blb2 = fibajt And 1
  blb2 = blb2 * 256
  PrvniCislo = blb1 + blb2
End Function

Function DalsiCislo(ukaz2 As Long) As Long
  Dim gogo1 As String
  Dim gogo2 As String
  Dim blb1 As Integer
  Dim blb2 As Long
  gogo1 = Mid(buffer, ukaz2, 1)
  gogo2 = Mid(buffer, ukaz2 + 1, 1)
  blb1 = Asc(gogo1)
  blb2 = Asc(gogo2)
  blb2 = blb2 * 256
  DalsiCislo = blb1 + blb2
End Function

Function ByteCislo(ukaz2 As Long) As Integer
  Dim gogo1 As String
  Dim blb1 As Integer
  gogo1 = Mid(buffer, ukaz2, 1)
  blb1 = Asc(gogo1)
  ByteCislo = blb1
End Function

Sub Form_Load()
  frmDmView.ScaleMode = vbPixels
  obr1.ScaleMode = vbPixels
  obr1.Height = 192
  obr1.Width = 320
  obr1.BackColor = vbWhite
  obr1.DrawMode = 13
  obr1.Cls
  jeobraz = False
  txtPattern.Text = "*.*"
  fvyska = frmDmView.Height
  fsirka = frmDmView.Width
  ovyska = obr1.Height
  osirka = obr1.Width
  UpDown1.Value = 0
  txtVynechat = Str(UpDown1.Value)
  HumbleInit
  InitAtariBarvy
End Sub

Private Sub labBarva_DblClick(Index As Integer)
  Dim poradi As Integer
  Dim i As Integer
  For i = 0 To 255
    frmPaleta.Label1(i).BackColor = AtariBarva(i)
    If labBarva(Index).BackColor = AtariBarva(i) Then
      frmPaleta.Label1(i).BorderStyle = 0
    End If
  Next i
  poradi = Index
  frmPaleta.labCisloBarvy.Caption = poradi
  frmPaleta.Show vbModal
End Sub

Sub lstDir1_Change()
  lstFile1.Path = lstDir1.Path
End Sub

Sub lstDrive1_Change()
 On Error GoTo DriveHandler
    lstDir1.Path = lstDrive1.Drive
    Exit Sub
DriveHandler:
    lstDrive1.Drive = lstDir1.Path
    Exit Sub
End Sub

Sub lstDir1_LostFocus()
    lstDir1.Path = lstDir1.List(lstDir1.ListIndex)
End Sub

Private Sub lstFile1_Click()
  Dim adresar2 As String
  Dim soubor2 As String
  Dim jmenosouboru2 As String
  adresar2 = lstDir1.Path
  soubor2 = lstFile1.filename
  If Len(adresar2) > 3 Then
    jmenosouboru2 = adresar2 & "\" & soubor2
  Else
    jmenosouboru2 = adresar2 & soubor2
  End If
  If soubor2 = "" Then
    lblDelka2.Caption = ""
  Else
    lblDelka2.Caption = FileLen(jmenosouboru2)
  End If
End Sub

Private Sub txtPattern_Change()
  lstFile1.Pattern = txtPattern.Text
  lstFile1.Refresh
End Sub

Private Sub UpDown1_Change()
  Dim hodnota As Integer
    txtVynechat.Text = Str(UpDown1.Value)
End Sub
