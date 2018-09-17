unit UImage;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TmdImage = class(TDataModule)
    imgButton: TImageList;
    imgGrid: TImageList;
    imgStatus: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mdImage: TmdImage;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
