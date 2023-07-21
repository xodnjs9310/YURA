unit PubUnit;

interface

uses
  Winapi.Messages, Winapi.Windows, System.Sysutils, Vcl.Forms, System.Variants, System.Classes,
  Vcl.Dialogs, Vcl.ComCtrls, System.IniFiles, IdHashMessageDigest;

const
  YRMyIniFile = 'yuMES.ini';
  YRMyConnect = 'TyuMESConnect';
  YRMyMain    = 'TyuMESMainFrm.UnicodeClass';

  procedure TransFormat(TrCode: integer; Packet : integer; wnn : THandle; NextValue : RawByteString; SQLGu : integer; RecvData: RawByteString; WmCp : integer);
  procedure FileSendFormat(cMsg,cFileName : RawByteString; wnn : THandle); // 구분,보낼파일,핸들
  function MsgDlg(nCode: integer; nDlType : TMsgDlgType; nType : word; nParam : string = ''; addParam : string = '') : integer;
  function FastCharPos(const aSource : Ansistring; const C: AnsiChar; StartPos : Integer) : Integer;
  procedure HSDelimited(const sl : TStrings; const value : AnsiString; const delimiter : Ansichar=';');
  procedure DBMsgDlg(nCode: string; Gbn : integer=1);

implementation

uses PubHeader;

procedure TransFormat(TrCode: integer; Packet : integer; wnn : THandle; NextValue : RawByteString; SQLGu : integer; RecvData: RawByteString; WmCp : integer); // TrCode,Packet(01:IP할당),핸들,Next구분,SQL구분,데이타
var
    PackSt : RawByteString;
    QueryData : TQueryData; // 공통헤더
    SendData : RawByteString;
    DataBuf : TCopyDataStruct;
    ToLen : integer;
    SndMsg : RawByteString;
    Tmp : RawByteString;
    SQL_Gu : RawByteString;
begin
    PackSt := AnsiChar(Packet);
    SQL_Gu := AnsiChar(SQLGu);
    FillChar(QueryData,SizeOf(QueryData),#32);
//    Move(TrCode[1],QueryData.TrCd,Length(TrCode));
    QueryData.TrCd := TrCode;
    Move(PackSt[1],QueryData.PacketID,Length(PackSt));
    Move(NextValue[1],QueryData.BeAf,Length(NextValue));
    Move(SQL_Gu[1],QueryData.SQLGu,Length(SQL_Gu));
    QueryData.WinID := wnn;

    ToLen := SizeOf(QueryData) + Length(RecvData);

    SetLength(SendData, SizeOf(QueryData));
    Move(QueryData,SendData[1],SizeOf(QueryData));

    SetLength(SndMsg, 4 + ToLen);
    Move(ToLen, SndMsg[1], 4);
    Tmp := SendData + RecvData;
    Move(Tmp[1], SndMsg[5], ToLen);
    with DataBuf do begin
        DwData := WmCp;
        cbData := Length(SndMsg);
        lpData := @SndMsg[1];
    end;
    SendMessage(FindWindow(YRMyConnect,nil),WM_COPYDATA,wnn,longint(@DataBuf));
end;

procedure FileSendFormat(cMsg,cFileName : RawByteString; wnn : THandle); // 구분,보낼파일,핸들
var
    HS_FileData : THS_FileData;
    MyFileName : RawByteString;
    MyMD5 : RawByteString;
    fs : TFileStream;
    Buf : RawByteString;
    DataSize : integer;
    SendData : RawByteString;
    DataBuf : TCopyDataStruct;
    idmd5 : TIdHashMessageDigest5;
begin
    FillChar(HS_FileData,SizeOf(HS_FileData),#0);

    if (cMsg <> '01') and (cMsg <> '02') and (cMsg <> '00') then begin
        MessageDlg('Error - Code', mtError,[mbOk], 0);
        exit;
    end else if Length(Trim(cFileName)) = 0 then begin
        MessageDlg('Error - File Name', mtError,[mbOk], 0);
        exit;
    end;
    MyFileName := ExtractFileName(cFileName);
    Move(cMsg[1],HS_FileData.Msg,Length(cMsg));
    Move(MyFileName[1],HS_FileData.FileName,Length(MyFileName));
    HS_FileData.Handle := wnn;

    if (cMsg = '02') or (cMsg = '00') then begin // 파일요청, Polling
        DataSize := SizeOf(HS_FileData);
        SetLength(SendData, 4 + DataSize);
        Move(DataSize, SendData[1], 4);
        Move(HS_FileData, SendData[5], SizeOf(HS_FileData));
    end else if cMsg = '01' then begin // 파일보냄
        if not FileExists(cFileName) then begin
            MessageDlg('File Not Found', mtError,[mbOk], 0);
            exit;
        end;

        fs := TFileStream.Create(cFileName, fmOpenRead or fmShareDenyWrite);
        idmd5 := TIdHashMessageDigest5.Create;
        MyMD5 := idmd5.HashStreamAsHex(fs);
        Move(MyMD5[1],HS_FileData.MD5,Length(MyMD5));
        idmd5.Free;
        SetLength(Buf,fs.Size);
        fs.ReadBuffer(Buf[1],fs.Size);
        HS_FileData.FileSize := fs.Size;
        fs.Free;

        DataSize := SizeOf(HS_FileData) + Length(Buf);
        SetLength(SendData, 4 + DataSize);
        Move(DataSize, SendData[1], 4);
        Move(HS_FileData, SendData[5], SizeOf(HS_FileData));
        Move(Buf[1], SendData[5+SizeOf(HS_FileData)], Length(Buf));
    end;
    with DataBuf do begin
        DwData := 6000;
        cbData := Length(SendData);
        lpData := @SendData[1];
    end;
    SendMessage(FindWindow(YRMyConnect,nil),WM_COPYDATA,wnn,longint(@DataBuf));
end;

function MsgDlg(nCode: integer; nDlType : TMsgDlgType; nType : word; nParam : string = ''; addParam : string = '') : integer;
var
    CodeList : TStringList;
    TempList : TStringList;
    TempCode : string;
    TempMsg : string;
    i,j : integer;
    PathName : string;
    WinIni : TIniFile;
    LanguageChk : integer;
    FileName : string;
    MyLan : string;
    TempData : string;
    LocalLan : string;
begin
    PathName := ExtractFilePath(Application.ExeName);
    Result := 0;
    CodeList := TStringList.Create;
    TempList := TStringList.Create;

    WinIni := TIniFile.Create(PathName + YRMyIniFile);
    LanguageChk := WinIni.ReadInteger('SETTING','LANGUAGE',0);
    LocalLan :=  WinIni.ReadString('SETTING','LOCAL','');
    FreeAndNil(WinIni);

  try
    CodeList.Clear;
    TempList.Clear;

    FileName := PathName + 'scr\Message.dat';
    if LanguageChk = 0 then begin
        MyLan := '[KR]'
    end else if LanguageChk = 1 then begin
        MyLan := '[' + Trim(Copy(LocalLan,Pos(',',LocalLan)+1,10)) + ']';
    end;

    if not FileExists(FileName) then begin
        exit;
    end;

    CodeList.LoadFromFile(FileName);

    TempCode := FormatFloat('00000',nCode);
    for i := 0 to CodeList.Count -1 do begin
        TempData := CodeList.Strings[i];
        if MyLan <> Copy(Trim(TempData),1,4) then continue;
        Delete(TempData,1,4);
        if TempCode = Copy(Trim(TempData),1,5) then begin
            TempMsg := Trim(Copy(Trim(TempData),7,200));
            if Length(Trim(nParam)) > 0 then begin
               TempList.CommaText := nParam;
                for j := 0 to TempList.Count -1 do begin
                    TempMsg := StringReplace(addParam + TempMsg, '%!', TempList.Strings[j], [rfIgnoreCase]);
                end;
            end;
            if nType = 1 then begin
                MessageDlg(addParam + TempMsg, nDlType,[mbOk], 0);
            end else if nType = 2 then begin
                Result := MessageDlg(addParam + TempMsg, mtConfirmation,[mbYes, mbNo], 0);
            end;
            break;
        end;
    end;
  finally
    FreeAndNil(TempList);
    FreeAndNil(CodeList);
  end;
end;

procedure DBMsgDlg(nCode: string; Gbn : integer=1);
var
    CodeList : TStringList;
    TempList : TStringList;
    TempCode : string;
    TempMsg : WideString;
    i,j : integer;
    PathName : string;
    WinIni : TIniFile;
    LanguageChk : integer;
    FileName : string;
    MyLan : string;
    TempData : WideString;
    MyTrCode : string;
    Tmp : string;
    LocalLan : string;
begin
    PathName := ExtractFilePath(Application.ExeName);
    CodeList := TStringList.Create;
    TempList := TStringList.Create;

    WinIni := TIniFile.Create(PathName + YRMyIniFile);
    LanguageChk := WinIni.ReadInteger('SETTING','LANGUAGE',0);
    LocalLan :=  WinIni.ReadString('SETTING','LOCAL','');
    FreeAndNil(WinIni);

  try
    CodeList.Clear;
    TempList.Clear;

    FileName := PathName + 'scr\DBMessage.dat';
    if LanguageChk = 0 then begin
        MyLan := '[KR]'
    end else if LanguageChk = 1 then begin
        MyLan := '[' + Trim(Copy(LocalLan,Pos(',',LocalLan)+1,10)) + ']';
    end;

    if not FileExists(FileName) then begin
        exit;
    end;
    CodeList.LoadFromFile(FileName);
    Tmp := nCode;

//  PostgreSQL
//        i_text := '50192' || 'ID ' || i_sabun || '%! ' || 'IP: ' ||  i_ip || '%!'; // 에러번호를 맨 앞에 써 줘야 함.. 구분자는 %!
//          PERFORM RAISERROR (50192 , 16, 1, 50192, i_text);
    if Pos('%!',Tmp) > 0 then begin
        Delete(Tmp,1,Pos(':',Tmp));
        Delete(Tmp,1,5);
        while Pos('%!',Tmp) > 0 do begin
            TempList.Add(Copy(Tmp,1,Pos('%!',Tmp)-1));
            Delete(Tmp,1,Pos('%!',Tmp)+1);
        end;
    end else if Pos('!!',Tmp) > 0 then begin // MSSQL (sp_addmessage 50006,16, '%d비밀번호 !!%d!!/3회 오류입니다. ','us_english')
        Delete(Tmp,1,Pos(':',Tmp));
        Delete(Tmp,1,5);
        while Pos('!!',Tmp) > 0 do begin
            Delete(Tmp,1,Pos('!!',Tmp)+1);
            TempList.Add(Copy(Tmp,1,Pos('!!',Tmp)-1));
        end;
    end;
//  MariaDB
//    while Pos('%!',Tmp) > 0 do begin   // SET $i_MSG := CONCAT('수정할 내용이 %!',$i_SUM1,'%!없거나 수정작업%!',$i_SUM2,'%!중 오류가%!',$i_SUM3,'%!발생했습니다');
//        Delete(Tmp,1,Pos('%!',Tmp)+1);
//        TempList.Add(Copy(Tmp,1,Pos('%!',Tmp)-1));
//        Delete(Tmp,1,Pos('%!',Tmp)+1);
//    end;

    MyTrCode := Trim(Copy(Trim(nCode),1,Pos(':',Trim(nCode))-1));
    MyTrCode := FormatFloat('00000',StrToIntDef(MyTrCode,0));
    Delete(nCode,1,Pos(':',Trim(nCode)));

    if Copy(Trim(nCode), 1, 1) = '#' then begin
        TempCode := FormatFloat('00000',StrToIntDef(Copy(Trim(nCode),2,5),0));
    end else begin
        TempCode := FormatFloat('00000',StrToIntDef(Copy(Trim(nCode),1,5),0));
    end;

    if TempCode = '00000' then begin
        TempMsg := '[' + MyTrCode + ']' + nCode;
//    end else if TempCode >= '50000' then begin
    end else if ((TempCode >= '90000') and (TempCode <= '99999')) or ((TempCode >= '50000') and (TempCode <= '59999')) then begin  // PostgreSQL에서는 50000번대에서 에러를 씀. 마리아는 90000번대부터 사용
        for i := 0 to CodeList.Count -1 do begin
            TempData := CodeList.Strings[i];
            if MyLan <> Copy(Trim(TempData),1,4) then continue;
            Delete(TempData,1,4);
            if TempCode = Copy(Trim(TempData),1,5) then begin
                TempMsg := Trim(Copy(Trim(TempData),7,200));
                for j := 0 to TempList.Count -1 do begin
                    TempMsg := StringReplace(TempMsg, '%!', TempList.Strings[j], [rfIgnoreCase]);
                end;
                TempMsg := '[' + MyTrCode + ']' + TempMsg;
                break;
            end;
        end;
    end;
    if Gbn = 1 then begin
        MessageDlg(TempMsg, mtError,[mbOk], 0);
    end else begin
        MessageDlg(TempMsg, mtInformation,[mbOk], 0);
    end;
  finally
    FreeAndNil(TempList);
    FreeAndNil(CodeList);
  end;
end;

procedure HSDelimited(const sl : TStrings; const value : AnsiString; const delimiter : Ansichar=';');
var
    i,j : integer;
begin
    i := 1;
    while i > 0 do begin
        j := i;
        i := FastCharPos(value,delimiter,i);
        if i > 0 then begin
            sl.Add(Trim(UTF8Decode(Copy(value,j,i-j))));
            Inc(i);
        end;
    end;
end;

function FastCharPos(const aSource : Ansistring; const C: AnsiChar; StartPos : Integer) : Integer;
var
    L : integer;
begin
    Assert(StartPos > 0);

    Result := 0;
    L := Length(aSource);
    if L = 0 then exit;
    if StartPos > L then exit;
    Dec(StartPos);
    asm
        PUSH EDI                 //Preserve this register

        mov  EDI, aSource        //Point EDI at aSource
        add  EDI, StartPos
        mov  ECX, L              //Make a note of how many chars to search through
        sub  ECX, StartPos
        mov  AL,  C              //and which char we want
      @Loop:
        cmp  Al, [EDI]           //compare it against the SourceString
        jz   @Found
        inc  EDI
        dec  ECX
        jnz  @Loop
        jmp  @NotFound
      @Found:
        sub  EDI, aSource        //EDI has been incremented, so EDI-OrigAdress = Char pos !
        inc  EDI
        mov  Result,   EDI
      @NotFound:

        POP  EDI
    end;
end;

end.
