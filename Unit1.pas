unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Grids,
  Vcl.Outline, Vcl.Samples.DirOutln, Vcl.Mask, JvExControls, JvComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, JvExMask, JvToolEdit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    JvIPAddress1: TJvIPAddress;
    IdFTP1: TIdFTP;
    Button2: TButton;
    JvDirectoryEdit1: TJvDirectoryEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    procedure FTPFileSend;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FindIt(dir:string);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  LocalPath,LocalDir,FTPPath,FTPDir,FTPIP,SearchDir, CurDir, CurFileName,FullLocalName,DateBackup: string;
  IdFTP1: TIdFTP;
  AddressList1, FileList1: TStringList;
implementation

{$R *.dfm}

procedure TForm1.FindIt(dir:string);
const
  EXT = '.jar';
var
  SearchRec: TSearchRec;
begin

  AddressList1:=TStringList.Create;
  FileList1:=TStringList.Create;

  Dir := IncludeTrailingBackslash(Dir);


  if FindFirst(Dir + '*.*', faAnyFile, SearchRec) = 0 then
    repeat
      if (SearchRec.Name = '.') or (SearchRec.Name = '..') then
        Continue;
      if (SearchRec.Attr and faDirectory) <> 0 then
        FindIt(Dir + SearchRec.Name)
      else
    if ExtractFileExt(Dir + SearchRec.Name) = EXT then
         ListBox1.Items.Add(Dir + SearchRec.Name);
         AddressList1.Add(Dir+SearchRec.Name);
            if ExtractFileExt(Dir + SearchRec.Name) = EXT then
            ListBox2.Items.Add(searchrec.Name);
            FileList1.Add(searchrec.Name);

    until
      FindNext(SearchRec) <> 0;
  FindClose(SearchRec);
  end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I: Integer;
begin
IdFTP1.Host:=JvIpAddress1.Text;
IdFTP1.Username:='cent510';
IdFTP1.Password:='cent510';
FTPFileSend;

for I := 0 to ListBox1.Items.Count-1 do
begin
FullLocalName:= ListBox1.Items[I];
CurFileName:=  ListBox2.Items[I];


end;


end;

procedure TForm1.FTPFileSend;
begin
  if idFTP1.Connected then
    begin
      idFTP1.Disconnect;
try
    idFTP1.Connect;
  except
    on E : Exception do
      ShowMessage('Ошибка подключения: '+E.Message);
  end;
  if idFTP1.Connected then
    try
      idFTP1.ChangeDir(StringReplace(Localdir,'\','/',[rfReplaceAll]));
      idFTP1.Rename(CurFileName,CurFileName+DateBackup);
      idFTP1.Put(FullLocalName,CurFileName,true);

    except
      on E : Exception do
        ShowMessage('Ошибка выкладывания файла: '+E.Message);
    end;
    end
  else
  try
    idFTP1.Connect;
  except
    on E : Exception do
      ShowMessage('Ошибка подключения: '+E.Message);
  end;
  if idFTP1.Connected then
    try
      idFTP1.ChangeDir(StringReplace(Localdir,'\','/',[rfReplaceAll]));
      idFTP1.Rename(CurFileName,CurFileName+DateBackup);
      idFTP1.Put(FullLocalName,CurFileName,true);

         except
      on E : Exception do
        ShowMessage('Ошибка выкладывания файла: '+E.Message);
    end;
end;




procedure TForm1.Button1Click(Sender: TObject);
begin

Label1.Caption:=  JvDirectoryEdit1.Text;
FindIt(JvDirectoryEdit1.Text);



{CurFileName:=ExtractFileName(FullLocalName);
LocalPath:=ExtractFilePath(OpenDialog1.FileName);
LocalDir:=Copy(LocalPath,(Pos('gaia',LocalPath)),length(LocalPath)-(Pos('gaia',LocalPath)))+'\';
SearchDir:=Copy(LocalPath,1,(Pos('gaia',LocalPath)-1)+5);
DateTimeToString(DateBackup,'_'+'ddmmyyyy',Now);
Label1.Caption:=SearchDir;
}
end;



end.

