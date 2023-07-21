unit PubHeader;

interface

type
  TQueryData = packed record                 // �������
//    TotLength   : integer;                   // Packet��ü����(�� ��Ŷ�� ���� ������)
    CompressFlg : char;                      // ��������
    PacketID    : char;                      // Packet ����($01 : IP�Ҵ�� , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : char;                      // Err ����(0:����, 1:����)
//    TrCd        : array [0..3] of char;      // ��ȸ��ȣ
    TrCd        : integer;                   // ��ȸ��ȣ
    BeAf        : char;                      // �������ı���
    MsgCd       : array [0..3] of char;      // �޼����ڵ�
    Msg         : array [0..79] of char;     // �����޼���
    WinID       : integer;                   // �������̵�
    Org_Len     : integer;                   // ������ ����Ÿ ����
    SQLGu       : char;                      // SQL ����($05 : ���� ���ν���, $06 : �Ϲ� SQL��)
    NxtLen      : integer;                   // Next ���� ������ Next Ű��
    Filler      : array [0..14] of char;     // Filler(�� 2����Ʈ �۾���)
    RCnt        : integer;                   // ���ڵ� ����
end;

type
  TTr_Login = Packed record       // Login ����
    Usid : array [0..7] of char;  // User-id
    Usnm : array [0..19] of char; // user name
    Pass : array [0..7] of char;  // password
    uscl : array [0..2] of char;  // ����ڵ��
end;

type
  TPASSInfo = packed record // �ڵ� �� ���� ����
    Shandle    : integer;
    SSockNo    : integer;
  end;

type
  TDownInfo = packed record           // DownLoad ���� ����
    FileName : array [0..39] of char; // ���ϸ�
    DirName  : array [0..39] of char; // ������
    FileVer  : integer;               // ���Ϲ���
    FileSize : integer;               // ���ϻ�����
    FileSeq  : integer;               // �ٿ�ε� ����
  end;

type
  TFreeSvrRec = packed record        // ����ִ� ������ ������ �� ��Ʈ
    SvrIp   : array [0..14] of char; // IP
    SvrPort : integer;               // Port
end;

type
  TcDataRcv = Packed Record             // TIPS,SAM ���� ���
    SocIP    : array [0..14] of char;   // ���� IP
    SocWnn   : integer;                 // ���� Handle
    cNaeYong : array [0..2047] of char; // ����
  end;

type
  TcSQLData = Packed Record                // SAM ���� ���
    TipsWnn     : integer;                 // TIPS Handle
    TipsNaeYong : array [0..2047] of char; // ����
  end;

type
  TRequestLogin = packed record   // Login ��û
    Usid : array [0..7] of char;
    Pass : array [0..7] of char;
end;

// ��� : ����ڰ���(00300)
type
  TUserMaster2 = packed record
    Usid    : array [1..8] of char;  // User-id
    Usnm    : array [1..20] of char; // user name
    Pass    : array [1..8] of char;  // password
    uscl    : array [1..2] of char;  // ����ڵ��
    NAEYONG : array [1..20] of char; // ����ڵ�޳���
    USECHK  : char;                  // ��뿩��(0:���,1:�̻��)
end;

// ��� : ����ڰ���(00300)
type
  TEtcCode = packed record
    SCODE   : array [1..2] of char;  // �����ڵ�
    NAEYONG : array [1..20] of char; // ����
end;

// ��� : ���޾�ü ����(00020)
type
  TBPCode = packed record
    BPCODE  : array [1..10] of char;  // ��ü�ڵ�
    BPNAME  : array [1..40] of char; // ��ü��
end;

// ��� : ��ǰó ����(00030), (00032)
type
  TCTCode = packed record
    BPCODE  : array [1..8] of char;  // ��ü�ڵ�
    BPNAME  : array [1..40] of char; // ��ü��
end;

// ��� : ������ġ ����(00040), (00041), (40820)
type
  TMS_STRLOC = packed record
    SLCODE  : array [1..4] of char;  // ������ġ �ڵ�
    SLNAME  : array [1..50] of char; // ������ġ��
end;

// ��� : �ڽ�Ʈ����+���޾�ü����(00042)
type
  TMS_TEAMBPIF = packed record
    CODE  : array [1..10] of char;  // �ڵ�
    NAME  : array [1..50] of char;  // ��
end;

// ��� : �μ� ����(00100)
type
  TTEAMCode = packed record
    TCODE  : array [1..10] of char;  // �μ��ڵ�
    TNAME  : array [1..50] of char; // �μ���
    BPCHK  : char;                   // ���ֿ���
end;

// ��� : â������(00070)
type 
  TWHCode = packed record
    WHCODE  : array [1..8] of char;  // â���ڵ�
    WHNAME  : array [1..40] of char; // â��� 
end;
 
// ��� : â�� Loc ����(00080)
type
  TWHLoc = packed record
    WHCODE  : array [1..8] of char;  // â���ڵ�
    WHLOC   : array [1..10] of char; // LOCATION
    REMARK  : array [1..40] of char; // REMARK
    WHNAME  : array [1..40] of char; // â���
end;

// ��� : â�� Loc ã��(00081)
type
  TSWHLoc = packed record
    WHLOC   : array [1..10] of char;  // LOCATION
    WHNAME  : array [1..40] of char; // LOCATION �̸� 
end;
 
// ��� : â���ڵ�ã��(00081) 
type 
  TWHList = packed record 
    WHCODE  : array [1..8] of char;  // â���ڵ� 
    WHNAME  : array [1..40] of char; // â��� 
end; 

// ��� : ���縶����(00090)
type
  TJAJAEMst = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    SPLJCODE : array [1..30] of char;  // ��ü�����ڵ�
    STD      : array [1..50] of char;  // �԰ݸ�
    PMNAME   : array [1..50] of char;  // ��ü��
    DANWI    : array [1..5] of char;   // ����
    PACKQTY  : Integer;                // �ּ��������
    DANGA    : double;                 // ���ܰ�
end;

// ��� : ���帶����(70100)
type
  TPOJANGMST = packed record
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PNAME    : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    ZONE     : array [1..15] of char;  // ����
    CAR      : array [1..15] of char;  // ����
    JANGSO   : array [1..14] of char;  // ��ǰ���
    PQTY     : Integer;                // ���Լ���
    LCOL     : array [1..10] of char;  // �󺧻���
    MARK     : array [1..10] of char;  // ����
    LTYPE    : char;                   // ��Ÿ��
    HEAD     : char;                   // �չ���
    CGBN     : char;                   // ������ 
    YN       : char;                   // ��뿩��
end;

// ��� : �����ڵ� ã��(00091)
type
  TSJAJAE = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    STD      : array [1..50] of char;  // �԰ݸ�
    PMNAME   : array [1..50] of char;  // ��ü��
    DANWI    : array [1..5] of char;   // ����
end;

// ��� : ǰ�񸶽��� ã��(20301)
type
  TPTMST = packed record
    ITEMCODE : array [1..20] of char;  // �����ڵ�
    STD      : array [1..50] of char;  // �԰ݸ�
    PMNAME   : array [1..50] of char;  // ��ü��
    DANWI    : array [1..5] of char;   // ����
    GBN      : char;                   // ����ǰ����
end;

// ��� : �հ����� �÷���� ����(30100) 
type 
  TISO2859 = packed record 
    DANWI   : array [1..5] of char;  // LOT ���� 
    RMIN    : integer;               // �ּҰ� 
    RMAX    : integer;               // �ִ밪 
    INSQTY  : integer;               // �˻���� 
end;

// ��� : �����ڵ�ã��(20101) 
type 
  TPCodeList = packed record 
    PCODE  : array [1..5] of char;  // �����ڵ� 
    PNAME  : array [1..40] of char; // ������ 
end;

// ��� : �����ڵ�(20220)
type
  TMPCodeList = packed record
    PCODE  : array [1..5] of char;  // �����ڵ� 
    PNAME  : array [1..40] of char; // ������ 
end;

// ��� : �����ڵ�(39000)
type
  TMLineCode = packed record
    LCODE  : array [1..5] of char;  // �����ڵ�
    LNAME  : array [1..40] of char; // reMARK
end;

// ��� : ��ġ�׷� ����(20190) 
type 
  TLOCGROUP = packed record 
    GCODE  : array [1..2] of char;  // ��ġ�ڵ� 
    GNAME  : array [1..40] of char; // ��ġ�ڵ峻�� 
end;

// ��� : ������ ��������(20200)
type
  TPCode = packed record
    PCODE  : array [1..5] of char;   // �����ڵ�
    PNAME  : array [1..40] of char;  // ������
    PLINE  : array [1..5] of char;   // ���θ�
    PLOC   : array [1..2] of char;   // ��ġ�ڵ�
    PQTY   : integer;                // �������
    CAPA   : integer;                // CAPA
    CT     : double;                 // ����ŬŸ��(��)
    HUMAN  : double;                 // �ο�
    REMARK : array [1..40] of char;  // REMARK
end;

// ��� : �����������(20220)
type 
  TLINEINFO = packed record
    PCODE  : array [1..5] of char;   // �����ڵ� 
    PNAME  : array [1..40] of char;  // ������
    PLINE  : array [1..5] of char;   // ���θ� 
    HOGI   : array [1..5] of char;   // ��ġ�ڵ�
    JCHK   : char;                   // ����뿩��
    REMARK : array [1..50] of char;  // REMARK
    HONM   : array [1..20] of char;   // ��ġ�ڵ�    
end;

// ��� : ���� ĳ����NO(40510_!)
type 
  TPOJANGCAST = packed record
    CASTNO1 : array [1..10] of char;   // �����ڵ�
    QTY1    : integer;                 // ������
    CASTNO2 : array [1..10] of char;   // �����ڵ�
    QTY2    : integer;                 // ������
end;

// ��� : ǰ�� ������(00060)
type
  TITEMMst = packed record
    ITEMCODE  : array [1..20] of char; // ǰ��CODE
    STD       : array [1..50] of char; // �԰ݸ�
    PMNAME    : array [1..50] of char; // ǰ���
    DANWI     : array [1..5] of char;  // ����
    ITEMGB    : array [1..2] of char;  // ��ǰ����(I/G, S/P)
    ACCTGB    : array [1..2] of char;  // ��������(01:��ǰ, 02:����ǰ)
    REMARK    : array [1..20] of char; // REMARK
    QTY       : integer;               // ����
    DANGA     : Double;               // �ܰ�
end;

// ��� : ��ǥǰ�� ����(00110)
type
  TMS_REPITEM = packed record
    ITEMCODE  : array [1..20] of char; // ǰ��CODE
    STD       : array [1..50] of char; // �԰ݸ�
    PMNAME    : array [1..50] of char; // ǰ���
    DANWI     : array [1..5] of char;  // ����
    ITEMGB    : array [1..2] of char;  // ��ǰ����(I/G, S/P)
    ACCTGB    : array [1..2] of char;  // ��������(01:��ǰ, 02:����ǰ)
    REMARK    : array [1..20] of char; // REMARK
end;

// ��� : ����Ȯ��ó��(31200)
type
  TMS_JAJAEIPHA = packed record
    OCM_NO   : array [1..10] of char;  // ���ֹ�ȣ
    DOSEQ    : integer;                // ����
    SPLCODE  : array [1..10] of char;  // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�    
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    QTY1     : integer;                // ��ǰ����
    QTY2     : integer;                // �ҷ�����
  end; 

// ��� : �԰� I/F Ȯ��ó��(11630)
type
  TMS_IPIFCHK = packed record
    OCM_NO   : array [1..10] of char;  // ���ֹ�ȣ
    DOSEQ    : integer;                // ����
    SPLCODE  : array [1..10] of char;  // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�    
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    QTY1     : integer;                // ��ǰ������
  end;

// ��� : ����Ȯ�� ���ó��(31210)
type
  TMS_IPHACAN = packed record
    OCM_NO   : array [1..10] of char;  // ���ֹ�ȣ
    DOSEQ    : integer;                // ����
    SPLCODE  : array [1..10] of char;  // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�    
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    QTY1     : integer;                // ��ǰ����
    QTY2     : integer;                // �ҷ�����
  end;

// ��� : ���԰˻���(31400) 
type 
  TJAJAEYANGLIST2 = packed record 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    QTY      : integer;                // ���ϼ��� 
    QTY1     : integer;                // ��ǰ���� 
    QTY2     : integer;                // �ҷ����� 
    GQTY     : integer;                // �˻���� 
  end; 
 
// ��� : ����Ưä���(31500) 
type 
  TJAJAETUKLIST = packed record 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    SN       : array [1..10] of char;  // S/N 
    QTY      : integer;                // ����
  end; 
 
// ��� : �������ϵ�Ͽ� ������ָ���Ʈ(10100) 
type 
  TMS_DOINFO = Packed Record
    OCM_NO   : array [1..10] of char; // ���ֹ�ȣ
    DOSEQ    : integer;               // ����
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ���
    DANWI    : array [1..5] of char;  // ȯ�����
    DOQTY    : integer;               // ȯ�����
    IPQTY    : integer;               // �԰����
  end;
 
// ��� : ���縶�����Ϻ�(10100) 
type 
  TIPBalJooList2 = packed record 
    BJDATE : array [1..10] of char; // �������� 
    OCM_NO : array [1..20] of char; // ���ֹ�ȣ 
  end; 
 
// ��� : �������ó��(10300) 
type 
  TJaSinList = packed record 
    SINDT : array [1..10] of char; // ��û���� 
    SINNO : array [1..12] of char; // ��û��ȣ 
  end;

// ��� : ��ǰ���ó��(70220_1)
type 
  TCHULHAREQ = packed record
    SINDT : array [1..10] of char; // �Ƿ�����
    CHLNO : array [1..12] of char; // �Ƿڹ�ȣ
  end;

// ��� : ��ǰ ���ó��(70220)
type
  TChulgoLst = packed record
    SINDT    : array [1..10] of char; // ��û����
    ITEMCODE : array [1..20] of char; // ǰ���ڵ�
    PMNAME   : array [1..50] of char; // ǰ���
    STD      : array [1..50] of char; // �԰ݸ�
    SINQTY   : integer;               // ��û����
    CQTY     : integer;               // ������
    DANWI    : array [1..5] of char;  // ����
  end;

// ��� : ��ǰ ���ó��(70220)
type 
  TChlItemQty = packed record
    ITEMCODE : array [1..20] of char; // ǰ���ڵ�
    CQTY     : integer;               // ������
  end;

// ��� : �������ó��(10300)
type
  TJaSinList2 = packed record
    SINDT    : array [1..10] of char; // ��û����
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    SINQTY   : integer;               // ��û����
    WICHI    : array [1..2] of char;  // ��ġ����
    PCODE    : array [1..10] of char;  // �����ڵ�
    CQTY     : integer;               // ������
    DANWI    : array [1..5] of char;  // ����
  end;

// ��� : �������ó��(10300)
type
  TJaSinList3 = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    WICHI    : array [1..2] of char;  // ��ġ����
    QTY      : integer;               // ������
  end;
 
// ��� : ���縶�����Ϻ�(10100) 
type 
  TMS_DOINFOLST = Packed Record
    YURACODE : array [1..20] of char; // �����ڵ� 
    STD      : array [1..50] of char; // �԰� 
    PMNAME   : array [1..50] of char; // ǰ��� 
    PACKQTY  : integer;               // �������� ���� ����
    DANWI    : array [1..5] of char;  // �⺻����
    QTY      : integer;               // �԰�ȼ���
    BPCODE   : array [1..10] of char; // ��ü�ڵ�
    BPNAME   : array [1..40] of char; // ��ü��
    DOQTY    : integer;               // ��ǰ������
    SPLSN    : array [1..20] of char; // �԰��Ʈ
    SLCODE   : array [1..4] of char;  // �԰�������ġ
    DODANWI    : array [1..5] of char;// ��ǰ������
  end;
 
// ��� : Ưä�ڵ� ����(30300) 
type 
  TSPECODE = packed record 
    SCODE  : array [1..8] of char;  // Ưä�ڵ� 
    SNAME  : array [1..50] of char; // Ưä���� 
  end; 
 
// ��� : ���԰˻� �ҷ��ڵ� ����(30200)  
type  
  TJAJAEQCCODE = packed record  
    JQCCODE  : array [1..8] of char;  // �ҷ��ڵ�  
    JQCNAME  : array [1..50] of char; // �ҷ�����  
end; 

// ��� : ���� �ҷ��ڵ� ����(30210)   
type   
  TPROCQCCODE = packed record   
    PCODE   : array [1..5] of char;  // �����ڵ�
    PNAME   : array [1..40] of char; // ������
    PQCCODE : array [1..8] of char;  // �����ҷ��ڵ�
    PQCNAME : array [1..50] of char; // �����ҷ�����
    BCAUSE  : array [1..50] of char; // �߻�����
    IMGNM   : array [1..20] of char; // �̹��� 
end;

// ��� : ĳ����NO�� �ҷ��м�(32100)
type   
  TCASTANALY = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SEQNO   : integer;                // ����
    BADTYPE : array [1..20] of char;  // �ҷ�����
    ONER    : array [1..6] of char;   // 1������
    TWOR    : array [1..6] of char;   // 2������
    TWOV    : array [1..6] of char;   // 2������
    IMGNM   : array [1..20] of char;  // ÷��
    REMARK  : array [1..50] of char;  // ��Ÿ
    GUMTYPE : array [1..20] of char;  // ��������
    QTY     : integer;                // ����
  end;

// ��� : ĳ����NO�� ��������(32120)
type
  TCASTTEST = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    MANAME  : array [1..20] of char;  // �������
    TDATE   : array [1..10] of char;  // ��������
    SEQNO   : integer;                // ����
    FAILT   : integer;                // ����ð�
    STOPT   : integer;                // �ߴܽð�
    RLTDEC  : array [1..60] of char;  // �м����
    IMGNM   : array [1..20] of char;  // ÷��
    REMARK  : array [1..500] of char; // ��Ÿ
  end;

// ��� : ĳ����NO�� ���� ����(32110)
type
  TCASTCARE = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SDATE   : array [1..10] of char;  // �߻���
    SSIGAN  : array [1..8] of char;   // �߻��ð�
    EDATE   : array [1..10] of char;  // ������
    ESIGAN  : array [1..8] of char;   // �����ð�
    REASON  : array [1..50] of char;  // ����
    REMARK  : array [1..50] of char;  // ��Ÿ
  end;

// ��� : ǰ������ҿ䷮(20300)
type
  TITEMBOM = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    ISTD     : array [1..50] of char;  // �԰ݸ�
    IPMNAME  : array [1..50] of char;  // ǰ���
    PCODE    : array [1..5] of char;   // �����ڵ�
    PNAME    : array [1..40] of char;  // ������
    YURACODE : array [1..20] of char;  // �����ڵ�
    JSTD     : array [1..50] of char;  // �԰ݸ�
    JPMNAME  : array [1..50] of char;  // ǰ��
    DANWI    : array [1..5] of char;   // ����
    REQTY    : double;                 // �ҿ����
    GBN      : char;                   // ����
end;

// ��� : ������ �����û(10700)
type
  TJAJAESINMST = packed record
    SINNO    : array [1..12] of char;  // ��û��ȣ
    CHLDT    : array [1..10] of char;  // ����û����
    WICHI    : array [1..2] of char;   // ��ġ
    JGBN     : array [1..2] of char;   // ��ǰ����  
    SINDT    : array [1..10] of char;  // ��û����
    SABUN    : array [1..20] of char;  // ��û��
    YN       : char;                   // ��û���� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    ID_PASS  : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    GBN      : array [1..2] of char;   // ����
    CHSLC    : array [1..4] of char;  // ���������ġ�ڵ�
    SLNAME   : array [1..50] of char;  // ���������ġ�ڵ��
    IPSLC    : array [1..10] of char;  // �԰�������ġ�ڵ�
    NAME     : array [1..50] of char;  // �԰�������ġ�ڵ��

end;

// ��� : �����Ƿ� ���(50100)
type
  TCHULHAREQMST = packed record
    CHLNO    : array [1..12] of char;  // ���Ϲ�ȣ
    CHLDT    : array [1..10] of char;  // ����û����
    CTCODE   : array [1..10] of char;  // ��ǰó �ڵ�
    CTNAME   : array [1..50] of char;  // ��ǰó��
    JGBN     : array [1..2] of char;   // ��ǰ����
    SINDT    : array [1..10] of char;  // �Ƿ�����
    SABUN    : array [1..20] of char;  // ��û��
    YN       : char;                   // ��û���� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    ID_PASS  : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    CHGBN    : array [1..2] of char;   // �����
    SLCODE   : array [1..4] of char;   // ���������ġ
    SLNAME   : array [1..50] of char;  // ���������ġ��
end;

// ��� : â�� Loc�����Ȳ(11160)
type 
  TJAJAEWHLIST2 = packed record
    WHCODE   : array [1..8] of char;  // â���ڵ� 
    WHNAME   : array [1..40] of char; // â���
    WHLOC    : array [1..10] of char; // LOCATION      
    YURACODE : array [1..20] of char; // �����ڵ� 
    PMNAME   : array [1..50] of char; // ǰ�� 
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY      : integer;               // ���ϼ��� 
  end;

// ��� : â�� �����Ȳ(11170)
type 
  TSJAJAEWHLIST = packed record
    WHCODE   : array [1..8] of char;  // â���ڵ� 
    WHNAME   : array [1..40] of char; // â���
    YURACODE : array [1..20] of char; // �����ڵ� 
    PMNAME   : array [1..50] of char; // ǰ�� 
    STD      : array [1..50] of char; // �԰ݸ�
    QTY      : integer;               // ���ϼ��� 
  end;

// ��� : â�� ��ǰ�����Ȳ(70620)
type
  TSPRODWHLIST = packed record
    WHCODE   : array [1..8] of char;  // â���ڵ� 
    WHNAME   : array [1..40] of char; // â���
    ITEMCODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ���
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY      : integer;               // ������
  end;

// ��� : â�� ��ǰ�����Ȳ(��)(70810)
type
  TSPRODWHDET = packed record
    WHCODE   : array [1..8] of char;  // â���ڵ� 
    WHNAME   : array [1..40] of char; // â���
    ITEMCODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ���
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY      : integer;               // ������
    WHLOC    : array [1..10] of char;  // LOCATION
    LOTNO    : array [1..10] of char;  // LOTNO
    CASTNO   : array [1..10] of char;  // CASTNO
    IPDATE   : array [1..10] of char;  // �԰�����
  end;

// ��� : �����ڵ庰 LOC���(11100) 
type 
  TJAJAELOCLIST = packed record 
    ILJA  : array [1..10] of char;  // ��������
    WHLOC : array [1..10] of char;  // LOCATION
    QTY   : integer;                // ���ϼ��� 
  end;   

// ��� : ǰ���ڵ庰 LOC���(70630)
type
  TPROCLOCLIST = packed record
    ILJA  : array [1..10] of char;  // �԰�����
    WHLOC : array [1..10] of char;  // LOCATION
    QTY   : integer;                // �԰����
  end;

// ��� : ĳ����NO�� �ܰ��ҷ� ��Ȳ(33190)
type
  TAPPQCPRE = packed record
    PNAME   : array [1..40] of char;  // ������
    PQCCODE : array [1..8] of char;   // �ҷ��ڵ�
    PQCNAME : array [1..50] of char;  // �ҷ��ڵ��
    QTY     : integer;                // �ҷ�����
  end;

// ��� : ĳ����NO�� ������ü ��Ȳ(33200)
type
  TDAECHEPRE = packed record
    PNAME   : array [1..40] of char;   // ������
    PLINE   : array [1..5] of char;    // ����
    QTY     : integer;                 // �ҷ�����
    TNAME   : array [1..40] of char;   // �μ���
    NAEYONG  : array [1..50] of char;  // �������ڵ��
    SNAEYONG : array [1..50] of char;  // ��������
    ILJA    : array [1..10] of char;   // ����
    SIGAN   : array [1..8] of char;    // �ð�
    IRUM    : array [1..20] of char;     // ó����
  end;

// ��� : �����ڵ庰 LOC���(��ü����)(11200)
type 
  TMJAJAELOCLIST = packed record
    ILJA     : array [1..10] of char;     // ��������
    WHLOC    : array [1..10] of char;     // LOCATION
    BPNAME   : array [1..40] of char;     // ��ü��
    SPLSN    : array [1..20] of char;     // ��üLOT
    QTY      : integer;                   // ���ϼ���
    SPLCODE  : array [1..10] of char;      // ��ü�ڵ�
    REMARK   : array [1..100] of char;    // ���
  end;

// ��� : ǰ���ڵ庰 LOC�����Ȳ(��)(70830)
type
  TITEMLOCDET = packed record
    ILJA     : array [1..10] of char;     // �԰�����
    WHLOC    : array [1..10] of char;     // LOCATION
    LOTNO    : array [1..10] of char;     // LOTNO
    CASTNO   : array [1..10] of char;     // CASTNO
    QTY      : integer;                   // �԰����
    REMARK   : array [1..100] of char;    // ���
  end;

// ��� : �ڽ����ڵ� ����(70831)
type
  TPRODJANEGOBOX = packed record
    BOXNO : array [1..10] of char;  // �԰�����
    QTY   : integer;                // �԰����
  end;

  // ��� : �����ڵ庰 ��üLOT ��ȸ(11180)
type 
  TJAJAESPLSNLIST = packed record 
    WHCODE   : array [1..8] of char;   // â���ڵ� 
    WHNAME   : array [1..40] of char;  // â��� 
    WHLOC    : array [1..10] of char;  // Location 
    YURACODE : array [1..20] of char;  // ���������ڵ� 
    SPLSN    : array [1..20] of char;  // ��üLOT 
    Qty      : integer;                // ������ 
end; 
 
// ��� : �����ڵ庰 ��üLOT ����ȸ(11190) 
type 
  TJAJAESPLSNDLIST = packed record 
    WHCODE   : array [1..8] of char;   // â���ڵ� 
    WHNAME   : array [1..40] of char;  // â��� 
    WHLOC    : array [1..10] of char;  // Location 
    YURACODE : array [1..20] of char;  // ���������ڵ� 
    SPLSN    : array [1..20] of char;  // ��üLOT
    YURASN   : array [1..10] of char;  // ����LOT 
    IPDate   : array [1..10] of char;  // �԰����� 
    Qty      : integer;                // ������
end;

// ��� : �����ȹ ��ȸ(20410)
type
  TWeekPlanList = packed record
    PLDATE    : array [1..10] of char; // ��ȹ����
    PCODENAME : array [1..47] of char; // ����
    PLINE     : array [1..5] of char;  // ����
    ITEMCODE  : array [1..20] of char; // �����ڵ�
    PMNAME    : array [1..50] of char; // ǰ���
    STD       : array [1..50] of char; // �԰ݸ�
    DANWI     : array [1..5] of char;  // ����
    GQTY      : integer;               // ��ȹ����
end;

// ��� : ��ȹ���ҿ䷮ ��ȸ(10710)
type 
  TJAJAEREQ = packed record
    PCODE    : array [1..5] of char;   // �����ڵ�
    PNAME    : array [1..40] of char;  // ������
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    PACKQTY  : Integer;                // �ּ��������
    DANWI    : array [1..5] of char;   // ����
    SOYOQTY  : double;
    JGQTY    : int64;    
end;

// ��� : �����Ƿ� ��(50110)
type
  TCHULHAREQL = packed record
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PNAME    : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SINQTY   : Integer;                // �Ƿڼ���
    REMARK   : array [1..50] of char;  // REMARK
end;

// ��� : �����Ƿ� ��(50210)
type
  TYCHULHAREQL = packed record
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PNAME    : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SINQTY   : Integer;                // �Ƿڼ���
    REMARK   : array [1..50] of char;  // REMARK
end;

// ��� : �����ڵ� ��ȸ(10720)
type
  TJAJAESEL = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    PACKQTY  : Integer;                // �ּ��������
    DANWI    : array [1..5] of char;   // ����
end;

// ��� : ǰ���ڵ� ��ȸ(50111)
type
  TPTMSTVIEW = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
end;

// ��� : ���� ��û����(10751)
type 
  TDSJAJAESIN = packed record
    PNAME    : array [1..50] of char;  // ������
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    PACKQTY  : Integer;                // �ּ��������
    DANWI    : array [1..5] of char;   // ����
    SINQTY   : Integer;
    REMARK   : array [1..50] of char;  // REMARK
end;

// ��� : ��û��������Ȳ(10761)
type
  TCHJAJAESIN = packed record 
    PNAME    : array [1..50] of char;  // ������ 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ��� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    PACKQTY  : Integer;                // �ּ�������� 
    DANWI    : array [1.. 5] of char;  // ���� 
    SINQTY   : Integer; 
    CHLQTY   : Integer; 
    DIFQTY   : Integer; 
    GBN      : array [1.. 2] of char; 
    CHLDT    : array [1..10] of char; 
    REMARK   : array [1..50] of char;  // REMARK 
end;

// ��� : ������� �󼼳���(11210)
type
  TCHGDETAIL = packed record
    WHLOC    : array [1..10] of char;   // WHLOC
    YURASN   : array [1..10] of char;   // ���ڵ�
    CHLQTY   : Integer;                 // ������
    CHGDATE  : array [1..10] of char;   // �������
    SIGAN    : array [1..8] of char;    // ���ð�
    BPNAME   : array [1..40] of char;   // ���޾�ü
    SPLSN    : array [1..20] of char;   // ��üSN
    IPDATE   : array [1..10] of char;   // �԰�����
end;

// ��� : �����Ƿڴ�������Ȳ(70501)
type
  TCHCHULHAREQL = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SINQTY   : Integer;
    CHLQTY   : Integer;
    DIFQTY   : Integer;
    GBN      : array[1..2] of char;
    CHLDT    : array [1..10] of char;
    REMARK   : array [1..50] of char;  // REMARK
end;

// ��� : �������Ȳ(70502)
type
  TCHULHADELL = packed record
    BOXNO    : array [1..10] of char;  // �ڽ����ڵ�
    CHLQTY   : Integer;
    CHLDT    : array [1..10] of char;
    CHSIGAN  : array [1..8] of char;
    LOTNO    : array [1..20] of char;
end;

// ��� : �����������û �� ��ȸ(10710)
type
  TJAJAESIN = packed record
    PCODE    : array [1..10] of char;   // �����ڵ�
    PNAME    : array [1..40] of char;  // ������
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    PACKQTY  : Integer;                // �ּ��������
    DANWI    : array [1..5] of char;   // ����
    SOYOQTY  : double;
    SINQTY   : Integer;
    PLNDT    : array [1..10] of char; // ��ȹ��
    REMARK   : array [1..50] of char; // REMARK
end;

// ��� : �����������û �� ��ȸ(10720)
type
  TMS_JAJAESIN = packed record
    PCODE    : array [1..10] of char;   // �����ڵ�
    PNAME    : array [1..50] of char;  // ������
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    PACKQTY  : Integer;                // �ּ��������
    DANWI    : array [1..5] of char;   // ����
    SOYOQTY  : double;
    SINQTY   : Integer;
    PLNDT    : array [1..10] of char; // ��ȹ��
    REMARK   : array [1..50] of char; // REMARK
end;

// ��� : ����Ȯ�����(31210) 
type 
  TJAJAECANCELLIST = packed record
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ� 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    QTY      : integer;                // ���ϼ��� 
    QTY1     : integer;                // ��ǰ���� 
    QTY2     : integer;                // �ҷ����� 
end;

// ��� : �Ⱓ�� �����԰���Ȳ(Loc����)(10910) 
type 
  TILJAJAJAELIST = packed record 
    ILJA     : array [1..10] of char;  // �������� 
    WHNAME   : array [1..40] of char;  // â��� 
    WHLOC    : array [1..10] of char;  // LOCATION 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    QTY      : integer;                // �԰���� 
    QTY1     : integer;                // Ưä���� 
end;

// ��� : ��ü�� ����������Ȳ(10900)
type
  TILJAJAJAELIST3 = packed record
    ILJA     : array [1..10] of char;  // ��������
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
  end;
 
// ��� : ��ü�� �����԰���Ȳ(11150)
type
  TILJAJAJAELIST4 = packed record
    ILJA     : array [1..10] of char;  // ��������
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // �԰����
    QTY1     : integer;                // Ưä����
end;

// ��� : ��ü�� ����������Ȳ(��üS/N����)(10930)
type
  TIPHASPLSN = packed record
    ILJA     : array [1..10] of char;  // ��������
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����    
    SPLSN    : array [1..20] of char;  // ��üS/N
    QTY      : integer;                // ���ϼ���
end;

// ��� : ��ü�� ����������Ȳ(��ǥ���ڵ�����)(10940)
type
  TBIPHASPLSN = packed record
    ILJA     : array [1..10] of char;  // ��������
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����    
    SPLSN    : array [1..20] of char;  // ��üS/N
    KEYNUM   : array [1..10] of char;  // ��ǥ���ڵ�
    QTY      : integer;                // ���ϼ���
end;

// ��� : �Ⱓ�� �����԰���Ȳ(11140) 
type 
  THILJAJAJAELIST = packed record 
    ILJA     : array [1..10] of char;  // �������� 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    QTY      : integer;                // �԰���� 
    QTY1     : integer;                // Ưä���� 
end;

// ��� : �Ⱓ�� ��ǰ(����)�԰���Ȳ(70600)
type
  TPRODIPLIST = packed record
    ILJA     : array [1..10] of char;  // �԰�����
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
end;

// ��� : ���ں� ��ǰ(����) �� �԰���Ȳ(70590)
type
  TPRODIPDLIST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5]  of char;  // ����
    CASTNO   : array [1..10] of char;  // CASTNO
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // �԰����
    IPDATE   : array [1..10] of char;  // �԰�����
    IPSIGAN  : array [1..8]  of char;  // �԰�ð�
    IRUM     : array [1..20] of char;  // �̸�
    WHLOC    : array [1..10] of char;  //
    KEYNUM   : array [1..10] of char;
end;

// ��� : �Ⱓ�� ��ǰ �԰���Ȳ(LOTNO����)(70610)
type
  TPRODIPLOTLIST = packed record
    ILJA     : array [1..10] of char;  // �԰�����
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // �԰����
    WHLOC    : array [1..10] of char;  //
    QTY1     : integer;                // �԰����        
end;

// ��� : �Ⱓ�� ��ǰ �԰���Ȳ(CASTNO����)(7080)
type
  TPRODIPCASTLIST = packed record
    ILJA     : array [1..10] of char;  // �԰�����
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // �԰����
    WHLOC    : array [1..10] of char;  //
    QTY1     : integer;                // �԰����
    CASTNO   : array [1..10] of char;  // LOTNO            
end;

// ��� : �Ⱓ�� ��ü Ưä���� ���� ��ȸ(30320) 
type 
  THILJATUKLIST = packed record
    ILJA     : array [1..10] of char;  // Ưä�������� 
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ� 
    BPNAME   : array [1..40] of char;  // ��ü�� 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    QTY      : integer;                // Ưä���� 
end; 


// ��� : �����û ���� �� ���(10750)
type
  TJAJAESINYN = packed record
    CHLDT    : array [1..10] of char;  // ����û����
    SINNO    : array [1..12] of char;  // ��û��ȣ
    WICHI    : array [1..2] of char;   // ��ġ
    JGBN     : array [1..2] of char;   // ��ǰ����
    SIRUM    : array [1..20] of char;  // ��û��
    YN       : char;                   // ���ο��� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    YIRUM    : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    GBN      : array [1..2] of char;   // ����
    CHSLC    : array [1..4] of char;   // ���������ġ�ڵ�
    SLNAME   : array [1..50] of char;  // ���������ġ�ڵ��
    IPSLC    : array [1..10] of char;  // �԰�������ġ�ڵ�
    NAME     : array [1..50] of char;  // �԰�������ġ�ڵ��
end;


// ��� : �����Ƿ� ���(50200)
type
  TCHULHAREQMSTYN = packed record
    CHLDT    : array [1..10] of char;  // ����û����
    CHLNO    : array [1..12] of char;  // ���Ϲ�ȣ
    CTNAME   : array [1..50] of char;  // ��ǰó��
    JGBN     : array [1..2] of char;   // ��ǰ����
    SIRUM    : array [1..20] of char;  // ��û��
    YN       : char;                   // ��û���� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    YIRUM    : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    CHGBN    : array [1..2] of char;   // ����
    SLCODE   : array [1..4] of char;   // ���������ġ
    SLNAME   : array [1..50] of char;  // ���������ġ��        
end;

// ��� : �����û �� �����Ȳ(10760)
type
  TSJAJAESINYN = packed record
    CHLDT    : array [1..10] of char;  // ����û����
    SINNO    : array [1..12] of char;  // ��û��ȣ
    WICHI    : array [1..2] of char;   // ��ġ
    JGBN     : array [1..2] of char;   // ��ǰ����
    SIRUM    : array [1..20] of char;  // ��û��
    YN       : char;                   // ���ο��� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    YIRUM    : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    CHGBN    : array [1..2] of char;   // ����    
end;

// ��� : �����Ƿ� �� �����Ȳ(70500)
type
  TLCHULHAREQMSTYN = packed record
    CHLDT    : array [1..10] of char;  // ����û����
    CHLNO    : array [1..12] of char;  // ���Ϲ�ȣ
    CTNAME   : array [1..40] of char;  // ��ǰó��
    JGBN     : array [1..2] of char;   // ��ǰ����
    SIRUM    : array [1..20] of char;  // ��û��
    YN       : char;                   // ��û���� '1;��û'
    DT_PASS  : array [1..10] of char;  // ��������
    YIRUM    : array [1..20] of char;  // ������
    REMARK   : array [1..60] of char;  // ���
    CHGBN    : array [1..2] of char;   // ����    
end;

// ��� : ������ ǰ������ ã��(20400) 
type 
  TItemCodeList = packed record 
    ITEMCODE  : array [1..20] of char;   // ǰ���ڵ� 
    STD       : array [1..50] of char;   // �԰ݸ� 
    PMNAME    : array [1..50] of char;   // ǰ��� 
    DANWI     : array [1..5] of char;    // ���� 
end;

// ��� : �����ȹ ���(20400) 
type 
  TWeekPlan = packed record 
    ITEMCODE : array [1..20] of char; // ǰ��CODE 
    PLDATE   : array [1..10] of char; // ��ȹ�� 
    GQTY     : integer;               // ��ȹ���� 
end;

// ��� : ��ü�� �����԰���Ȳ(Loc����)(10920)
type
  TILJAJAJAELIST2 = packed record
    ILJA     : array [1..10] of char;  // ��������
    WHNAME   : array [1..40] of char;  // â���
    WHLOC    : array [1..10] of char;  // LOCATION
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
    QTY1     : integer;                // Ưä����
end;

// ��� : ��ü�� �����԰���Ȳ(��üSN����)(10950)
type
  TMILJAJAJAELIST = packed record
    ILJA     : array [1..10] of char;  // ��������
    WHNAME   : array [1..40] of char;  // â���
    WHLOC    : array [1..10] of char;  // LOCATION
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SPLSN    : array [1..20] of char;  // ��üS/N
    QTY      : integer;                // �԰����
    QTY1     : integer;                // Ưä����
end;

// ��� : �˻縶ŷ ����Ÿ ��ȸ(���κ�)(39000)
type
  TMARKDATA = packed record
    INBOX       : array [1..13] of char;  // �����ڽ�
    CASTNO      : array [1..10] of char;  // ĳ��ƮNO
    LOTNO       : array [1..15] of char;  // LOTNO
    ITEMCODE    : array [1..20] of char;  // ǰ���ڵ�        
    PMNAME      : array [1..50] of char;  // ǰ��            
    STD         : array [1..50] of char;  // �԰ݸ�          
    RESULT      : array [1..2] of char;   // ���            
    POWVAL      : array [1..8] of char;   // POWER           
    CHARTIME    : array [1..8] of char;   // Charging Time   
    CURRAT      : array [1..8] of char;   // Current at 1.5ms
    MAXCUR      : array [1..8] of char;   // Max Current     
    RISTIME     : array [1..8] of char;   // Rising Time     
    REVVOLT     : array [1..8] of char;   // Reverse Volt    
    PEAKVOLT    : array [1..8] of char;   // Peak Volt       
    LOWPPM      : INTEGER;                // ��RPM           
    LOWONTIME   : array [1..8] of char;   // OnTime          
    HIGHPPM     : INTEGER;                // ��RPM           
    HIGHONTIME  : array [1..8] of char;   // OnTime          
    INVOLT      : array [1..8] of char;   // ������          
    VTWO        : array [1..8] of char;   // V2�˻�
    LPEAKVOLT   : array [1..8] of char;   // L.PEAKVOLT      
    TEMP        : array [1..8] of char;   // TEMP            
    DT_REG      : array [1..10] of char;  // �˻�����        
    SIGAN       : array [1..8] of char;   // �˻�ð�        
    DT_MARK     : array [1..10] of char;  // ��ŷ����
end;

// ��� : �������ü�������ó��(40010) 
type  
  TQLTBCODE = packed record 
    PQCCODE  : array [1..8] of char; 
    PQCNAME  : array [1..50] of char; 
    FILENAME : array [1..20] of char; 
  end;

// ��� : �˸�����ó��(40200), V2�˻�(40300)
type 
  TVIEWPIN2 = packed record 
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ 
    RQTY     : integer;                // ��ǰ���� 
  end;

// ��� : ���� ����ó��(40500)
type
  TVIEWPO = packed record
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ 
    RQTY     : integer;                // ��ǰ���� 
  end;

// ��� : ����ҷ����(40540)
type
  TPOBAD = packed record
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ�
  end;

// ��� : �������ü�������ó��(40010),��������ó��(40810),�Ǽ���������ó��(40020) 
type 
  TJJTOOIP_JV = packed record 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    QTY      : integer;                // ���� 
    SPLSN    : array [1..20] of char;  // ��üLOT 
    IPTUK    : char;                   // Ưä���� 
  end;

  // ��� : �ܰ��˻����ó��(40400) 
type 
  TQUALITYLIST = packed record 
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    RQTY     : integer;                // ��ǰ���� 
    BQTY     : integer;                // �ҷ����� 
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ 
    SIGAN    : array [1..8] of char;   // �ð� 
    SABUN    : array [1..10] of char;  // ����� 
  end;

  // ��� : ��������ó��(40500)
type
  TPOJANGIN = packed record
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    RQTY     : integer;                // ��ǰ���� 
    BQTY     : integer;                // �ҷ����� 
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ 
    SIGAN    : array [1..8] of char;   // �ð� 
    SABUN    : array [1..10] of char;  // ����� 
  end;

// ��� : ������ ��������(20200) 
type 
  TPACKQTY = packed record 
    PCODE  : array [1..5] of char;   // �����ڵ� 
    PLINE  : array [1..5] of char;   // ���θ� 
    PQTY   : integer;                // �������
  end;   

// ��� : ��������ó��(40500)
type 
  TPQLT_B = packed record
    PQCCODE : array [1..8] of char;   // �ҷ��ڵ�
    PQCNAME : array [1..50] of char;  // �ҷ�����
    BQTY    : integer;                // �ҷ�����
  end;

// ��� : ������ ǰ������(20210)
type 
  TPROCITEMCODE = packed record
    PCODE     : array [1..5] of char;    // �����ڵ�
    PNAME     : array [1..40] of char;   // ������
    ITEMCODE  : array [1..20] of char;   // ǰ���ڵ�
    PMNAME    : array [1..50] of char;   // ǰ���
    STD       : array [1..50] of char;   // �԰ݸ� 
    REMARK    : array [1..40] of char;   // Remark 
end;

// ��� : ��������ó��(40500)
type
  TPOJANGCB1 = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..50] of char;  // ǰ���
end;

// ��� : �������ó��(40510)
type
  TMS_POJANG = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..50] of char;  // ǰ���
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

// ��� : �������ó��(40510)
type
  TPOJANGCB = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    ZONE     : array [1..15] of char;  // ����
    CAR      : array [1..15] of char;  // ����
    JANGSO   : array [1..14] of char;  // ��ǰ���
    DANWI    : array [1..5] of char;   // ����
    PQTY     : integer;                // ���Լ���
    LCOL     : array [1..10] of char;  // �󺧻���
    MARK     : array [1..10] of char;  // ����
    LTYPE    : char;                   // ��Ÿ��
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // ������
    QTY      : double;                 // set ����
end;

// ��� : ����и�(70280)
type
  TPOJANDIV = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    ZONE     : array [1..15] of char;  // ����
    CAR      : array [1..15] of char;  // ����
    JANGSO   : array [1..14] of char;  // ��ǰ���
    DANWI    : array [1..5] of char;   // ����
    PQTY     : integer;                // ���Լ���
    LCOL     : array [1..10] of char;  // �󺧻���
    MARK     : array [1..10] of char;  // ����
    LTYPE    : char;                   // ��Ÿ��
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // ������
    QTY      : double;                 // set ����
    LOTNO    : array [1..10] of char;  // LOTNO
    BOXNO1   : array [1..10] of char;  // BOXNO1
    BOXNO2   : array [1..10] of char;  // BOXNO2
    CASTNO   : array [1..10] of char;  // CASTNO
    PMNAME   : array [1..50] of char;  // ǰ���
end;

// ��� : ������ü(70290)
type
  TPOJANSUM = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    ZONE     : array [1..15] of char;  // ����
    CAR      : array [1..15] of char;  // ����
    JANGSO   : array [1..14] of char;  // ��ǰ���
    DANWI    : array [1..5] of char;   // ����
    PQTY     : integer;                // ���Լ���
    LCOL     : array [1..10] of char;  // �󺧻���
    MARK     : array [1..10] of char;  // ����
    LTYPE    : char;                   // ��Ÿ��
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // ������
    QTY      : integer;                // set ����
    LOTNO    : array [1..10] of char;  // LOTNO
    CASTNO   : array [1..10] of char;  // CASTNO
    PMNAME   : array [1..50] of char;  // ǰ���
end;


// ��� : ��ǥ�� ����(40520) (70350)
type
  TDAEPYO = packed record
    PMNAME   : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // set ����
    LTYPE    : char;                   // ��Ÿ��
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

// ��� : 1,2���Ǽ� ������ ����(40860)
type
  TKWONSUNREPT = packed record
    PLINE    : array [1..5] of char;   // ����
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�    
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
end;

// ��� : ���� ������ ����(40870)
type
  TJOLIPREPT = packed record
    PLINE    : array [1..5] of char;   // ����
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�    
    PALLET   : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
end;

// ��� : ĳ���� ������ ����(40880)
type
  TCASTREPT = packed record
    HONM     : array [1..20] of char;  // ��������
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    JOLINE   : array [1..5] of char;   // ��������
end;

// ��� : �������ó��(40510)
type
  TPOJANGJOB = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    PQTY     : integer;                // ���Լ���
    BOXNO    : array [1..10] of char;  // �ڽ����ڵ�
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    LOTNO    : array [1..10] of char;  // LOTNO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
    SETQTY   : integer;                // SET����
end;

// ��� : �������ó��(40510)
type
  TNEWPOJANGJOB = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    PQTY     : integer;                // ���Լ���
    BOXNO    : array [1..10] of char;  // �ڽ����ڵ�
    CASTNO1  : array [1..10] of char;  // ĳ���ù�ȣ
    QTY1     : integer;
    CASTNO2  : array [1..10] of char;  // ĳ���ù�ȣ
    QTY2     : integer;
    LOTNO    : array [1..10] of char;  // LOTNO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
    SETQTY   : integer;                // SET����
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

  // ��� : �˻縶ŷ����ó��(40200),v2�˻����ó��(40300)
type
  TGUMMALIST = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    BOXNO    : array [1..13] of char;  // BOX NO
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
end;

// ��� : ĳ���ý�����ȸ(50060),�˸�������ȸ(50080),V2�˻������ȸ(50090),�ܰ��˻������ȸ(50300)
// 50570
type
  TCASTINGLIST = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    IRUM     : array [1..20] of char;  // �۾���
end;

// ��� : �������� ����Ȳ(50120)
type
  TJOLIPINLIST = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    IRUM     : array [1..20] of char;  // �۾���
end;

// ��� : ĳ���ý�����ȸ(50060)
type
  TCASTINGLIST1 = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    PALLET   : array [1..6] of char;   // �ķ�Ʈ��ȣ
    JOLINE   : array [1..5] of char;   // ��������
    IRUM     : array [1..20] of char;  // �۾���
    INILJA   : array [1..10] of char;  // ����
    INSIGAN  : array [1..8] of char;   // �ð�
    LT       : integer;
    JBOXNO   : array [1..13] of char;  // BOX NO
end;

type
  TPOJANGLIST = packed record
    HONM     : array [1..20] of char;  // ����(����)
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..10] of char;  // BOX NO
    RQTY     : integer;                // ���Լ���
    QTY      : integer;                // ��������
    LOTNO    : array [1..10] of char;  // LOTNO
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    QTY1     : integer;                // ����
    CASTNO2  : array [1..10] of char;  // ĳ���ù�ȣ2
    QTY2     : integer;                // ����
    KEYNUM   : array [1..10] of char;  // ��ǥ���ڵ�
    IRUM     : array [1..20] of char;  // �۾���    
end;

type
  TSMPOJANGLIST = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ���Լ���
    QTY     : integer;                 // ��������
    LOTNO    : array [1..10] of char;  // LOTNO
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
end;

// ��� : ����������ȸ(50050)
type
  TJOLIPNLIST3 = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
end;

// ��� : ��ǰ�԰�ó��(70200)
type 
  TIPGOSCAN = packed record
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // �԰����
    CASTNO   : array [1..10] of char; // ĳ���ù�ȣ
    ILJA     : array [1..10] of char; // ����
    SIGAN    : array [1..8] of char;  // �ð�
  end;

// ��� : ��ǰ�԰�ó��(70200)
type 
  TIPGOSCANL = packed record
    BOXNO    : array [1..10] of char; // �ڽ����ڵ�
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // �԰����
    CASTNO   : array [1..10] of char; // ĳ���ù�ȣ
    ILJA     : array [1..10] of char; // ����
    SIGAN    : array [1..8] of char;  // �ð�
    SABUN    : array [1..10] of char; // �԰���
  end;
// ��� : ����������������ȿ��(50340,50350)
type
  TJOSULHYOLIST = packed record
    ILJA     : array [1..10] of char; // ����
    LINE     : array [1..5] of char;  // ����
    JUYA     : char;                  // �־�
    CAPA     : integer;               // CAPA
    RQTY     : integer;               // ��ǰ����
    BQTY     : integer;               // �ҷ�����
    JBTIME   : integer;               // �ο��ð�
    BIGADONG : integer;               // �񰡵��ð�
end;

// ��� : �Ⱓ�� ĳ����NO ǰ����Ȳ(33180)
type
  TCASTQCDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ��ǰ����
    SQTY     : integer;               // �˸����ɺҷ�����
    VQTY     : integer;               // V2���ɺҷ�����
    EQTY     : integer;               // �ܰ��ҷ�����(ĳ����~����)
    DQTY     : integer;               // ������ü����
    CARE     : char;
    GUMMA    : array [1..10] of char; // CASTNO
    V2GUM    : array [1..10] of char; // CASTNO
    CTNO     : array [1..10] of char; // CASTNO
    NTF      : integer;               // NTF����
    BIGO     : array [1..400] of char; // ���
    PBIGO    : array [1..400] of char;  // ���     
end;

// ��� : ��������(20100), (20101), (33150), (11050)
type 
  TProcCode = packed record
    ITEMGB  : array [1..2] of char;   // ��ǰ����(I/G, S/P)
    PCODE   : array [1..5] of char;   // �����ڵ�
    PNAME   : array [1..40] of char;  // ������
end;

// ��� : �������ҷ���Ȳ��ȸ(33110)
type
  TQLT_B_LIST = packed record
    PLINE    : array [1..5] of char;   // ����
    PCODE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰�
    PQCCODE  : array [1..8] of char;   // �ҷ��ڵ�
    PQCNAME  : array [1..50] of char;  // �ҷ���
    BQTY     : integer;                // �ҷ��ڵ�
    ILJA     : array [1..10] of char;  // �۾�����
    SIGAN    : array [1..8] of char;   // �۾��ð�
    FDATE    : array [1..10] of char;  // ��������
    JUYA     : char;                   // �־�
end;

// ��� : ���� ���� �ҷ������� ��Ȳ (33140)
type
  TPQCCODENQTY = packed record
    PQCCODE  : array [1..8] of char;    // �ҷ��ڵ�
    PQCNAME  : array [1..50] of char;   // �ҷ��ڵ��
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : ���� ���� ���ں� �ҷ�����Ȳ (33130)
type
  TRQTYNBQTY = packed record
    PLINE    : array [1..5] of char;   // ��������
    RQTY     : integer;                 // �������
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : �Ⱓ�� ĳ����NO ���ɺҷ���Ȳ (��ũ)(33320)
type
  TCASTQCCHART = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ��ǰ����
    BQTY     : integer;               // �ҷ�������
    NTF      : integer;               // �ҷ�������    
end;

// ��� : ������ �ҷ��� ��Ȳ (33330)
type
  TGONGLINEPPM = packed record
    PLINE    : array [1..5] of char;   // ��������
    RQTY     : integer;                 // �������
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : ���� ���κ� ȿ�� (50560)
type
  TGLHYORUL = packed record
    FDATE    : array [1..10] of char;   // ��������
    RQTY     : integer;                 // �������
    JBTIME   : integer;                 // �ο��ð�(�ѽð�)
    BTIME    : integer;                 // �񰡵��ð�(�����ð�)
    CTIME    : double;                  // C/T
    MAN      : double;                  // �ο�
    BQTY     : integer;                 // �������    
end;

// ��� : ���� ���κ� �����ð� (50580)
type
  TBIGATYPE = packed record
    FDATE    : array [1..10] of char;   // ��������
    JCODE    : array [1..50] of char;    // �񰡵��ڵ�
    BTIME    : integer;                 // �񰡵��ð�(�����ð�)
end;

// ��� : ���� ���κ� �ҷ�����Ȳ (33120)
type
  TPLINEPPM = packed record
    PCODE    : array [1..5] of char;    // ����
    PLINE    : array [1..5] of char;    // ����
    RQTY     : integer;                 // �������
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : ������ �ҷ�����Ȳ (33150)
type
  TPROCPPM = packed record
    PCODE    : array [1..5] of char;    // ����
    RQTY     : integer;                 // �������
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : �������ҷ���Ȳ��ȸ(33110)
type
  TQLT_B_LIST2 = packed record
    PLINE    : array [1..5] of char;   // ����
    PCODE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰�
    PQCCODE  : array [1..8] of char;   // �ҷ��ڵ�
    PQCNAME  : array [1..50] of char;  // �ҷ���
    BQTY     : integer;                // �ҷ��ڵ�
    FDATE    : array [1..10] of char;  // ��������
    JUYA     : char;                   // �־�
end;

// ��� : ĳ���� �󼼻�����Ȳ(50490) 
type
  TCAST_SANG_LIST1 = packed record 
    STD  : array [1..50] of char; // �԰ݸ� 
    ILJA : array [1..10] of char; // ���� 
    QTY  : integer;               // ���� 
  end; 
 
// ��� : ĳ���� �󼼻�����Ȳ(50490) 
type 
  TCAST_SANG_LIST2 = packed record 
    ILJA   : array [1..10] of char; // ���� 
    RQTY   : integer;               // ��ǰ���� 
    JBTIME : integer;               // �ο��ð� 
    GATIME : integer;               // �����ð� 
    BITIME : integer;               // �񰡵��ð�
    BQTY   : integer;               // �ҷ����� 
  end; 


// ��� : ���� ��ȹ��� ������Ȳ(50520)
type
  TPVSSIL = packed record
    ILJA : array [1..10] of char; // ����
    LINE : array [1..5] of char;  // ����
    PQTY : integer;               // ��ȹ����
    SQTY : integer;               // ��������
  end;

// ��� : ������ ���� ǰ����Ȳ(33230)
type
  TQCDAYDSP = packed record
    PCODE: array [1..5] of char;  // �����ڵ�
    LINE : array [1..5] of char;  // ����
    PQTY : integer;               // ��ȹ����
    SQTY : integer;               // ��������
    BQTY : integer;               // �ҷ�����
  end;

// ��� : ������ ���� ǰ����Ȳ(33230)
type
  TQCDAYDSP1 = packed record
    PCODE: array [1..5] of char;  // �����ڵ�
    PQTY : integer;               // ��ȹ����
    SQTY : integer;               // ��������
    BQTY : integer;               // �ҷ�����
  end;

// ��� : ���� ��ȹ��� ������Ȳ(50520)
type
  TPVSSIL1 = packed record
    ILJA : array [1..10] of char; // ����
    PQTY : integer;               // ��ȹ����
    SQTY : integer;               // ��������
  end;

// ��� : �����������(10500)
type
  TJAJAEJOJUNGLIST = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �ǻ����
end;

// ��� : ��ǰ �������(70260)
type
  TITEMJOJUNGLIST = packed record
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �ǻ����
end;

// ��� : ������������ó��(40050)
type
  TJOTOO = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ��ǰ����
    BOXNO    : array [1..13] of char;  // ��ũ���� BOX NO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
  end;

// ��� : ��ü�� �����԰���Ȳ(11150)
type
  TILJAJAJAELIST5 = packed record
    ILJA     : array [1..10] of char;  // ��������
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ�
    BPNAME   : array [1..40] of char;  // ��ü��
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
    QTY1     : integer;                // Ưä����
end;

// ��� : �Ⱓ�� �����԰� ������Ȳ(11220)
type
  TILJASUMJAJAE = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
end;

// ��� : �Ⱓ�� ������� ������Ȳ(11220)
type
  TILJASUMJAJAECH = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // ������
end;

// ��� : ǰ���ڵ庰 ��������� ��Ȳ(11240)
type
  TINOUTJAJAE = packed record
    IODT     : array [1..10] of char;  // ��������
    CUSTNM   : array [1..40] of char;  // ����(��ü,�μ�)��
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �������
    IOGBN    : char;                   // ���ⱸ��(I;�԰�, O;���)
end;

// ��� : ����ǻ�(11040)
type
  TJAJAEMST_CODE = packed record
    YURACODE : array [1..20] of char;  // �����ڵ�
    DANWI    : array [1..5] of char;   // ����
  end;

// ��� : ����ǻ�(10400)
type
  TITEMMST_CODE = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    DANWI    : array [1..5] of char;   // ����
  end;

// ��� : ���θ޴�
type
  TWORKMNLIST = packed record
    MYTR : array [1..5] of char;
    WKTR : array [1..200] of char;
end;

// ��� : �����Ʈ����(33240)
type 
  TJAJAELOTSCH = packed record
    PNAME    : array [1..40] of char;  // ������
    PLINE    : array [1..5] of char;   // ���θ�
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BPNAME   : array [1..40] of char; // ��ü��
    SPLSN    : array [1..20] of char;  // ��üLOT
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // ����
    JUYA     : char;
  end;

// ��� : �����Ʈ����(33350)
type 
  TJAJAELOTSCH2 = packed record
    PNAME    : array [1..40] of char;  // ������
    PLINE    : array [1..5] of char;   // ���θ�
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BPNAME   : array [1..40] of char; // ��ü��
    SPLSN    : array [1..20] of char;  // ��üLOT
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // ����
    JUYA     : char;
  end;

// ��� : �ο��ð����(00200)
type
  TBOOYOIN = packed record
    PCODE  : array [1..5] of char;   // �����ڵ�
    PNAME  : array [1..40] of char;  // ������
    PLINE  : array [1..5] of char;   // ���θ�
end;

// ��� : ���κ� �ο��ð��Է�(00200)
type
  TBOOYOINLIST2 = packed record
    SABUN : array [1..10] of char; // ���
    IRUM  : array [1..20] of char; // �̸�
    STIME : array [1..8] of char;  // ����
    ETIME : array [1..8] of char;  // ����
  end;

// ��� : ȣ�⺰����������Ȳ(50070)
type
  TJAJAETOIPLIST = packed record
    ILJA     : array [1..10] of char;
    YURASN   : array [1..10] of char;  // ������ڵ�
    YURACODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    SIGAN    : array [1..8] of char;   // �ð�
    BPNAME   : array [1..40] of char;     // ��ü��
    SPLSN    : array [1..20] of char;     // ��üLOT
  end;

// ��� : �������� �ǻ���Ȳ(10960)
type
  TGONGJAJAESIL = packed record
    YURASN   : array [1..20] of char;  // ������ڵ�
    YURACODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    SIGAN    : array [1..8] of char;   // �ð�
    IRUM     : array [1..20] of char;  // �̸�
    PCODE  : array [1..5] of char;     // �����ڵ�
  end;

// ��� : ��������ǰ �ǻ���Ȳ(10970)
type
  TGONGBANSIL = packed record
    YURASN   : array [1..20] of char;   // �ڽ����ڵ�
    YURACODE : array [1..20] of char;   // ǰ��
    PMNAME   : array [1..50] of char;   // ǰ��
    STD      : array [1..50] of char;   // �԰ݸ�
    QTY      : integer;                 // ���ϼ���
    SIGAN    : array [1..8] of char;   // �ð�
    IRUM     : array [1..20] of char;  // �̸�
    PCODE    : array [1..5] of char;     // �����ڵ�
  end;

// ��� : �����ڽ� �����̷�(10980)
type
  TJOBOXCHG = packed record
    FIXEDBOXNO1 : array [1..6] of char;   // �ڽ����ڵ�
    FIXEDBOXNO2 : array [1..6] of char;   // ǰ��
    BOXNO       : array [1..13] of char;  // ǰ��
    ILJA        : array [1..10] of char;  //
    SIGAN       : array [1..8] of char;   //
    YURACODE    : array [1..20] of char;   // ǰ��
    PMNAME      : array [1..50] of char;   // ǰ��
    STD         : array [1..50] of char;   // �԰ݸ�
    RQTY        : integer;
    IRUM        : array [1..20] of char;  // �̸�
    HOGI        : array [1..5] of char;
  end;

// ��� : ����ǰ�ǻ��������(10550) 
type 
  THWIPJOJUNGLIST = packed record 
    ITEMCODE : array [1..20] of char; 
    PMNAME   : array [1..50] of char; 
    STD      : array [1..50] of char; 
    DANWI    : array [1..5] of char; 
    PCODE    : array [1..5] of char; 
    QTY      : integer;
    SLCODE   : array [1..4] of char;     
  end; 

  // ��� : ĳ���� ���� ����ó��(40100)
type
  TPALLETINFO = packed record
    BOXSEQ   : array [1..13] of char;  // �ķ���ȣ
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ���ϼ���
    PLINE    : array [1..5] of char;   // ��������
  end;

// ��� : ĳ���� ���� ����ó��(40100)
type
  TCASTINGUNLIST = packed record
    PALLET1  : array [1..13] of char;  // ĳ�����ķ�
    PALLET   : array [1..6] of char;   // ĳ�����ķ�(���ڵ�)
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    CBOXNO   : array [1..13] of char;  // BOX NO
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
    ITEMCODE : array [1..20] of char;  // ǰ��
  end;

// ��� : 1���Ǽ�������ȸ(50020),2���Ǽ�������ȸ(50030),��ũ����������ȸ(50040), ����ũ��Ȳ(50620)
type
  TINSERTPINLIST2 = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    PREBOX   : array [1..13] of char;  // BOX NO
    IRUM     : array [1..20] of char;  // �۾���      
end;

// ��� : �������ý�����ȸ(50010)
type
  TROTATINGLST = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    IRUM     : array [1..20] of char;  // �۾���    
end;

// ��� : �������ý�����ȸ(50010),1���Ǽ�������ȸ(50020),2���Ǽ�������ȸ(50030),��ũ����������ȸ(50040),����������ȸ(50050),ĳ���ý�����ȸ(50060),�˸�������ȸ(50080),V2�˻������ȸ(50090),�ܰ��˻������ȸ(50300)
type
  TINSERTPINLIST3 = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
end;

// ��� : ����������ȸ(50050)
type
  TJOLIPINLIST2 = packed record
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
    ENDCHK   : char;                   // ���Կ���
    IRUM     : array [1..20] of char;  // �۾���
end;

// ��� : ĳ���� ������ ��Ȳ(50610)
type
  TINGCASTING = packed record
    PLINE    : array [1..5] of char;  // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
end;

// ��� : ĳ���� ������ ��Ȳ(50610)
type
  TINGSCASTING = packed record
    PLINE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ����
end;

// ��� : ����ǰ ������� ��Ȳ(50600) 
type 
  TDSPSAMPLECHOOL = packed record 
    TNAME    : array [1..40] of char;  // ���ó 
    ITEMCODE : array [1..20] of char;  // ǰ�� 
    PMNAME   : array [1..50] of char;  // ǰ�� 
    STD      : array [1..50] of char;  // �԰ݸ� 
    BOXNO    : array [1..13] of char;  // �ڽ���ȣ 
    RQTY     : integer;                // ���� 
    SNAEYONG : array [1..50] of char;  // ���� 
    ILJA     : array [1..10] of char;  // ���� 
    SIGAN    : array [1..8] of char;   // �ð� 
    HOGI     : array [1..5] of char;   // ȣ�� 
    IRUM     : array [1..20] of char;  // ����� 
end; 

// ��� : ����ǰ ������� ��Ȳ(50600)
type
  TSUMSAMPLECHOOL = packed record
    TNAME    : array [1..40] of char;  // ���ó
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ����

end;

// ��� : �������������Ȳ(10870)
type
  TGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �԰��
    QTY3     : double;                 // ���
    QTY4     : double;                 // ����

//    QTY1     : int64;                 // �̿����
//    QTY2     : int64;                 // �԰��
//    QTY3     : int64;                 // ���
//    QTY4     : int64;                 // ����
  end;

// ��� : �������������Ȳ(10820)
type
  TNEGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �԰��
    QTY3     : double;                 // ���
    QTY4     : double;                 // ����
    QTY5     : double;                 // ��ǰ
    QTY6     : double;                 // ��� 2013.08.07
    QTY7     : double;                 // �ν� 2014.01.22
  end;

// ��� : �������������Ȳ_�ܰ�(10870)
type
  TGONGJUNGJGDANGA = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �԰��
    QTY3     : double;                 // ���
    QTY4     : double;                 // ����
  end;

// ��� : �������������Ȳ_�ܰ�(10870)
type
  TNGONGJUNGJGDANGA = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �԰��
    QTY3     : double;                 // ���
    QTY4     : double;                 // ����
    QTY5     : double;                 // ��ǰ
    QTY6     : double;                 // ���
    QTY7     : double;                 // LOSS    
  end;

// ��� : ���κ� �ο��ð���ȸ(50000)
type
  TBOOYOINLIST = packed record
    PLINE  : array [1..5] of char;   // ����
    HONM   : array [1..20] of char;  // ����
    SILJA  : array [1..10] of char;  // ��������
    SSIGAN : array [1..8] of char;   // ���۽ð�
    EILJA  : array [1..10] of char;  // ��������
    ESIGAN : array [1..8] of char;   // ����ð�
    IRUM   : array [1..20] of char;  // �̸�
    IDNO   : integer;                // IDNO
  end;
  
// ��� : ���_���ã��(00301) 
type 
  TSUSERSEARCH= packed record 
    SABUN : array [1..8] of char; // ��� 
    IRUM  : array [1..20] of char; // �̸�
  end; 

// ��� : ĳ����NO�� ó����Ȳ(50590)
type
  THCASTPROCESS = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ĳ���þ�ǰ����
    IQTY     : integer;               // �˸����Ծ�ǰ����
    IBQTY    : integer;               // �˸����Ժҷ�����
    ISUMQTY  : integer;               // �˸����Լ���
    OQTY     : integer;               // �˸�������ǰ����
    OBQTY    : integer;               // �˸������ҷ�����
    OSQTY    : integer;               // �˸��������ü���
    OSUMQTY  : integer;               // �˸���������
    VQTY     : integer;               // V2������ǰ����
    VBQTY    : integer;               // V2�����ҷ�����
    VSQTY     : integer;              // V2�������ü���
    VSUMQTY  : integer;               // V2��������
end;

// ��� : ĳ���� ���� �ҷ�����(50590)
type
  THCastLine = packed record
    PLINE  : array [1..5] of char;   // ���θ�
end;

// ��� : �˻縶ŷ �ܷ������Ȳ (10990)
type
  TGUMMAJAN = packed record
    PLINE : array [1..5] of char;    // ����
    ILJA  : array [1..10] of char;   // ����
    SIGAN : array [1..8] of char;    // �ð�
    JQTY  : integer;                 // �������
    IRUM  : array [1..20] of char;   // �̸�
end;

// ��� : ������ ��ǥPPM ����(30110)
type
  TDSPAIMPPM = packed record
    YM     : array [1..7] of char;  // ���
    PCODE  : array [1..5] of char;  // ����
    APPM   : integer;               // ��ǥPPM
end;

// ��� : �������κ� PPM��Ȳ (33250)
type
  TAIMRBQTY = packed record
    PLINE    : array [1..5] of char;    // ����
    RQTY     : integer;                 // �������
    BQTY     : integer;                 // �ҷ�����
    APPM     : integer;                 // PPM
end;

// ��� : ĳ����NO(LOTNO) ��ȸ(33260)
type 
  TDSPCASTLOTNO = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    CASTNO   : array [1..10] of char;  // CASTNO
    LOTNO    : array [1..15] of char;  // LOTNO
  end;

// ��� : ��ǰ LOT����(70690)
type
  TPRODLOTSCH = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    LOTNO    : array [1..10] of char;  // LOTNO
    IPQTY    : integer;                // ����
  end;

// ��� : ��ǰ LOT����(70690)
type
  TPRODLOTSCHDET = packed record
    BOXNO     : array [1..10] of char;  // ǰ���ڵ�
    IPDATE    : array [1..10] of char;  // ǰ��
    IPQTY     : integer;                // ����
    CHDATE    : array [1..10] of char;  // �԰ݸ�
    CHGNUMBER : array [1..12] of char;  // LOTNO
    CTNAME    : array [1..40] of char;  // ����
    CHQTY     : integer;                // ����
  end;

// ��� : ����� �и�(10130)
type
  TSPTJAJAEREPRT = packed record
    PMNAME    : array [1..50] of char;  // ǰ���
    STD       : array [1..50] of char;  // �԰�
    ILJA      : array [1..10] of char;  // �԰�����
    SPLSN     : array [1..20] of char;  // ��üS/N(��üLOT)
    QTY       : integer;                // �԰����
    YURASN    : array [1..10] of char;  // S/N
    SIGAN     : array [1..8] of char;   // �ð�
    ITEMCODE  : array [1..20] of char;  // ǰ��
    DANWI     : array [1..5] of char;  // ����
  end;
    
// ��� : ����� �и�(10130)
type
  TSPTPRINT = packed record
    YURASN    : array [1..10] of char;  // S/N
    QTY       : integer;                // �԰����
  end;

// ��� : ����ǰ�����Ȳ(10880)
type
  THGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : int64;                 // �̿����
    QTY2     : int64;                 // �����԰�
    QTY3     : int64;                 // ����ũ�԰�
    QTY4     : int64;                 // �������
    QTY5     : int64;                 // �ҷ����
    QTY6     : int64;                 // �������
    QTY7     : int64;                 // ����(�÷�)���
    QTY8     : int64;                 // ����
end;

// ��� : ����ǰ�����Ȳ(10820), (10830)
type
  TNGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : int64;                 // �̿����
    QTY2     : int64;                 // �����԰�
    QTY3     : int64;                 // ����ũ�԰�
    QTY4     : int64;                 // �������
    QTY5     : int64;                 // �ҷ����
    QTY6     : int64;                 // �������
    QTY7     : int64;                 // ����(�÷�)���
    QTY8     : int64;                 // ����
    QTY9     : int64;                 // ���
    QTY10    : int64;                 // V2�ҷ�
    QTY11    : int64;                 // ���   2013.08.07 �߰�
    QTY12    : int64;                 // �ν�   2014.01.22 �߰�
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

// ��� : ����ǰ�����Ȳ(11290)
type
  TSUMGONGJUNGJG = packed record
    PNAME    : array [1..40] of char; // ��������
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �����԰�
    QTY3     : double;                 // ����ũ�԰�
    QTY4     : double;                 // �������
    QTY5     : double;                 // �ҷ����
    QTY6     : double;                 // �������
    QTY7     : double;                 // ����(�÷�)���
    QTY8     : double;                 // ���
    QTY9     : double;                 // ��ǰ
    QTY10    : double;                 // �ý������
    QTY11    : double;                 // �ǻ����
    QTY12    : double;                 // ����(����)
    QTY13    : double;                 // ���
    QTY14    : double;                 // LOSS
end;

// ��� : ����ǰ�����Ȳ(11310)
type
  TSMYGONGJUNGJG = packed record
    PNAME    : array [1..40] of char; // ��������
    YURACODE : array [1..3] of char;  // �����ڵ�
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �����԰�
    QTY3     : double;                 // ����ũ�԰�
    QTY4     : double;                 // �������
    QTY5     : double;                 // �ҷ����
    QTY6     : double;                 // �������
    QTY7     : double;                 // ����(�÷�)���
    QTY8     : double;                 // ���
    QTY9     : double;                 // ��ǰ
    QTY10    : double;                // �ý������
    QTY11    : double;                // �ǻ����
    QTY12    : double;                // ����(����)
    QTY13    : double;                // ���
    QTY14    : double;                // LOSS

end;

// ��� : ����ǰ�����Ȳ(10880)
type
  THGONGJUNGDANGA = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �����԰�
    QTY3     : double;                 // ����ũ�԰�
    QTY4     : double;                 // �������
    QTY5     : double;                 // �ҷ����
    QTY6     : double;                 // �������
    QTY7     : double;                 // ����(�÷�)���
    QTY8     : double;                 // ����
end;

// ��� : ����ǰ�����Ȳ(10830)
type
  TNDGONGJUNGDANGA = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    PCODE    : array [1..5] of char;  // �����ڵ�
    PNAME    : array [1..40] of char; // ��������
    QTY1     : double;                 // �̿����
    QTY2     : double;                 // �����԰�
    QTY3     : double;                 // ����ũ�԰�
    QTY4     : double;                 // �������
    QTY5     : double;                 // �ҷ����
    QTY6     : double;                 // �������
    QTY7     : double;                 // ����(�÷�)���
    QTY8     : double;                 // ����
    QTY9     : double;                 // ����
    QTY10     : double;                // ���
    QTY11     : double;                // LOSS
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

// ��� : ������Һ�(11250)
type
  TJAJAERDLIST = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY1     : integer;                 // �̿����
    QTY2     : integer;                 // �����԰�
    QTY10     : integer;                // ������ü�԰�
    QTY11     : integer;                // ������ǰ�԰�
    QTY3     : integer;                 // �������
    QTY4     : integer;                 // �Ǹ����
    QTY5     : integer;                 // �������
    QTY6     : integer;                 // �������
    QTY7     : integer;                 // ��ȯ���
    QTY8     : integer;                 // ��ǰ���
    QTY9     : integer;                 // �������
end;

// ��� : ��ǰ���Һ�(70670)
type
  TPRODRDLIST = packed record
    YURACODE : array [1..20] of char; // ǰ���ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY1     : integer;                 // �̿����
    QTY2     : integer;                 // �����԰�
    QTY3     : integer;                 // ��ȯ�԰�
    QTY4     : integer;                 // ��ü�԰�
    QTY5     : integer;                 // ��ǰ�԰�
    QTY6     : integer;                 // �Ǹ����
    QTY7     : integer;                 // ��ȯ���
    QTY8     : integer;                 // �������
    QTY9     : integer;                 // �������
    QTY10    : integer;                 // 1��ġ �Ǹ�������
    QTY11    : integer;                 // ����

end;

// ��� : ��ǰ���Һ�(70670)
type
  TPRODCHSUM = packed record
    QTY1    : integer;                 // 1��ġ �Ǹ�������
    QTY2    : integer;                 // ����
end;

// ��� : �Ⱓ�� ĳ����NO ���ɺҷ���Ȳ(33270)
type
  TCASTQCSDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ��ǰ����
    BQTY     : integer;               // �ҷ�������
    QTY1     : integer;               //
    QTY2     : integer;               //
    QTY3     : integer;               //
    QTY4     : integer;               //
    QTY5     : integer;               //
    QTY6     : integer;               //
    QTY7     : integer;               //
    QTY8     : integer;               //
    VQTY     : integer;               //
    JOLINE   : array [1..7] of char;  // ��������
    GUMLINE  : array [1..8] of char;  // �˻����
    NTF      : integer;               //
    BIGO     : array [1..400] of char;  // ���
    PBIGO    : array [1..400] of char;  // ���    
end;

// ��� : �Ǽ���������ó��(40020) ��..
type
  TVIEWPIN = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
  end;

// ��� : ������������ó��(40040)
type
  TARCWELDING = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // ��ǰ����
    BOXNO    : array [1..13] of char;  // ��ũ���� BOX NO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
  end;

// ��� : �����԰� ������ ���(11010)
type
  TJAJAEIIPDESC = packed record
    IPDATE   : array [1..10] of char;  // �԰�����
    SPLCODE  : array [1..10] of char;  // ��ü�ڵ�
    YURACODE : array [1..20] of char;  // �����ڵ�
    SPLSN    : array [1..20] of char;  // ��üS/N(��üLOT)
    WHLOC    : array [1..10] of char;  //  LOCATION
    QTY      : integer;                // �԰����
    REMARK   : array [1..100] of char; // REMARK
end;

// ��� : ��ǰ�԰� �󼼳��� ���(70820)
type
  TPRODIIPDESC = packed record
    IPDATE   : array [1..10] of char; // �԰�����
    ITEMCODE : array [1..20] of char;  // ��ü�ڵ�
    LOTNO    : array [1..10] of char; // �����ڵ�
    CASTNO   : array [1..10] of char;  // ��üS/N(��üLOT)
    WHLOC    : array [1..10] of char;  //  LOCATION
    QTY      : integer;               // �԰����
    REMARK   : array [1..100] of char; // REMARK
end;

// ��� : �������� ��ǰ��Ȳ(50650)
type
  TJAJAECHGHIS = packed record
    ILJA     : array [1..10] of char;
    YURASN   : array [1..10] of char;  // ������ڵ�
    YURACODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    QTY      : integer;                // �������
    SIGAN    : array [1..8] of char;   // �ð�
    IRUM     : array [1..20] of char;  // �̸�
  end;

// ��� : ��ǰ �԰�ó��(70310)
type
  TJPBANIP = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    PQTY     : integer;                // ���Լ���
    BOXNO    : array [1..10] of char;  // �ڽ����ڵ�
    LOTNO    : array [1..10] of char;  // LOTNO    
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
    SETQTY   : double;                 // SET����
    SLCODE   : array [1..4] of char;   // ������ġ
    SLNAME   : array [1..50] of char;  // ������ġ��
end;

// ��� : ���ں� ��ǰ�԰���Ȳ(70640)
type
  TPRODBANIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5]  of char;  // ����
    QTY      : integer;                // �԰����
    IPDATE   : array [1..10] of char;  // �԰�����
    IPSIGAN  : array [1..8]  of char;  // �԰�ð�
    IRUM     : array [1..20] of char;  // �̸�
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO
end;

// ��� : �Ⱓ�� ǰ����ȯ �԰���Ȳ(70650)
type
  TPRODCHGIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5]  of char;  // ����
    QTY      : integer;                // �԰����
    IPDATE   : array [1..10] of char;  // �԰�����
    IPSIGAN  : array [1..8]  of char;  // �԰�ð�
    IRUM     : array [1..20] of char;  // �̸�
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO
end;

// ��� : �Ⱓ�� ������ü �԰���Ȳ(70660)
type
  TPRODDAEIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // ǰ��CODE
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5]  of char;  // ����
    QTY      : integer;                // �԰����
    IPDATE   : array [1..10] of char;  // �԰�����
    IPSIGAN  : array [1..8]  of char;  // �԰�ð�
    IRUM     : array [1..20] of char;  // �̸�
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO
end;

// ��� : ��ǰǰ����ȯó��(70330)
type
  TCHGCHLGOSCAN = packed record
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // �԰����
    CASTNO   : array [1..10] of char; // ĳ���ù�ȣ
    ILJA     : array [1..10] of char; // ����
    SIGAN    : array [1..8] of char;  // �ð�
  end;

// ��� : ��ǰǰ����ȯó��(70330)
type
  TCHGCHLGOSCANL = packed record
    BOXNO    : array [1..10] of char; // �ڽ����ڵ�
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // �԰����
    CASTNO   : array [1..10] of char; // ĳ���ù�ȣ
    ILJA     : array [1..10] of char; // ����
    SIGAN    : array [1..8] of char;  // �ð�
    SABUN    : array [1..10] of char; // �԰���
  end;

// ��� : ����� �����(10120)
type
  TJAJAEREPRT = packed record
    PMNAME    : array [1..50] of char;  // ǰ���
    STD       : array [1..50] of char;  // �԰�
    ILJA      : array [1..10] of char;  // �԰�����
    SPLSN     : array [1..20] of char;  // ��üS/N(��üLOT)
    QTY       : integer;                // �԰����
    YURASN    : array [1..10] of char;  // S/N
    KEYNUMBER : array [1..10] of char;  // ��ǥ���ڵ�
    SIGAN     : array [1..8] of char;   // �ð�
    DANWI     : array [1..5] of char;   // ����
  end;

  // ��� : �Ⱓ�� ��ǰ��� ��Ȳ(70680)
type
  TILPRODCHLGO = packed record
    ILJA     : array [1..10] of char;  // ��������
    CTCODE   : array [1..5] of char;   // ��ü�ڵ�
    CTNAME   : array [1..40] of char;  // ��ü��
    ITEMCODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
end;

  // ��� : �Ⱓ�� ��ǰ��� ��Ȳ(ǰ��)(70900)
type
  TPRODCHLGOPUM = packed record
    ITEMCODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
end;

  // ��� : �Ⱓ�� ��ǰ��� ��Ȳ(ǰ��)(70900)
type
  TILPRODCHLGOPUM = packed record
    ILJA     : array [1..10] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // �����ڵ�
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    QTY      : integer;                // �԰����
end;

// ��� : �Ǽ���������ó��(40020)
type
  TKWONSUN = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    BOXNO    : array [1..13] of char;  // BOX NO
    PINBOX   : array [1..13] of char;  // �������� BOX NO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
  end;

// ��� : ĳ���� �ҷ������� ��Ȳ (33310)
type
  TCASTBADQTY = packed record
    RQTY     : integer;                 // �������
    PQCCODE  : array [1..8] of char;    // �ҷ��ڵ�
    PQCNAME  : array [1..50] of char;   // �ҷ��ڵ��
    BQTY     : integer;                 // �ҷ�����
end;

// ��� : ������ ������� ó��(10860)
type
  TSOYOLIST = packed record
    PLINE    : array [1..5] of char;  // ����
    PNAME    : array [1..40] of char; // ����
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ���
    STD      : array [1..50] of char; // �԰ݸ�
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME2  : array [1..50] of char; // ����ǰ���
    STD2     : array [1..50] of char; // ����԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY      : integer;               // �������
    SOYO     : double;                // �ҿ䷮
    SOJIN    : double;                // ������
  end;

// ��� : �������ϵ��(10100)
type
  TDANWIList = Packed Record
    YURACODE : array [1..20] of char; // �����ڵ�
    DANWI    : array [1..5] of char;  // ����
  end;

// ��� : ��ü�� Ưä���� ����(30310)
type 
  TJAJAETUKINFO = packed record
    SPLCODE  : array [1..8] of char;   // ��ü�ڵ� 
    BPNAME   : array [1..40] of char;  // ��ü�� 
    YURACODE : array [1..20] of char;  // �����ڵ� 
    PMNAME   : array [1..50] of char;  // ǰ��� 
    STD      : array [1..50] of char;  // �԰� 
    DANWI    : array [1..5] of char;   // ���� 
    ILJA     : array [1..10] of char;  // Ưä��������
    QTY      : integer;                // Ưä����
    DCHK     : char;
end;

// ��� : 1������ XBAR-R������ (33410)
type
  TILXBAR = packed record
    XCNT   : array [1..10] of char;   // ��������
//    XCNT   : integer;   // ��������
    X1     : integer;                 // �������
    X2     : integer;                 // �ҷ�����
    X3     : integer;                 // �������
    X4     : integer;                 // �ҷ�����
    X5     : integer;                 // �������
end;

// ��� : 1������ XBAR-R������ (33430)
type
  TILXBARDBL = packed record
    XCNT   : array [1..10] of char;   // ��������
    X1     : double;                 // �������
    X2     : double;                 // �ҷ�����
    X3     : double;                 // �������
    X4     : double;                 // �ҷ�����
    X5     : double;                 // �������
end;

// ��� : 1������ XBAR-R������ (33410)
type
  TSPECULVAL = packed record
    USLX   : double;                 // USLX
    LSLX   : double;                 // LSLX
    UCLX   : double;                 // UCLX
    LCLX   : double;                 // LCLX
    UCLR   : double;                 // UCLR
end;

// ��� : ���ְ˻� �׸����(00510)
type
  THJAJOOCODE = packed record
    PCODE    : array [1..5] of char;   // �����ڵ�
    PNAME    : array [1..40] of char;  // ������
    PLINE    : array [1..5] of char;   // ��������
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    HANGMOK  : array [1..60] of char;  // �׸�
    MAXDATA  : double;                 // ��������
    MINDATA  : double;                 // ��������
    SIRYO    : integer;                // �÷��
    JTOOIP   : char;                   // �����Կ���
    BIGO     : array [1..50] of char;  // ���
end;

// ��� : ���ְ˻� �����ڵ�(00510) 
type 
  THJAJOOPCodeList = packed record 
    PCODE  : array [1..5] of char;  // �����ڵ�  
    PNAME  : array [1..40] of char; // ������  
end;

// ��� : ���������Ѱ� ����(30120)
type
  TJAJOOHANGMOK = packed record
    HANGMOK  : array [1..60] of char; // ������
end;

// ��� : �񰡵��Ű�(00410)
type  
  TLINEINFO2 = packed record
    PLINE  : array [1..5] of char;   // ���θ�
    PCODE  : array [1..5] of char;   // �����ڵ�
    HONM   : array [1..20] of char;  // ����
end;

// ��� : �񰡵��Ű�(00410)
type
  TMAGROUPLIST = packed record
    HOGI  : array [1..5] of char;
    MHOGI : array [1..200] of char;
end;

// ��� : �񰡵� �ڵ����(00420), �񰡵��Ű�(00410)
type
  THNOOPCODE = packed record
    LCODE   : array [1..2] of char;   // �ڵ�����(01.���������ڵ�, 02.��������ڵ�, 03.���峻���ڵ�)
    CODE    : array [1..5] of char;   // �ڵ�
    NAEYONG : array [1..50] of char;  // ����
end;

// ��� : �񰡵��Ű�(00410)
type
  TBIGADONGLIST = packed record
    IDNO      : integer;               // IDNO
    JOONGDAND : array [1..10] of char; // �ߴ�����
    JOONGDANT : array [1..8] of char;  // �ߴܽð�
    GBN       : char;                  // �񰡵�����
    JCODE     : array [1..5] of char;  // ���γ����ڵ�
    PLINE     : array [1..5] of char;  // ����
    HONM      : array [1..20] of char; // ���μ���
  end;
  
// ��� : ���������Ѱ� ����(30120)
type
  TULCLVAL = packed record
    YM       : array [1..7] of char;   // �����ڵ�
    PCODE    : array [1..5] of char;   // �����ڵ�
    PNAME    : array [1..40] of char;  // ������
    PLINE    : array [1..5] of char;   // ��������
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    HANGMOK  : array [1..60] of char;  // �׸�
    USLX     : double;                 // ��������
    LSLX     : double;                 // ��������
    UCLX     : double;                 // ��������
    LCLX     : double;                 // ��������
    UCLR     : double;                 // ��������
end;

// ��� : ���������Ѱ� ����(30120)
type
  TNOINSPEC = packed record
    YURACODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    REMARK   : array [1..200] of char;  // �԰ݸ�
end;

// ��� : �񰡵���Ȳ(50330)
type
  TBIGADONGLIST2 = packed record
    PNAME     : array [1..40] of char; // ����
    HOGI      : array [1..5] of char;  // ȣ��
    IRUM      : array [1..20] of char; // �Ű���
    JOONGDAND : array [1..10] of char; // �ߴ�����
    JOONGDANT : array [1..8] of char;  // �ߴܽð�
    NAEYONG   : array [1..50] of char; // ���γ���
    IRUM2     : array [1..20] of char; // ó����
    GADONGD   : array [1..10] of char; // ��������
    GADONGT   : array [1..8] of char;  // �����ð�
    NAEYONG2  : array [1..50] of char; // ��������
    CR_NAE    : array [1..80] of char; // ó������
    BIGADONG  : integer;               // �񰡵��ð�
    JUYA      : char;                  // �־�
  end;

  // ��� : ������ĳ�ʷα���ȸ(59000)
type
  TSCANLOGLIST = packed record
    HOGI  : array [1..5] of char;   // ȣ��
    HONM  : array [1..20] of char;  // ���μ���
    GBN   : array [1..20] of char;  // ������ڵ�
    MYLOG : array [1..100] of char; // ǰ��
    ILJA  : array [1..10] of char;  // ����    
    SIGAN : array [1..8] of char;   // �ð�
  end;

  // ��� : [20310] Bom������
type
  TBOMEXPAND = packed record
    NLEV     : integer;                // â���
    CD_CHILD : array [1..20] of char;  // ǰ��
    PNAME    : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    NO_LEVEL : array [1..255] of char;
    SILQTY   : double;                 // �Ǽҿ䷮
end;

// ��� : ��� �������(10881)
type
  TJAEGONGCHG = packed record
    YURACODE : array [1..20] of char; // �����ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    DANWI    : array [1..5] of char;  // ����
    QTY1      : double;                // �̿����
    QTY2      : double;
    QTY3      : double;
    DSUM      : double;
  end;

// ��� : ����ǰ ���� ���ó��(40820)
type
  TVIEWBOXLIST = packed record
    PLINE    : array [1..5] of char;   // ����
    PCODE    : array [1..5] of char;   // ����
    HONM     : array [1..20] of char;  // ��������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // �ڽ��� ��� ��¥
end;

// ��� : ���ְ˻� �� �÷����(40830)
type
  TJAJOOCODELIST = packed record
    HANGMOK : array [1..60] of char;  // �׸�
    JTOOIP  : char;                   // ������ ���� (0: ���, 1: ������)
    MAXDATA : double;                 // MAX
    MINDATA : double;                 // MIN
    SIRYO   : integer;                // �÷��
    BIGO    : array [1..50] of char;  // ���
end;

// ��� : ���ְ˻�׽÷����(40830)
type
  TITEMLIST = packed record
    ITEMCODE : array [1..20] of char; // ǰ��
    PMNAME   : array [1..50] of char; // ǰ���
    STD      : array [1..50] of char; // �԰ݸ�
end;

// ��� : ����ǰ�÷������Ȳ(50660)
type
  TJAJOOCHLGO = packed record
    HONM     : array [1..40] of char;  // ����
    PLINE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ����
    GSIGN    : array [1..5] of char;   // �˻���ؽð�
    FDATE    : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    JUYA     : char;                   // �־�
    IRUM     : array [1..20] of char;
end;

// ��� : ����ǰ�÷������Ȳ(50660)
type
  TJAJOOCHLGOSUM = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ����
    FDATE    : array [1..10] of char;  // ����
    JUYA     : char;                   // �־�
end;

// ��� : ĳ����NO�� NTF���(33450)
type
  TCASTNTF = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    PV_QTY  : integer;                // ����
    UT_QTY  : integer;                // ����
    HV_QTY  : integer;                // ����
    MC_QTY  : integer;                // ����
    IB_QTY  : integer;                // ����
    R1_QTY  : integer;                // ����
    R2_QTY  : integer;                // ����
    ETC_QTY : integer;                // ����
    REMARK  : array [1..100] of char;  // ��Ÿ
  end;

  // ��� : v2�˻����ó��(40300)
type
  TGUMMALIST2 = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    BOXNO    : array [1..13] of char;  // BOX NO
    SEQ      : integer;                // �˻�Ƚ��
    CASTNO   : array [1..10] of char;  // ĳ���ù�ȣ
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
  end;

// ��� : ���������ǰ(11350)
type
  TRTNJAJAEPRT = packed record
    NEWYRSN   : array [1..10] of char;  // �ű�S/N
    YURACODE  : array [1..20] of char;  // ǰ��
    PMNAME    : array [1..50] of char;  // ǰ���
    STD       : array [1..50] of char;  // �԰�
    SPLSN     : array [1..20] of char;  // ��üS/N(��üLOT)
    QTY       : integer;                // �԰����
    DANWI     : array [1..5] of char;   // ����
    YURASN    : array [1..10] of char;  // ����S/N
    FRSLCODE  : array [1..10] of char;  // From ������ġ
    TOSLCODE  : array [1..4] of char;   // TO ������ġ
  end;

// ��� : ����ǰ ��� ���ó��(40890)
type
  TVIEWDISUSE = packed record
    PCODE    : array [1..5] of char;   // ����
    PNAME    : array [1..40] of char;  // ��������
    PLINE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    ILJA     : array [1..10] of char;  // �ڽ��� ��� ��¥
end;

// ��� : ������ ���ǰ ���(40550)
type
  TRECYCLEM = packed record
    REGNO    : array [1..12] of char;  //
    CYCDT    : array [1..10] of char;  //
    PCODE    : array [1..5] of char;   //
    PLINE    : array [1..5] of char;   //
    ITEMCODE : array [1..20] of char;  //
    PMNAME   : array [1..50] of char;  //
    STD      : array [1..50] of char;  //
    REMARK   : array [1..100] of char; //
    REGDT    : array [1..10] of char;  //
    IRUM     : array [1..20] of char;  //
    GBN      : char;                   //
    QTY      : integer;                //
end;

// ��� : �ҿ�ǰ��(40561)
type
  TSOYOPT = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    GBN      : char;
end;

// ��� : �ҿ�ǰ��(40562)
type
  TMS_SOYOPT = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    GBN      : char;
    REQTY    : double;
end;

// ��� : ������ ���ǰ ��� ��(40560)
type
  TRECYCLES = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    GBN      : char;
    JQTY     : double;
    RQTY     : double;    
end;

type
  TRECYCLELST = packed record
    PNAME  : array [1..40] of char;    // ������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    REGNO    : array [1..12] of char;  //
    RQTY     : double;                // ��ǰ����
    FDATE    : array [1..10] of char;  // ����
end;

type
  TRECYCLELST2 = packed record
    PNAME  : array [1..40] of char;    // ������
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : double;                // ��ǰ����
    FDATE    : array [1..10] of char;  // ����
end;

// ��� : ����ǰ ������� ��Ȳ(11360)
type 
  TME_JAJAESPL = packed record
    ILJA     : array [1..10] of char;  // ����
    TNAME    : array [1..40] of char;  // ���ó
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SQTY     : integer;                // ��û����
    CQTY     : integer;                // ������
    REMARK   : array [1..50] of char;  // ����
    IRUM     : array [1..20] of char;  // �����
end;

// ��� : ��ǰ ������� ��Ȳ(70910)
type
  TME_PRODSPL = packed record
    ILJA     : array [1..10] of char;  // ����
    TNAME    : array [1..40] of char;  // ���ó
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    DANWI    : array [1..5] of char;   // ����
    SQTY     : integer;                // ��û����
    CQTY     : integer;                // ������
    REMARK   : array [1..50] of char;  // ����
    IRUM     : array [1..20] of char;  // �����
end;

// ��� : ���ְ˻� �׸����(33380)
type
  TMSPRODTRACE = packed record
    PNAME    : array [1..40] of char;  // ������
    PLINE    : array [1..5] of char;   // ��������
    ITEMCODE : array [1..20] of char;  // ǰ���ڵ�
    PMNAME   : array [1..50] of char;  // ǰ���
    STD      : array [1..50] of char;  // �԰ݸ�
    BOXNO    : array [1..13] of char;  // �ڽ���ȣ
    RQTY     : integer;                // ����
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    IRUM     : array [1..20] of char;  // ó����
    JUYA     : char;                   // �־�
end;

// ��� : ���� �����(40530)
type
  TREPOJANG = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // �԰ݸ�
    STD      : array [1..50] of char;  // �԰ݸ�
    ITEMNM   : array [1..30] of char;  // ��ǰ��
    ZONE     : array [1..15] of char;  // ����
    CAR      : array [1..15] of char;  // ����
    JANGSO   : array [1..14] of char;  // ��ǰ���
    DANWI    : array [1..5] of char;   // ����
    PQTY     : integer;                // ���Լ���
    LCOL     : array [1..10] of char;  // �󺧻���
    MARK     : array [1..10] of char;  // ����
    LTYPE    : char;                   // ��Ÿ��
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // ������
    QTY      : double;                 // set ����
    BOXNO    : array [1..10] of char;  // BOXNO
    LOTNO    : array [1..10] of char;  // BOXNO
end;

// ��� : ����Loss �ڵ����(00430), 40570 ���
type
  TLossCode = packed record
    LCODE  : array [1..5] of char;  // ��ü�ڵ�
    LNAME  : array [1..30] of char; // ��ü��
end;

// ��� : ���κ� �ο��ð�����(00210)
type
  TBOOYOINLIST3 = packed record
    ILJA   : array [1..10] of char;  // ����
    PLINE  : array [1..5] of char;   // ����
    PCODE  : array [1..5] of char;   // ����
    HOGI   : array [1..5] of char;   // ȣ��
    HONM   : array [1..20] of char;  // ��������
    JBTIME : integer;                // �ο��ð�
    JUYA   : char;                   // �־�
  end;

type
  TWORKLIST = packed record
    ILJA     : array [1..10] of char; // ����
    LINE     : array [1..5] of char;  // ����
    JUYA     : char;                  // �־�
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ��ǰ����
    BQTY     : integer;               // �ҷ�����
    JBTIME   : integer;               // �ο��ð�
    BIGADONG : integer;               // �񰡵��ð�
    CAPA     : integer;               // CAPA
    MEMO     : array [1..1000] of char; // �԰ݸ�
    WORKER    : array [1..100] of char; // �۾���
  end;

// ��� : ���� ����Loss ���(40570)
type
  TLossM = packed record
    REGNO    : array [1..12] of char;  //
    LOSSDT   : array [1..10] of char;  //
    PCODE    : array [1..5] of char;   //
    PLINE    : array [1..5] of char;   //
    ITEMCODE : array [1..20] of char;  //
    PMNAME   : array [1..50] of char;  //
    STD      : array [1..50] of char;  //
    REMARK   : array [1..100] of char;  //
    REGDT    : array [1..10] of char;  //
    IRUM     : array [1..20] of char;  //
    LCODE    : array [1..5] of char;
    LNAME    : array [1..30] of char;
end;

// ��� : ����ǰ�÷������Ȳ(50680)
type
  TDISUSECHLGO = packed record
    PNAME    : array [1..40] of char;  // ����
    PLINE    : array [1..5] of char;   // ����
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ����
    BOXNO    : array [1..13] of char;  // ����ȣ
    HOGI     : array [1.. 5] of char;  // ȣ��
    ILJA     : array [1..10] of char;  // ����
    SIGAN    : array [1..8] of char;   // �ð�
    IRUM     : array [1..20] of char;  // �̸�
    REMARK   : array [1..50] of char;  // �̸�
end;

// ��� : ĳ����NO�� ���Ǽ��� ��Ȳ(33340)
type
  TCASTYOUNG = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    ITEMCODE : array [1..20] of char; // ǰ���ڵ�
    PMNAME   : array [1..50] of char; // ǰ��
    STD      : array [1..50] of char; // �԰ݸ�
    RQTY     : integer;               // ��ǰ����
    SDATE    : array [1..10] of char; // �߻���
    SSIGAN   : array [1.. 8] of char; // �߻��ð�
    EDATE    : array [1..10] of char; // ������
    ESIGAN   : array [1.. 8] of char; // �����ð�
    REASON   : array [1..50] of char; // ����
    REMARK   : array [1..50] of char; // ���
end;

// ��� : ��ü�����ϻ󼼳���(11201)
type
  TSPLCODELIST = packed record
    YURASN  : array [1..10] of char;  // ����S/N
    QTY     : integer;                // ����
    KEYNUM  : array [1..10] of char;
end;

// ��� : ������ü �԰�(10140)
type
  TMS_JAJAEINFO = Packed Record
    YURACODE : array [1..20] of char; // �����ڵ�
    STD      : array [1..50] of char; // �԰� 
    PMNAME   : array [1..50] of char; // ǰ��� 
    PACKQTY  : integer;               // �������� ���� ���� 
    DANWI    : array [1..5] of char;  // ����
  end;

// ��� : �������ü�������ó��(40010)
type
  TINSERTPIN = packed record
    ITEMCODE : array [1..20] of char;  // ǰ��
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    RQTY     : integer;                // ��ǰ����
    BQTY     : integer;                // �ҷ�����
    BOXNO    : array [1..13] of char;  // BOX NO
    SIGAN    : array [1..8] of char;   // �ð�
    SABUN    : array [1..10] of char;  // �����
  end;

// ��� : ����ǰ ���� ���ó��(40820)
type
  TWIPSCODE = packed record
    CODE    : array [1..5] of char;   // �ڵ�
    NAEYONG : array [1..50] of char;  // ����
end;

// ��� : ��ǰó ã��(00031)
type
  TSBPCode = packed record
    BPCODE  : array [1..10] of char;  // ��ü�ڵ�
    BPNAME  : array [1..50] of char; // ��ü��
end;


// ��� : ���� ������Ȳ(CASTNO��)(50140)
type
  TPOJANGCASTNO = packed record
    ITEMCODE : array [1..20] of char;  // ǰ���ȣ
    PMNAME   : array [1..50] of char;  // ǰ��
    STD      : array [1..50] of char;  // �԰ݸ�
    CASTNO   : array [1..10] of char;  // ĳ��Ʈ��ȣ
    RQTY     : integer;                // ���Լ���
    BQTY     : integer;                // �ҷ�����
    PORQTY   : integer;                // �������
    QLTQTY   : integer;                // �ܰ��Ϸ�
    BIGO     : array [1..400] of char; // ���
  end;

// ��� : �������������Ȳ(11260)
type
  TJAEGOLIST = packed record
    ILJA      : array [1..10] of char;  // ��������
    YURACODE  : array [1..20] of char;  // �����ڵ�
    PMNAME    : array [1..50] of char;  // ǰ���
    STD       : array [1..50] of char;  // �԰�
    QTY1      : integer;                // �ǻ����
    QTY2      : Double;                 // �����������
end;

// ��� : �������������Ȳ(11260)
type
  TJAEGOLIST2 = packed record
    ILJA      : array [1..10] of char;  // ��������
    YURACODE  : array [1..20] of char;  // �����ڵ�
    PMNAME    : array [1..50] of char;  // ǰ���
    STD       : array [1..50] of char;  // �԰�
    QTY1      : integer;                // �ǻ����
    QTY2      : integer;                 // �����������
end;
  
implementation

end.
