unit atc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls, Db, DBTables, DBGrids, RxQuery, Mask, DBCtrls,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Table1: TTable;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Button2: TButton;
    DataSource1: TDataSource;
    RxQuery1: TRxQuery;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    Table2: TTable;
    Button3: TButton;
    RichEdit1: TRichEdit;
    RxQuery2: TRxQuery;
    DataSource3: TDataSource;
    RxQuery3: TRxQuery;
    Database1: TDatabase;
    DBGrid2: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
 
      private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  iFileHandle: Integer;
  schet:Integer;
  Count:Integer;
  iFileLength: Integer;
  Buffer: PAnsiChar;
  xvatit:Boolean;
  s:string;
  i:Integer;
  date:string[10];
  prnom:string[15];
  nom:string[3];
  line:string[2];
  time:string[8];
  telefon:string[15];
  timeR:string[8];

begin

  if opendialog1.execute   then

  try
      iFileHandle := FileOpen(OpenDialog1.FileName, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);
      Buffer := PAnsiChar(AllocMem(iFileLength + 1));
      for i:=0 to iFileLength do begin
      FileRead(iFileHandle, buffer[i], 1); end;
      FileClose(iFileHandle);

            with Table1 do
    begin

            Active:=False;
            DatabaseName :='c:\atc';
            TableName := 'atc';
            TableType := ttDBase;

            with FieldDefs do
      begin Clear;

            with AddFieldDef do begin
                  Name := 'Index';
                  DataType := ftInteger;
                  Required := True;
        end;

            with AddFieldDef do
        begin
                  Name := 'Date';
                  DataType := ftDate;
                  Required := True;
        end;

            with AddFieldDef do
        begin
                 Name := 'Time';
                 DataType := ftTime;
        end;

            with AddFieldDef do
        begin
                 Name := 'TimeR';
                 DataType := ftTime;
        end;

            with AddFieldDef do
        begin
                 Name := 'Nom';
                 DataType := ftString;
                 size:=3;
        end;

            with AddFieldDef do
        begin
                 Name := 'NomPr';
                 DataType := ftString;
                 size:=15;
        end;

            with AddFieldDef do
        begin
                 Name := 'Line';
                 DataType := ftString;
                 size:=2;
        end;
                with AddFieldDef do
        begin
                 Name := 'Telefon';
                 DataType := ftString;
                 size:=15;
        end;
      end;


                with IndexDefs do
      begin
                Clear;
                Add('', 'Index', [ixPrimary, ixUnique]);
      end;
                CreateTable;
    end;

                count:=0;
                schet:=1;
                Table1.active:=true;
                xvatit:=false;

                progressbar1.position:=0;

                while xvatit<>true do
      begin count:=count+1;

                if ((buffer[count]='а') and (buffer[count+1]=#13)
                                       and (buffer[count+2]=#10))

                then
        begin
                xvatit:=true;
                count:=count+3;
        end;

      end;

                while count < iFileLength do
      begin

                date:='          ';
                time:='        ';
                timeR:='        ';
                nom:='   ';
                prnom:='               ';
                line:='  ';
                telefon:='               ';
                i:=1;

                progressbar1.position:=progressbar1.position+round(((schet/iFileLength)*100));


                while buffer[count] <> ' ' do
        begin
            date[i]:=buffer[count];
            i:=i+1;
            count:=count+1;
        end;

                while buffer[count] = ' ' do
                count:=count+1;
                i:=1;

                while buffer[count] <> ' ' do
        begin
                time[i]:=buffer[count];
                i:=i+1;
                count:=count+1;
        end;

                while buffer[count] = ' ' do
                count:=count+1;
                i:=1;

                while buffer[count] <> ' ' do
        begin
                timer[i]:=buffer[count];
                i:=i+1;
                count:=count+1;
        end;

                while buffer[count] = ' ' do
                count:=count+1;
                i:=1;

                while buffer[count] <> '(' do
        begin
                nom[i]:=buffer[count];
                i:=i+1;
                count:=count+1;
        end;

                while buffer[count] <> ')' do
                count:=count+1;

                while buffer[count] = ')' do
                count:=count+1;

                while buffer[count] = ' ' do
                count:=count+1;
                i:=1;

                while buffer[count] <> ' ' do
        begin
                line[i]:=buffer[count];
                i:=i+1;
                count:=count+1;
        end;

                while buffer[count] = ' ' do
                count:=count+1;
                i:=1;

                while buffer[count] <> #13 do
        begin
                telefon[i]:=buffer[count];
                i:=i+1;
                count:=count+1;
        end;

                count:=count+1;
                if ((Buffer[count]=#10) and (Buffer[count+1]=#13)
                                       and (Buffer[count+2]=#10))

                then count:=iFileLength;

                Table1.Append;
                table1.Fields.Fields[0].asinteger:=schet;
                date[3]:='.';date[6]:='.';
                table1.Fields.Fields[1].asdatetime:=strtodate(Date);
                table1.Fields.Fields[2].asstring:=Time;
                table1.Fields.Fields[3].asstring:=TimeR;
                table1.Fields.Fields[4].asstring:=nom;
                table1.Fields.Fields[5].asstring:=prnom;
                table1.Fields.Fields[6].asstring:=line;
                table1.Fields.Fields[7].asstring:=telefon;
                Table1.Post;
                str(schet,s);
                label1.caption:=s;
                count:=count+1; schet:=schet+1;

     end;

                FreeMem(Buffer);
                Table1.active:=false;
  except
                  showmessage('Файл не открыт!');
  end;
end;

    procedure TForm1.Button2Click(Sender: TObject);
      var s         :string[15];
          n,k       :string;
          naideno   :boolean;
          i,j       :integer;

          all       :string[15];
          first     :string[3];
          second    :string[2];
      begin

                rxquery1.first;
                table2.active:=true;
                for i:=1 to RXQuery1.RecordCount do begin
                      dbedit1.text:=RxQuery1.Fields[7].AsString;
                      all:='             ';
                      all:=dbedit1.text;s:='             ';
                      s:=all;
//if all[2]='2' then begin s[2]:='8';s[3]:='6';s[4]:='3';end;
// str(RXQuery1.RecNo,n); str(RXQuery1.RecordCount,k);
// label1.Caption:=n+':'+k;

      if (s[2]<>' ') and (s[2]<>'9') and (s[2]<>'1') and (s[2]<>'2') then begin
                naideno:=false;
                RxQuery3.Close;
                RxQuery3.Prepare;
                RxQuery3.Params[0].AsString := s[2]+s[3]+s[4];
                RxQuery3.Open;
//showmessage(s[2]+s[3]+s[4]+' '+s[5]+s[6]);

                while naideno<>true do
          begin
                first:='   ';
                second:='  ';
                first:=RXQuery3.Fields[1].asstring;
                second:=RXQuery3.Fields[2].asstring;
  //    showmessage(first+' '+second);
                if  (s[2]=first[1]) and (s[3]=first[2]) and (s[4]=first[3])
                                  and (s[5]=second[1]) and (s[6]=second[2])
                 then begin
                naideno:=true;
                richedit1.lines.add(RxQuery1.Fields[0].asstring+' '+RxQuery3.Fields[0].asstring+RxQuery3.Fields[5].asstring);
            end else

                        begin
                RxQuery3.next;
                //richedit1.lines.add('Сопоставления нет');
            end;

            if RxQuery3.recNo=RxQuery3.RecordCount then naideno:=true;
            end;

        end;

           rxquery1.Next;


      end;
    end;

procedure TForm1.Button3Click(Sender: TObject);
var s:string[15];

  begin
    RxQuery2.Close;
{    RxQuery2.SQL.Text := 'SELECT NAME, ABC, AB, INF, TEH, NAME1 FROM "TP.dbf" WHERE (ABC = :abc) and (AB = :AB)';}
    RxQuery2.SQL.Text := 'SELECT NAME, ABC, AB, INF, TEH, NAME1 FROM "TP.dbf" WHERE ABC = :abc';
    RxQuery2.Prepare;
    RxQuery2.Params[0].AsString := s[2]+s[3]+s[4];
    RxQuery2.Open;
  end;

end.



