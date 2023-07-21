unit PubHeader;

interface

type
  TQueryData = packed record                 // 공통헤더
    CompressFlg : byte;                      // 압축유무
    PacketID    : byte;                      // Packet 유형($01 : IP할당시 , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : byte;                      // Err 구분(0:정상, 1:에러)
    TrCd        : integer;                   // 조회번호
    BeAf        : byte;                      // 이전이후구분
    MsgCd       : integer;                   // 메세지코드
    Msg         : array [0..199] of byte;    // 에러메세지
    WinID       : integer;                   // 윈도아이디
    Org_Len     : integer;                   // 압축전 데이타 길이
    SQLGu       : byte;                      // SQL 구분($05 : 저장 프로시져, $06 : 일반 SQL문)
    NxtLen      : integer;                   // Next 값이 있을때 Next 키값
    Filler      : array [0..14] of byte;     // Filler(앞 2바이트 작업장)
    RCnt        : integer;                   // 레코드 갯수
  end;

type
  TQueryData2 = packed record                // IM때문에 사용 공통헤더
    CompressFlg : byte;                      // 압축유무
    PacketID    : byte;                      // Packet 유형($01 : IP할당시 , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : byte;                      // Err 구분(0:정상, 1:에러)
    TrCd        : integer;                   // 조회번호
    BeAf        : byte;                      // 이전이후구분
    MsgCd       : integer;                   // 메세지코드
    Msg         : array [0..79] of byte;     // 에러메세지
    WinID       : integer;                   // 윈도아이디
    Org_Len     : integer;                   // 압축전 데이타 길이
    SQLGu       : byte;                      // SQL 구분($05 : 저장 프로시져, $06 : 일반 SQL문)
    NxtLen      : integer;                   // Next 값이 있을때 Next 키값
    Filler      : array [0..14] of byte;     // Filler(앞 2바이트 작업장)
    RCnt        : integer;                   // 레코드 갯수
  end;

type
  TTr_Login = Packed record       // Login 정보
    Usid : array [1..10] of AnsiChar;  // User-id
    Usnm : array [1..24] of AnsiChar; // user name
    uscl : array [1..3] of AnsiChar;  // 권한그룹
  end;

type
  TFreeSvrRec = packed record        // 비어있는 서버의 아이피 및 포트
    SvrIp   : Array [0..14] of AnsiChar; // IP
    SvrPort : Integer;               // Port
  end;

type
  THS_FileData = packed record
    FileName : array [1..20] of byte; // 파일명
    FileSize : integer;
    Msg      : array [1..2] of byte;  // 구분(01:파일보냄 02:파일요청 03:파일없음 04:MD5오류 05:요청한 파일이 공백임 06:정상적으로 파일받음 07: ERP에서 FTP 다운받다가 에러 99 파일전부보냈음 00:폴링)
    MD5      : array [1..32] of byte; // MD5
    Handle   : integer;
  end;

type
  TSd_FileData = packed record
    FileName : array [1..20] of AnsiChar; // 파일명
    FileSize : integer;
    Msg      : array [1..2] of AnsiChar;  // 구분(01:파일보냄 02:파일요청 03:파일없음 04:MD5오류 05:요청한 파일이 공백임 06:정상적으로 파일받음 07: ERP에서 FTP 다운받다가 에러 99 파일전부보냈음 00:폴링)
    MD5      : array [1..32] of AnsiChar; // MD5
    Handle   : integer;
  end;
  
implementation

end.
