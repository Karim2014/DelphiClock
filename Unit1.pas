unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  CX, CY: word;
  R: byte = 100;
  H: byte = 5;
  ha,sa,ma: word; // координаты стрелки
  hag,mag,sag:real; // угол наклона стрелок
  N: TDateTime;

Procedure Arrow(Time: TDateTime; c: TColor);
var
  Sec, Min, Hour, ms: word;
begin
  DecodeTime(Time,Hour,Min,Sec,ms);
  sag:=sec/60*2*pi;
  with Form1.Canvas do
  begin
    Pen.Color := c;
    MoveTo(cx,cy);
    Pen.Width:=1;
    LineTo(cx+Round(sa*sin(sag)),cy-Round(sa*cos(sag)));
  end;
end;

procedure DrawClock(x, y: word);
var
  XR, YR, EXR, EYR: word;
  i: word;
begin
  XR := X-R;
  YR := Y-R;
  EXR := x+R;
  EYR := y+R;
  with Form1.Image1.Canvas do
  begin
    PEn.Color := clGray;
    Pen.Width := 3;
    Ellipse(XR, YR, EXR, EYR);
    Pixels[x,y] := clBlack;
 {  Ќужно дл€ визулизации. включить при отладке
    MoveTo(x,y);
    LineTo((XR+EXR) div 2 , YR);

    MoveTo(x,y);
    LineTo((XR+EXR) div 2 , EYR);

    MoveTo(x,y);
    LineTo(XR, (YR + EYR) div 2);

    MoveTo(x,y);
    LineTo(EXR, (YR + EYR) div 2);   // }

    Font.Size := 14;

    TextOut( x - (TextWidth('12') div 2)+1, YR+h, '12');
    TextOut(EXR-4*h, y - (TextHeight('3') div 2), '3');
    TextOut( x - (TextWidth('6') div 2), EYR-H*6+2, '6');
    TextOut( XR+2*h+1, y - (TextHeight('9') div 2), '9');

    PEn.Color := clBlack;
    Pen.Width := 1;

    //вывод рисок
    for i:=0 to 11 do
    begin
     MoveTo(cx+Round((R-9)*sin(i/6*pi)),cy-Round((R-9)*cos(i/6*pi)));
     LineTo(cx+Round((R)*sin(i/6*pi)),cy-Round((R)*cos(i/6*pi)));
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  sa:=r-10; // „тобы всегда было на 10 пиксеолей меньше радиуса
  CX := Form1.Image1.Width div 2;
  CY := form1.Image1.Height div 2;
  DrawClock(CX, CY);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Arrow(N, clWhite);
  N := Now;
  Arrow(N, clRed);
end;

end.
