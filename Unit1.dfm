object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 564
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 564
    Height = 286
    Align = alClient
    ExplicitHeight = 249
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 504
    Top = 40
  end
end
