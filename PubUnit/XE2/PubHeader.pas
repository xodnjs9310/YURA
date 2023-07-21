unit PubHeader;

interface

type
  TQueryData = packed record                 // �������
    CompressFlg : byte;                      // ��������
    PacketID    : byte;                      // Packet ����($01 : IP�Ҵ�� , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : byte;                      // Err ����(0:����, 1:����)
    TrCd        : integer;                   // ��ȸ��ȣ
    BeAf        : byte;                      // �������ı���
    MsgCd       : integer;                   // �޼����ڵ�
    Msg         : array [0..199] of byte;    // �����޼���
    WinID       : integer;                   // �������̵�
    Org_Len     : integer;                   // ������ ����Ÿ ����
    SQLGu       : byte;                      // SQL ����($05 : ���� ���ν���, $06 : �Ϲ� SQL��)
    NxtLen      : integer;                   // Next ���� ������ Next Ű��
    Filler      : array [0..14] of byte;     // Filler(�� 2����Ʈ �۾���)
    RCnt        : integer;                   // ���ڵ� ����
  end;

type
  TQueryData2 = packed record                // IM������ ��� �������
    CompressFlg : byte;                      // ��������
    PacketID    : byte;                      // Packet ����($01 : IP�Ҵ�� , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : byte;                      // Err ����(0:����, 1:����)
    TrCd        : integer;                   // ��ȸ��ȣ
    BeAf        : byte;                      // �������ı���
    MsgCd       : integer;                   // �޼����ڵ�
    Msg         : array [0..79] of byte;     // �����޼���
    WinID       : integer;                   // �������̵�
    Org_Len     : integer;                   // ������ ����Ÿ ����
    SQLGu       : byte;                      // SQL ����($05 : ���� ���ν���, $06 : �Ϲ� SQL��)
    NxtLen      : integer;                   // Next ���� ������ Next Ű��
    Filler      : array [0..14] of byte;     // Filler(�� 2����Ʈ �۾���)
    RCnt        : integer;                   // ���ڵ� ����
  end;

type
  TTr_Login = Packed record       // Login ����
    Usid : array [1..10] of AnsiChar;  // User-id
    Usnm : array [1..24] of AnsiChar; // user name
    uscl : array [1..3] of AnsiChar;  // ���ѱ׷�
  end;

type
  TFreeSvrRec = packed record        // ����ִ� ������ ������ �� ��Ʈ
    SvrIp   : Array [0..14] of AnsiChar; // IP
    SvrPort : Integer;               // Port
  end;

type
  THS_FileData = packed record
    FileName : array [1..20] of byte; // ���ϸ�
    FileSize : integer;
    Msg      : array [1..2] of byte;  // ����(01:���Ϻ��� 02:���Ͽ�û 03:���Ͼ��� 04:MD5���� 05:��û�� ������ ������ 06:���������� ���Ϲ��� 07: ERP���� FTP �ٿ�޴ٰ� ���� 99 �������κ����� 00:����)
    MD5      : array [1..32] of byte; // MD5
    Handle   : integer;
  end;

type
  TSd_FileData = packed record
    FileName : array [1..20] of AnsiChar; // ���ϸ�
    FileSize : integer;
    Msg      : array [1..2] of AnsiChar;  // ����(01:���Ϻ��� 02:���Ͽ�û 03:���Ͼ��� 04:MD5���� 05:��û�� ������ ������ 06:���������� ���Ϲ��� 07: ERP���� FTP �ٿ�޴ٰ� ���� 99 �������κ����� 00:����)
    MD5      : array [1..32] of AnsiChar; // MD5
    Handle   : integer;
  end;
  
implementation

end.
