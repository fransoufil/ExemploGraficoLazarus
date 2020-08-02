unit uTesteGrafico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  TAGraph, TASources, TASeries, TADbSource;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1BarSeries1: TBarSeries;
    Chart1PieSeries1: TPieSeries;
    CheckBox1: TCheckBox;
    ListChartSource1: TListChartSource;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);

    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: byte;
  valor: Double;
begin
   for i := 0 to Chart1.SeriesCount -1 do
   begin
     if (Chart1.Series[i] is TBarSeries) then
        (Chart1.Series[i] as TBarSeries).Clear;
     if (Chart1.Series[i] is TPieSeries) then
        (Chart1.Series[i] as TPieSeries).Clear;
     if RadioGroup1.ItemIndex = i then


        Chart1.Series[i].Active:=true
        else
        Chart1.Series[i].Active:=false;
   end;

    ListChartSource1.Clear;
    For i:=1 to 10 do
        begin
          valor:= random(60);
          ListChartSource1.AddXYList(i, valor, 'Teste ' + inttostr(i),rgbToColor(random(255),random(255), random(255)) );
        end;
end;



procedure TForm1.CheckBox1Click(Sender: TObject);
var
  i: byte;

begin
   for i := 0 to Chart1.SeriesCount -1 do
   begin
     if (Chart1.Series[i] is TBarSeries) then
        (Chart1.Series[i] as TBarSeries).Marks.Visible:= not ((Chart1.Series[i] as TBarSeries).Marks.Visible);
     if (Chart1.Series[i] is TPieSeries) then
        (Chart1.Series[i] as TPieSeries).Marks.Visible:= not ((Chart1.Series[i] as TPieSeries).Marks.Visible);
      end;


   end;






end.

