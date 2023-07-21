unit PubHeader;

interface

type
  TQueryData = packed record                 // 공통헤더
//    TotLength   : integer;                   // Packet전체길이(한 패킷에 오는 사이즈)
    CompressFlg : char;                      // 압축유무
    PacketID    : char;                      // Packet 유형($01 : IP할당시 , $10 : Polling, $70 : LOGINPUT,  $90 : Select, $91 : Delete, $92 : Insert, $93 : Update)
    ErrGu       : char;                      // Err 구분(0:정상, 1:에러)
//    TrCd        : array [0..3] of char;      // 조회번호
    TrCd        : integer;                   // 조회번호
    BeAf        : char;                      // 이전이후구분
    MsgCd       : array [0..3] of char;      // 메세지코드
    Msg         : array [0..79] of char;     // 에러메세지
    WinID       : integer;                   // 윈도아이디
    Org_Len     : integer;                   // 압축전 데이타 길이
    SQLGu       : char;                      // SQL 구분($05 : 저장 프로시져, $06 : 일반 SQL문)
    NxtLen      : integer;                   // Next 값이 있을때 Next 키값
    Filler      : array [0..14] of char;     // Filler(앞 2바이트 작업장)
    RCnt        : integer;                   // 레코드 갯수
end;

type
  TTr_Login = Packed record       // Login 정보
    Usid : array [0..7] of char;  // User-id
    Usnm : array [0..19] of char; // user name
    Pass : array [0..7] of char;  // password
    uscl : array [0..2] of char;  // 사용자등급
end;

type
  TPASSInfo = packed record // 핸들 및 소켓 정보
    Shandle    : integer;
    SSockNo    : integer;
  end;

type
  TDownInfo = packed record           // DownLoad 파일 정보
    FileName : array [0..39] of char; // 파일명
    DirName  : array [0..39] of char; // 폴더명
    FileVer  : integer;               // 파일버전
    FileSize : integer;               // 파일사이즈
    FileSeq  : integer;               // 다운로드 순번
  end;

type
  TFreeSvrRec = packed record        // 비어있는 서버의 아이피 및 포트
    SvrIp   : array [0..14] of char; // IP
    SvrPort : integer;               // Port
end;

type
  TcDataRcv = Packed Record             // TIPS,SAM 에서 사용
    SocIP    : array [0..14] of char;   // 소켓 IP
    SocWnn   : integer;                 // 소켓 Handle
    cNaeYong : array [0..2047] of char; // 내용
  end;

type
  TcSQLData = Packed Record                // SAM 에서 사용
    TipsWnn     : integer;                 // TIPS Handle
    TipsNaeYong : array [0..2047] of char; // 내용
  end;

type
  TRequestLogin = packed record   // Login 요청
    Usid : array [0..7] of char;
    Pass : array [0..7] of char;
end;

// 사용 : 사용자관리(00300)
type
  TUserMaster2 = packed record
    Usid    : array [1..8] of char;  // User-id
    Usnm    : array [1..20] of char; // user name
    Pass    : array [1..8] of char;  // password
    uscl    : array [1..2] of char;  // 사용자등급
    NAEYONG : array [1..20] of char; // 사용자등급내용
    USECHK  : char;                  // 사용여부(0:사용,1:미사용)
end;

// 사용 : 사용자관리(00300)
type
  TEtcCode = packed record
    SCODE   : array [1..2] of char;  // 세부코드
    NAEYONG : array [1..20] of char; // 내용
end;

// 사용 : 공급업체 정보(00020)
type
  TBPCode = packed record
    BPCODE  : array [1.. 8] of char;  // 업체코드
    BPNAME  : array [1..40] of char;  // 업체명
end;

// 사용 : 저장위치 정보(00040)
type
  TMS_STRLOC = packed record
    SLCODE  : array [1..4] of char;  // 저장위치 코드
    SLNAME  : array [1..50] of char; // 저장위치명
end;

// 사용 : 부서 정보(00100)
type
  TTEAMCode = packed record
    TCODE  : array [1..10] of char;  // 부서코드
    TNAME  : array [1..50] of char; // 부서명
    BPCHK  : char;                   // 외주여부
end;

// 사용 : 공급업체 찾기(00021)
type
  TSBPCode = packed record
    BPCODE  : array [1..8] of char;  // 업체코드
    BPNAME  : array [1..40] of char; // 업체명
end;

// 사용 : 창고정보(00070)
type 
  TWHCode = packed record
    WHCODE  : array [1..8] of char;  // 창고코드
    WHNAME  : array [1..40] of char; // 창고명 
end;
 
// 사용 : 창고 Loc 정보(00080)
type
  TWHLoc = packed record
    WHCODE  : array [1..8] of char;  // 창고코드
    WHLOC   : array [1..10] of char; // LOCATION
    REMARK  : array [1..40] of char; // REMARK
    WHNAME  : array [1..40] of char; // 창고명
end;

// 사용 : 창고 Loc 찾기(00081)
type
  TSWHLoc = packed record
    WHLOC   : array [1..10] of char;  // LOCATION
    WHNAME  : array [1..40] of char; // LOCATION 이름 
end;
 
// 사용 : 창고코드찾기(00081) 
type 
  TWHList = packed record 
    WHCODE  : array [1..8] of char;  // 창고코드 
    WHNAME  : array [1..40] of char; // 창고명 
end; 
        // 사용 : 창고코드찾기(00081) 
type 
  TLDHList = packed record
    WHCODE  : array [1..10] of char;  // 창고코드
    WHNAME  : array [1..40] of char; // 창고명
end;

// 사용 : 자재마스터(00090)
type
  TJAJAEMst = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    SPLJCODE : array [1..30] of char;  // 업체자재코드
    STD      : array [1..50] of char;  // 규격명
    PMNAME   : array [1..50] of char;  // 업체명
    DANWI    : array [1..5] of char;   // 단위
    PACKQTY  : Integer;                // 최소포장수량
    DANGA    : double;                 // 가단가
end;

// 사용 : 자재코드 찾기(00091)
type
  TSJAJAE = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    STD      : array [1..50] of char;  // 규격명
    PMNAME   : array [1..50] of char;  // 업체명
    DANWI    : array [1..5] of char;   // 단위
end;

// 사용 : 품목마스터 찾기(20301)
type
  TPTMST = packed record
    ITEMCODE : array [1..20] of char;  // 자재코드
    STD      : array [1..50] of char;  // 규격명
    PMNAME   : array [1..50] of char;  // 업체명
    DANWI    : array [1..5] of char;   // 단위
    GBN      : char;                   // 반제품구분
end;

// 사용 : 합격판정 시료기준 관리(30100) 
type 
  TISO2859 = packed record 
    DANWI   : array [1..5] of char;  // LOT 단위 
    RMIN    : integer;               // 최소값 
    RMAX    : integer;               // 최대값 
    INSQTY  : integer;               // 검사수량 
end;

// 사용 : 공정코드찾기(20101) 
type 
  TPCodeList = packed record
    PCODE  : array [1..5] of char;  // 공정코드
    PNAME  : array [1..40] of char; // 공정명
end;

// 사용 : 공정코드(20220)
type
  TMPCodeList = packed record
    PCODE  : array [1..5] of char;  // 공정코드
    PNAME  : array [1..40] of char; // 공정명
end;

// 사용 : 라인코드(39000)
type
  TMLineCode = packed record
    LCODE  : array [1..5] of char;  // 라인코드
    LNAME  : array [1..40] of char; // reMARK
end;

// 사용 : 위치그룹 정보(20190) 
type 
  TLOCGROUP = packed record 
    GCODE  : array [1..2] of char;  // 위치코드 
    GNAME  : array [1..40] of char; // 위치코드내용 
end;

// 사용 : 공정별 라인정보(20200)
type
  TPCode = packed record
    PCODE  : array [1..5] of char;   // 공정코드
    PNAME  : array [1..40] of char;  // 공정명
    PLINE  : array [1..5] of char;   // 라인명
    PLOC   : array [1..2] of char;   // 위치코드
    PQTY   : integer;                // 포장수량
    CAPA   : integer;                // CAPA
    CT     : double;                 // 사이클타임(초)
    HUMAN  : double;                 // 인원
    REMARK : array [1..40] of char;  // REMARK
end;

// 사용 : 생산라인정보(20220)
type 
  TLINEINFO = packed record
    PCODE  : array [1..5] of char;   // 공정코드 
    PNAME  : array [1..40] of char;  // 공정명
    PLINE  : array [1..5] of char;   // 라인명 
    HOGI   : array [1..5] of char;   // 위치코드
    JCHK   : char;                   // 자재용여부
    MCHK   : char;                   // 모니터링여부 
    REMARK : array [1..50] of char;  // REMARK
    HONM   : array [1..20] of char;   // 위치코드    
end;

// 사용 : 포장 캐스팅NO(40510_!)
type 
  TPOJANGCAST = packed record
    CASTNO1 : array [1..10] of char;   // 공정코드
    QTY1    : integer;                 // 공정명
    CASTNO2 : array [1..10] of char;   // 공정코드
    QTY2    : integer;                 // 공정명
end;

// 사용 : 품목 마스터(00060)
type
  TITEMMst = packed record
    ITEMCODE  : array [1..20] of char; // 품목CODE
    STD       : array [1..50] of char; // 규격명
    PMNAME    : array [1..50] of char; // 품목명
    DANWI     : array [1..5] of char;  // 단위
    ITEMGB    : array [1..2] of char;  // 제품구분(I/G, S/P)
    ACCTGB    : array [1..2] of char;  // 계정구분(01:제품, 02:반제품)
    REMARK    : array [1..20] of char; // REMARK
    QTY       : integer;               // 수량
    DANGA     : Double;               // 단가
end;

// 사용 : 대표품번 정보(00110)
type
  TMS_REPITEM = packed record
    ITEMCODE  : array [1..20] of char; // 품목CODE
    STD       : array [1..50] of char; // 규격명
    PMNAME    : array [1..50] of char; // 품목명
    DANWI     : array [1..5] of char;  // 단위
    ITEMGB    : array [1..2] of char;  // 제품구분(I/G, S/P)
    ACCTGB    : array [1..2] of char;  // 계정구분(01:제품, 02:반제품)
    REMARK    : array [1..20] of char; // REMARK
end;

// 사용 : 입하양품처리(31200) 
type 
  TJAJAEYANGLIST = packed record 
    YURACODE : array [1..20] of char;  // 자재코드 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    QTY      : integer;                // 입하수량
    QTY1     : integer;                // 양품수량 
    QTY2     : integer;                // 불량수량 
  end; 
 
// 사용 : 수입검사등록(31400) 
type
  TJAJAEYANGLIST2 = packed record
    OCM_NO   : array [1..10] of char;  // 납품서번호
    DO_SEQ   : integer;                // 순번
    SPLCODE  : array [1..10] of char;  // 업체자재코드
    YURACODE : array [1..20] of char;  // 자재코드
    BPNAME   : array [1..40] of char;  // 업체명
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    GQTY     : integer;                // 검사수량
  end; 

// 사용 : 자재특채등록(31500)
type
  TJAJAETUKLIST = packed record
    OCM_NO   : array [1..10] of char;  // 납품서번호
    DO_SEQ   : integer;                // 순번
    SPLCODE  : array [1..10] of char;  // 업체자재코드
    YURACODE : array [1..20] of char;  // 자재코드
    BPNAME   : array [1..40] of char;  // 업체명
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명  
    DANWI    : array [1..5] of char;   // 단위
    SN       : array [1..10] of char;  // S/N
    QTY      : integer;                // 수량
end;
 
// 사용 : 자재입하등록용 자재발주리스트(10100) 
type 
  TIPBalJooList = Packed Record 
    OCM_NO   : array [1..20] of char; // 발주번호 
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품목명 
    QTY      : integer;               // 발주수량 
  end; 
 
// 사용 : 자재마스터일부(10100) ,
type 
  TIPBalJooList2 = packed record 
    BJDATE : array [1..10] of char; // 발주일자 
    OCM_NO : array [1..20] of char; // 발주번호 
  end; 
 
// 사용 : 자재출고처리(10300)
type 
  TJaSinList = packed record 
    SINDT : array [1..10] of char; // 신청일자 
    SINNO : array [1..12] of char; // 신청번호 
  end;

// 사용 : 제품출고처리(70220_1)
type 
  TCHULHAREQ = packed record
    SINDT : array [1..10] of char; // 의뢰일자
    CHLNO : array [1..12] of char; // 의뢰번호
  end;

// 사용 : 제품 출고처리(70220)
type
  TChulgoLst = packed record
    SINDT    : array [1..10] of char; // 신청일자
    ITEMCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    SINQTY   : integer;               // 신청수량
    CQTY     : integer;               // 출고수량
    DANWI    : array [1..5] of char;  // 단위
  end;

// 사용 : 제품 출고처리(70220)
type 
  TChlItemQty = packed record
    ITEMCODE : array [1..20] of char; // 품목코드
    CQTY     : integer;               // 출고수량
  end;

// 사용 : 자재출고처리(10300)
type
  TJaSinList2 = packed record
    SINDT    : array [1..10] of char; // 신청일자
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    SINQTY   : integer;               // 신청수량
    WICHI    : array [1..2] of char;  // 위치정보
    PCODE    : array [1..5] of char;  // 공정코드
    CQTY     : integer;               // 출고수량
    DANWI    : array [1..5] of char;  // 단위
  end;

// 사용 : 자재출고처리(10300)
type
  TJaSinList3 = packed record
    YURACODE : array [1..20] of char; // 자재코드
    WICHI    : array [1..2] of char;  // 위치정보
    QTY      : integer;               // 출고수량
  end;
 
// 사용 : 자재마스터일부(10100) 
type 
  TSPLJCODEList = Packed Record 
    YURACODE : array [1..20] of char; // 자재코드 
    STD      : array [1..50] of char; // 규격 
    PMNAME   : array [1..50] of char; // 품목명 
    PACKQTY  : integer;               // 자재포장 단위 수량 
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 입고된수량 
  end; 
 
// 사용 : 특채코드 정보(30300) 
type 
  TSPECODE = packed record 
    SCODE  : array [1..8] of char;  // 특채코드 
    SNAME  : array [1..50] of char; // 특채내용 
  end; 
 
// 사용 : 수입검사 불량코드 정보(30200)  
type  
  TJAJAEQCCODE = packed record  
    JQCCODE  : array [1..8] of char;  // 불량코드  
    JQCNAME  : array [1..50] of char; // 불량내용  
end; 

// 사용 : 공정 불량코드 정보(30210)   
type   
  TPROCQCCODE = packed record   
    PCODE   : array [1..5] of char;  // 공정코드
    PNAME   : array [1..40] of char; // 공정명
    PQCCODE : array [1..8] of char;  // 공정불량코드
    PQCNAME : array [1..50] of char; // 공정불량내용
    BCAUSE  : array [1..50] of char; // 발생원인
    IMGNM   : array [1..20] of char; // 이미지 
end;

// 사용 : 캐스팅NO별 불량분석(32100)
type   
  TCASTANALY = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SEQNO   : integer;                // 순번
    BADTYPE : array [1..20] of char;  // 불량유형
    ONER    : array [1..6] of char;   // 1차저항
    TWOR    : array [1..6] of char;   // 2차저항
    TWOV    : array [1..6] of char;   // 2차전압
    IMGNM   : array [1..20] of char;  // 첨부
    REMARK  : array [1..50] of char;  // 기타
    GUMTYPE : array [1..20] of char;  // 검출유형
    QTY     : integer;                // 수량
  end;

// 사용 : 캐스팅NO별 내구시험(32120)
type
  TCASTTEST = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    MANAME  : array [1..20] of char;  // 시험장비
    TDATE   : array [1..10] of char;  // 시험일자
    SEQNO   : integer;                // 순번
    FAILT   : integer;                // 고장시간
    STOPT   : integer;                // 중단시간
    RLTDEC  : array [1..60] of char;  // 분석결과
    IMGNM   : array [1..20] of char;  // 첨부
    REMARK  : array [1..500] of char; // 기타
  end;

// 사용 : 캐스팅NO별 용의 설정(32110)
type
  TCASTCARE = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SDATE   : array [1..10] of char;  // 발생일
    SSIGAN  : array [1..8] of char;   // 발생시간
    EDATE   : array [1..10] of char;  // 해제일
    ESIGAN  : array [1..8] of char;   // 해제시간
    REASON  : array [1..50] of char;  // 사유
    REMARK  : array [1..50] of char;  // 기타
  end;

// 사용 : 품목별자재소요량(20300)
type
  TITEMBOM = packed record
    ITEMCODE : array [1..20] of char;  // 품목CODE
    ISTD     : array [1..50] of char;  // 규격명
    IPMNAME  : array [1..50] of char;  // 품목명
    PCODE    : array [1..5] of char;   // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    YURACODE : array [1..20] of char;  // 자재코드
    JSTD     : array [1..50] of char;  // 규격명
    JPMNAME  : array [1..50] of char;  // 품명
    DANWI    : array [1..5] of char;   // 단위
    REQTY    : double;                 // 소요수량
    GBN      : char;                   // 구분
end;
// 사용 : 공정별 자재신청(10700)
type
  TJAJAESINMST = packed record
    SINNO    : array [1..12] of char;  // 신청번호
    CHLDT    : array [1..10] of char;  // 출고요청일자
    WICHI    : array [1..2] of char;   // 위치
    JGBN     : array [1..2] of char;   // 제품구분  
    SINDT    : array [1..10] of char;  // 신청일자
    SABUN    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    ID_PASS  : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    GBN      : array [1..2] of char;   // 구분
    CHSLC    : array [1..4] of char;  // 출고저장위치코드
    SLNAME   : array [1..50] of char;  // 출고저장위치코드명
    IPSLC    : array [1..10] of char;  // 입고저장위치코드
    NAME     : array [1..50] of char;  // 입고저장위치코드명

end;

// 사용 : 출하의뢰 등록(50100)
type
  TCHULHAREQMST = packed record
    CHLNO    : array [1..12] of char;  // 출하번호
    CHLDT    : array [1..10] of char;  // 출고요청일자
    CTCODE   : array [1..10] of char;  // 납품처 코드
    CTNAME   : array [1..50] of char;  // 납품처명
    JGBN     : array [1..2] of char;   // 제품구분
    SINDT    : array [1..10] of char;  // 의뢰일자
    SABUN    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    ID_PASS  : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 출고구분
    SLCODE   : array [1..4] of char;   // 출고저장위치
    SLNAME   : array [1..50] of char;  // 출고저장위치명
end;

// 사용 : 창고별 Loc재고현황(11160)
type 
  TJAJAEWHLIST2 = packed record
    WHCODE   : array [1..8] of char;  // 창고코드 
    WHNAME   : array [1..40] of char; // 창고명
    WHLOC    : array [1..10] of char; // LOCATION      
    YURACODE : array [1..20] of char; // 자재코드 
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 입하수량 
  end;

// 사용 : 창고별 재고현황(11170)
type 
  TSJAJAEWHLIST = packed record
    WHCODE   : array [1.. 8] of char; // 창고코드
    WHNAME   : array [1..40] of char; // 창고명
    YURACODE : array [1..20] of char; // 자재코드 
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    QTY      : integer;               // 입하수량  
    DANWI    : array [1..5] of char;  // 단위
  end;

// 사용 : 저장위치별 재고현황(11320)
type
  TSJAJAEWHLIST2 = packed record
    SLCODE   : array [1.. 4] of char; // 창고코드
    SLNAME   : array [1..50] of char; // 창고명
    YURACODE : array [1..20] of char; // 자재코드 
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    QTY      : integer;               // 입하수량  
    DANWI    : array [1..5] of char;  // 단위
  end;

// 사용 : 자재코드별 LOC재고(11100) 
type 
  TJAJAELOCLIST = packed record 
    ILJA  : array [1..10] of char;  // 입하일자
    WHLOC : array [1..10] of char;  // LOCATION
    QTY   : integer;                // 입하수량 
  end;

// 사용 : 캐스팅NO별 외관불량 현황(33190)
type
  TAPPQCPRE = packed record
    PNAME   : array [1..40] of char;  // 공정명
    PQCCODE : array [1..8] of char;   // 불량코드
    PQCNAME : array [1..50] of char;  // 불량코드명
    QTY     : integer;                // 불량수량
  end;

// 사용 : 캐스팅NO별 계정대체 현황(33200)
type
  TDAECHEPRE = packed record
    PNAME   : array [1..40] of char;   // 공정명
    PLINE   : array [1..5] of char;    // 라인
    QTY     : integer;                 // 불량수량
    TNAME   : array [1..40] of char;   // 부서명
    NAEYONG  : array [1..50] of char;  // 출고사유코드명
    SNAEYONG : array [1..50] of char;  // 사유내용
    ILJA    : array [1..10] of char;   // 일자
    SIGAN   : array [1..8] of char;    // 시간
    IRUM    : array [1..20] of char;     // 처리자
  end;

// 사용 : 자재코드별 LOC재고(업체구분)(11200)
type 
  TMJAJAELOCLIST = packed record
    ILJA     : array [1..10] of char;     // 입하일자
    WHLOC    : array [1..10] of char;     // LOCATION
    BPNAME   : array [1..40] of char;     // 업체명
    SPLSN    : array [1..20] of char;     // 업체LOT
    QTY      : integer;                   // 입하수량
    SPLCODE  : array [1..10] of char;      // 업체코드
    REMARK   : array [1..100] of char;    // 비고
  end;

  // 사용 : 자재코드별 업체LOT 조회(11180)
type 
  TJAJAESPLSNLIST = packed record 
    WHCODE   : array [1..8] of char;   // 창고코드 
    WHNAME   : array [1..40] of char;  // 창고명 
    WHLOC    : array [1..10] of char;  // Location 
    YURACODE : array [1..20] of char;  // 유라자재코드 
    SPLSN    : array [1..20] of char;  // 업체LOT 
    Qty      : integer;                // 재고수량  
    DANWI    : array [1..5] of char;   // 단위
end; 
 
// 사용 : 자재코드별 업체LOT 상세조회(11190) 
type 
  TJAJAESPLSNDLIST = packed record
    WHCODE   : array [1..8] of char;   // 창고코드 
    WHNAME   : array [1..40] of char;  // 창고명 
    WHLOC    : array [1..10] of char;  // Location 
    YURACODE : array [1..20] of char;  // 유라자재코드 
    SPLSN    : array [1..20] of char;  // 업체LOT
    YURASN   : array [1..10] of char;  // 유라LOT
    IPDate   : array [1..10] of char;  // 입고일자 
    Qty      : integer;                // 재고수량    
    DANWI    : array [1..5] of char;   // 단위
end;

// 사용 : 생산계획 조회(20410)
type
  TWeekPlanList = packed record
    PLDATE    : array [1..10] of char; // 계획일자
    PCODENAME : array [1..47] of char; // 공정
    PLINE     : array [1..5] of char;  // 라인
    ITEMCODE  : array [1..20] of char; // 유라코드
    PMNAME    : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
    GQTY      : integer;               // 계획수량
    SLCODE    : array [1.. 4] of char; // 저장위치 코드
    SLNAME    : array [1..50] of char; // 저장위치명
    ORNUM     : array [1..12] of char; // 작업오더번호
end;

// 사용 : 계획대비소요량 조회(10710)
type 
  TJAJAEREQ = packed record
    PCODE    : array [1..5] of char;   // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    PACKQTY  : Integer;                // 최소포장수량
    DANWI    : array [1..5] of char;   // 단위
    SOYOQTY  : double;
    JGQTY    : int64;    
end;

// 사용 : 출하의뢰 상세(50110)
type
  TCHULHAREQL = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SINQTY   : Integer;                // 의뢰수량
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 출하의뢰 상세(50210)
type
  TYCHULHAREQL = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SINQTY   : Integer;                // 의뢰수량
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 자재코드 조회(10720)
type
  TJAJAESEL = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    PACKQTY  : Integer;                // 최소포장수량
    DANWI    : array [1..5] of char;   // 단위
end;

// 사용 : 품목코드 조회(50111)
type
  TPTMSTVIEW = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
end;

// 사용 : 자재 신청내역(10751)
type 
  TDSJAJAESIN = packed record
    PNAME    : array [1..50] of char;  // 공정명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    PACKQTY  : Integer;                // 최소포장수량
    DANWI    : array [1..5] of char;   // 단위
    SINQTY   : Integer;
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 신청대비출고현황(10761)
type
  TCHJAJAESIN = packed record
    PNAME    : array [1..50] of char;  // 공정명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    PACKQTY  : Integer;                // 최소포장수량
    DANWI    : array [1.. 5] of char;  // 단위
    SINQTY   : Integer;
    CHLQTY   : Integer;
    DIFQTY   : Integer;
    GBN      : array [1.. 2] of char;
    CHLDT    : array [1..10] of char;
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 자재출고 상세내역(11210)
type
  TCHGDETAIL = packed record
    WHLOC    : array [1..10] of char;   // WHLOC
    YURASN   : array [1..10] of char;   // 바코드
    CHLQTY   : Integer;                 // 출고수량
    CHGDATE  : array [1..10] of char;   // 출고일자
    SIGAN    : array [1..8] of char;    // 출고시간
    BPNAME   : array [1..40] of char;   // 공급업체
    SPLSN    : array [1..20] of char;   // 업체SN
    IPDATE   : array [1..10] of char;   // 입고일자
end;

// 사용 : 공정별자재신청 상세 조회(10710)
type
  TJAJAESIN = packed record
    PCODE    : array [1..10] of char;   // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    PACKQTY  : Integer;                // 최소포장수량
    DANWI    : array [1..5] of char;   // 단위
    SOYOQTY  : double;
    SINQTY   : Integer;
    PLNDT    : array [1..10] of char; // 계획일
    REMARK   : array [1..50] of char; // REMARK
end;

// 사용 : 입하확정취소(31210) 
type 
  TJAJAECANCELLIST = packed record
    SPLCODE  : array [1..10] of char;   // 업체코드 
    YURACODE : array [1..20] of char;  // 자재코드 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    QTY      : integer;                // 입하수량 
    QTY1     : integer;                // 양품수량 
    QTY2     : integer;                // 불량수량 
end;

// 사용 : 기간별 자재입고현황LOC(10910)
type
  TILJAJAJAELIST = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    WHNAME   : array [1..40] of char;  // 창고명
    WHLOC    : array [1..10] of char;  // LOCATION
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
  end;

// 사용 : 업체별 자재입하현황(10900)
type
  TILJAJAJAELIST3 = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    SPLCODE  : array [1..10] of char;   // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입하수량
  end;


// 사용 : 업체별 자재입하현황(업체S/N포함)(10930)
type
  TIPHASPLSN = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    SPLCODE  : array [1..10] of char;   // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위    
    SPLSN    : array [1..20] of char;  // 업체S/N
    QTY      : integer;                // 입하수량
end;

// 사용 : 업체별 자재입하현황(대표바코드포함)(10940)
type
  TBIPHASPLSN = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    SPLCODE  : array [1..10] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1.. 5] of char;  // 단위
    SPLSN    : array [1..20] of char;  // 업체S/N
    KEYNUM   : array [1..10] of char;  // 대표바코드
    QTY      : integer;                // 입하수량
    SETDT    : array [1..10] of char;  // 확정일자
    SETSIGAN : array [1.. 8] of char;  // 확정시간
    SETIRUM  : array [1..20] of char;  // 확정자
end;

// 사용 : 기간별 자재입고현황(11140)
type
  THILJAJAJAELIST = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
end;

// 사용 : 자재신청 승인 및 취소(10750)
type
  TJAJAESINYN = packed record
    CHLDT    : array [1..10] of char;  // 출고요청일자
    SINNO    : array [1..12] of char;  // 신청번호
    WICHI    : array [1..2] of char;   // 위치
    JGBN     : array [1..2] of char;   // 제품구분
    SIRUM    : array [1..20] of char;  // 신청자
    YN       : char;                   // 승인여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    YIRUM    : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    GBN      : array [1..2] of char;   // 구분
    CHSLC    : array [1..4] of char;   // 출고저장위치코드
    SLNAME   : array [1..50] of char;  // 출고저장위치코드명
    IPSLC    : array [1..10] of char;  // 입고저장위치코드
    NAME     : array [1..50] of char;  // 입고저장위치코드명
end;

// 사용 : 출하의뢰 등록(50200)
type
  TCHULHAREQMSTYN = packed record
    CHLDT    : array [1..10] of char;  // 출고요청일자
    CHLNO    : array [1..12] of char;  // 출하번호
    CTNAME   : array [1..50] of char;  // 납품처명
    JGBN     : array [1..2] of char;   // 제품구분
    SIRUM    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    YIRUM    : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 구분
    SLCODE   : array [1..4] of char;   // 출고저장위치
    SLNAME   : array [1..50] of char;  // 출고저장위치명
end;

// 사용 : 자재신청 및 출고현황(10760)
type
  TSJAJAESINYN = packed record
    CHLDT    : array [1..10] of char;  // 출고요청일자
    SINNO    : array [1..12] of char;  // 신청번호
    WICHI    : array [1..2] of char;   // 위치
    JGBN     : array [1..2] of char;   // 제품구분
    SIRUM    : array [1..20] of char;  // 신청자
    YN       : char;                   // 승인여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    YIRUM    : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 구분    
end;

// 사용 : 공정별 품목정보 찾기(20400) 
type 
  TItemCodeList = packed record 
    ITEMCODE  : array [1..20] of char;   // 품목코드 
    STD       : array [1..50] of char;   // 규격명 
    PMNAME    : array [1..50] of char;   // 품목명 
    DANWI     : array [1..5] of char;    // 단위 
end;

// 사용 : 생산계획 등록(20400) 
type 
  TWeekPlan = packed record 
    ITEMCODE : array [1..20] of char; // 품목CODE 
    PLDATE   : array [1..10] of char; // 계획일 
    GQTY     : integer;               // 계획수량 
end;

// 사용 : 업체별 자재입고현황(Loc포함)(10920)
type
  TILJAJAJAELIST2 = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    WHNAME   : array [1..40] of char;  // 창고명
    WHLOC    : array [1..10] of char;  // LOCATION
    SPLCODE  : array [1..10] of char;   // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
end;

// 사용 : 업체별 자재입고현황(업체SN포함)(10950)
type
  TMILJAJAJAELIST = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    WHNAME   : array [1..40] of char;  // 창고명
    WHLOC    : array [1..10] of char;  // LOCATION
    SPLCODE  : array [1..10] of char;   // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SPLSN    : array [1..20] of char;  // 업체S/N
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
end;

// 사용 : 로테이팅수동실적처리(40010) 
type  
  TQLTBCODE = packed record 
    PQCCODE  : array [1..8] of char; 
    PQCNAME  : array [1..50] of char; 
    FILENAME : array [1..20] of char; 
  end;

// 사용 : 검마투입처리(40200), V2검사(40300)
type 
  TVIEWPIN2 = packed record 
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    CASTNO   : array [1..10] of char;  // 캐스팅번호 
    RQTY     : integer;                // 양품수량 
  end;

// 사용 : 포장 실적처리(40500)
type
  TVIEWPO = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    CASTNO   : array [1..10] of char;  // 캐스팅번호 
    RQTY     : integer;                // 양품수량 
  end;

// 사용 : 포장불량등록(40540)
type
  TPOBAD = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명
  end;

// 사용 : 로테이팅수동실적처리(40010),자재투입처리(40810),권선수동실적처리(40020) 
type 
  TJJTOOIP_JV = packed record 
    YURACODE : array [1..20] of char;  // 자재코드 
    QTY      : integer;                // 수량 
    SPLSN    : array [1..20] of char;  // 업체LOT 
    IPTUK    : char;                   // 특채여부 
  end;

  // 사용 : 외관검사실적처리(40400) 
type 
  TQUALITYLIST = packed record 
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    RQTY     : integer;                // 양품수량 
    BQTY     : integer;                // 불량수량 
    CASTNO   : array [1..10] of char;  // 캐스팅번호 
    SIGAN    : array [1..8] of char;   // 시간 
    SABUN    : array [1..10] of char;  // 등록자 
  end;

  // 사용 : 포장투입처리(40500)
type
  TPOJANGIN = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    RQTY     : integer;                // 양품수량 
    BQTY     : integer;                // 불량수량 
    CASTNO   : array [1..10] of char;  // 캐스팅번호 
    SIGAN    : array [1..8] of char;   // 시간 
    SABUN    : array [1..10] of char;  // 등록자 
  end;

// 사용 : 공정별 라인정보(20200) 
type 
  TPACKQTY = packed record 
    PCODE  : array [1..5] of char;   // 공정코드 
    PLINE  : array [1..5] of char;   // 라인명 
    PQTY   : integer;                // 포장수량
  end;   

// 사용 : 포장투입처리(40500)
type 
  TPQLT_B = packed record
    PQCCODE : array [1..8] of char;   // 불량코드
    PQCNAME : array [1..50] of char;  // 불량내용
    BQTY    : integer;                // 불량수량
  end;

// 사용 : 공정별 품목정보(20210)
type 
  TPROCITEMCODE = packed record
    PCODE     : array [1..5] of char;    // 공정코드
    PNAME     : array [1..40] of char;   // 공정명
    ITEMCODE  : array [1..20] of char;   // 품목코드
    PMNAME    : array [1..50] of char;   // 품목명
    STD       : array [1..50] of char;   // 규격명 
    REMARK    : array [1..40] of char;   // Remark 
end;

// 사용 : 포장실적처리(40510)
type
  TPOJANGCB1 = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..50] of char;  // 품목명
end;

// 사용 : 포장실적처리(40510)
type
  TPOJANGCB = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    ZONE     : array [1..15] of char;  // 지역
    CAR      : array [1..15] of char;  // 차종
    JANGSO   : array [1..14] of char;  // 납품장소
    DANWI    : array [1..5] of char;   // 단위
    PQTY     : integer;                // 적입수량
    LCOL     : array [1..10] of char;  // 라벨색상
    MARK     : array [1..10] of char;  // 각인
    LTYPE    : char;                   // 라벨타입
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // 고객구분
    QTY      : double;                 // set 수량
end;

// 사용 : 포장분리(70280) 
type 
  TPOJANDIV = packed record 
    ITEMCODE : array [1..20] of char;  // 품번 
    STD      : array [1..50] of char;  // 규격명 
    ITEMNM   : array [1..30] of char;  // 부품명 
    ZONE     : array [1..15] of char;  // 지역 
    CAR      : array [1..15] of char;  // 차종 
    JANGSO   : array [1..14] of char;  // 납품장소 
    DANWI    : array [1..5] of char;   // 단위 
    PQTY     : integer;                // 적입수량 
    LCOL     : array [1..10] of char;  // 라벨색상 
    MARK     : array [1..10] of char;  // 각인 
    LTYPE    : char;                   // 라벨타입 
    HEAD     : char;                   // HEAD 
    CGBN     : char;                   // 고객구분 
    QTY      : double;                 // set 수량
    LOTNO    : array [1..10] of char;  // LOTNO
    BOXNO1   : array [1..10] of char;  // BOXNO1
    BOXNO2   : array [1..10] of char;  // BOXNO2
    CASTNO   : array [1..10] of char;  // CASTNO
    PMNAME   : array [1..50] of char;  // 품목명 
end;
// 사용 : 포장합체(70290)
type
  TPOJANSUM = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    ZONE     : array [1..15] of char;  // 지역
    CAR      : array [1..15] of char;  // 차종
    JANGSO   : array [1..14] of char;  // 납품장소
    DANWI    : array [1..5] of char;   // 단위
    PQTY     : integer;                // 적입수량
    LCOL     : array [1..10] of char;  // 라벨색상
    MARK     : array [1..10] of char;  // 각인
    LTYPE    : char;                   // 라벨타입
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // 고객구분
    QTY      : integer;                // set 수량
    LOTNO    : array [1..10] of char;  // LOTNO
    CASTNO   : array [1..10] of char;  // CASTNO
    PMNAME   : array [1..50] of char;  // 품목명
end;


// 사용 : 대표라벨 발행(40520)
type
  TDAEPYO = packed record
    PMNAME   : array [1..50] of char;  // 규격명
    QTY      : integer;                // set 수량
    LTYPE    : char;                   // 라벨타입
end;

// 사용 : 1,2차권선 수동라벨 발행(40860)
type
  TKWONSUNREPT = packed record
    PLINE    : array [1..5] of char;   // 라인
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명    
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간      
    ITEMCODE : array [1..20] of char;  // 품목코드
end;

// 사용 : 조립 수동라벨 발행(40870)
type
  TJOLIPREPT = packed record
    PLINE    : array [1..5] of char;   // 라인
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명    
    PALLET   : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
end;

// 사용 : 캐스팅 수동라벨 발행(40880)
type
  TCASTREPT = packed record
    HONM     : array [1..20] of char;  // 공정설명
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    JOLINE   : array [1..5] of char;   // 조립라인 
    ITEMCODE : array [1..20] of char;  // 품번
end;

// 사용 : 포장실적처리(40510)
type
  TPOJANGJOB = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    PQTY     : integer;                // 적입수량
    BOXNO    : array [1..10] of char;  // 박스바코드
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    LOTNO    : array [1..10] of char;  // LOTNO
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
    SETQTY   : integer;                // SET수량
end;

  // 사용 : 검사마킹투입처리(40200),v2검사실적처리(40300)
type
  TGUMMALIST = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    BOXNO    : array [1..13] of char;  // BOX NO
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
end;

// 사용 : 조립투입 상세현황(50120)
type
  TJOLIPINLIST = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    IRUM     : array [1..20] of char;  // 작업자
end;

// 사용 : 캐스팅실적조회(50060)
type 
  TCASTINGLIST1 = packed record 
    HONM     : array [1..20] of char;  // 공정설명 
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    BOXNO    : array [1..13] of char;  // BOX NO 
    RQTY     : integer;                // 양품수량 
    BQTY     : integer;                // 불량수량 
    ILJA     : array [1..10] of char;  // 일자 
    SIGAN    : array [1..8] of char;   // 시간 
    FDATE    : array [1..10] of char;  // 일자 
    JUYA     : char;                   // 주야 
    CASTNO   : array [1..10] of char;  // 캐스팅번호 
    PALLET   : array [1..6] of char;   // 파렛트번호 
    JOLINE   : array [1..5] of char;   // 조립라인 
    IRUM     : array [1..20] of char;  // 작업자 
    INILJA   : array [1..10] of char;  // 일자 
    INSIGAN  : array [1..8] of char;   // 시간 
    LT       : integer; 
    JBOXNO   : array [1..13] of char;  // BOX NO 
end;

// 사용 : 로테이팅실적조회(50010),1차권선실적조회(50020),2차권선실적조회(50030),아크용접실적조회(50040),조립실적조회(50050),캐스팅실적조회(50060),검마실적조회(50080),V2검사실적조회(50090),외관검사실적조회(50300)
type 
  TINSERTPINLIST3 = packed record 
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    RQTY     : integer;                // 양품수량 
    BQTY     : integer;                // 불량수량 
    FDATE    : array [1..10] of char;  // 일자 
    JUYA     : char;                   // 주야 
end;       

// 사용 : 조립실적조회(50050)
type
  TJOLIPNLIST3 = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
end;

// 사용 : 제품입고처리(70200)
type 
  TIPGOSCAN = packed record
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 입고수량
    CASTNO   : array [1..10] of char; // 캐스팅번호
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
  end;

// 사용 : 제품입고처리(70200)
type 
  TIPGOSCANL = packed record
    BOXNO    : array [1..10] of char; // 박스바코드
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 입고수량
    CASTNO   : array [1..10] of char; // 캐스팅번호
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
    SABUN    : array [1..10] of char; // 입고자
  end;

// 사용 : 기간별 캐스팅NO 품질현황(33180)
type
  TCASTQCDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    SQTY     : integer;               // 검마성능불량수량
    VQTY     : integer;               // V2성능불량수량
    EQTY     : integer;               // 외관불량수량(캐스팅~포장)
    DQTY     : integer;               // 계정대체수량
    CARE     : char;
    GUMMA    : array [1..10] of char; // CASTNO
    V2GUM    : array [1..10] of char; // CASTNO
    CTNO     : array [1..10] of char; // CASTNO
    NTF      : integer;               // NTF수량
    BIGO     : array [1..400] of char; // 비고
    PBIGO    : array [1..400] of char;  // 비고     
end;

// 사용 : 공정정보(20100), (20101), (33150)
type 
  TProcCode = packed record
    ITEMGB  : array [1..2] of char;   // 제품구분(I/G, S/P)
    PCODE   : array [1..5] of char;   // 공정코드
    PNAME   : array [1..40] of char;  // 공정명
end;

// 사용 : 공정별불량현황조회(33110)
type
  TQLT_B_LIST = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    ILJA     : array [1..10] of char;  // 작업일자
    SIGAN    : array [1..8] of char;   // 작업시간
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;

// 사용 : 공정 라인 불량유형별 현황 (33140)
type
  TPQCCODENQTY = packed record
    PQCCODE  : array [1..8] of char;    // 불량코드
    PQCNAME  : array [1..50] of char;   // 불량코드명
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정 라인 일자별 불량률현황 (33130)
type
  TRQTYNBQTY = packed record
    PLINE    : array [1..5] of char;   // 생산일자
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 기간별 캐스팅NO 성능불량현황 (차크)(33320)
type
  TCASTQCCHART = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량계
    NTF      : integer;               // 불량수량계    
end;

// 사용 : 공정별 불량률 현황 (33330)
type
  TGONGLINEPPM = packed record
    PLINE    : array [1..5] of char;   // 생산일자
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;
// 사용 : 공정 라인별 불량률현황 (33120)
type
  TPLINEPPM = packed record
    PCODE    : array [1..5] of char;    // 공정
    PLINE    : array [1..5] of char;    // 라인
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정별 불량률현황 (33150)
type
  TPROCPPM = packed record
    PCODE    : array [1..5] of char;    // 공정
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정별불량현황조회(33110)
type
  TQLT_B_LIST2 = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;
 
// 사용 : 캐스팅 상세생산현황(50490) 
type 
  TCAST_SANG_LIST2 = packed record 
    ILJA   : array [1..10] of char; // 일자 
    RQTY   : integer;               // 양품수량 
    JBTIME : integer;               // 부여시간 
    GATIME : integer;               // 가동시간 
    BITIME : integer;               // 비가동시간
    BQTY   : integer;               // 불량수량 
  end;

// 사용 : 공정별 일일 품질현황(33230)
type
  TQCDAYDSP = packed record
    PCODE: array [1..5] of char;  // 공정코드
    LINE : array [1..5] of char;  // 라인
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
    BQTY : integer;               // 불량수량
  end;

// 사용 : 공정별 일일 품질현황(33230)
type
  TQCDAYDSP1 = packed record
    PCODE: array [1..5] of char;  // 공정코드
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
    BQTY : integer;               // 불량수량
  end;

// 사용 : 조립 계획대비 실적현황(50520)
type
  TPVSSIL1 = packed record
    ILJA : array [1..10] of char; // 일자
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
  end;

// 사용 : 자재재고조정(10500)
type
  TJAJAEJOJUNGLIST = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 실사수량 
    SYSQTY   : integer;                // 시스템수량
    DIFFQTY  : integer;                // 차이수량
end;

// 사용 : 제품 재고조정(70260)
type
  TITEMJOJUNGLIST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 실사수량  
    SYSQTY   : integer;                // 시스템수량
    DIFFQTY  : integer;                // 차이수량
end;

// 사용 : 수동조립실적처리(40050)
type
  TJOTOO = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 양품수량
    BOXNO    : array [1..13] of char;  // 아크용접 BOX NO
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
  end;

// 사용 : 업체별 자재입고현황(11150)
type
  TILJAJAJAELIST5 = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    SPLCODE  : array [1..10] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
end;

// 사용 : 기간별 자재입고 집계현황(11220)
type
  TILJASUMJAJAE = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량
end;

// 사용 : 기간별 자재출고 집계현황(11220)
type
  TILJASUMJAJAECH = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 출고수량
end;

// 사용 : 품목코드별 자재입출고 현황(11240)
type
  TINOUTJAJAE = packed record
    IODT     : array [1..10] of char;  // 입출일자
    CUSTNM   : array [1..50] of char;  // 공정(업체,부서)명
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입출수량
    IOGBN    : char;                   // 입출구분(I;입고, O;출고)
end;

// 사용 : 자재실사(10400)
type
  TJAJAEMST_CODE = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    DANWI    : array [1..5] of char;   // 단위
  end;

// 사용 : 자재실사(10400)
type
  TITEMMST_CODE = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    DANWI    : array [1..5] of char;   // 단위
  end;

// 사용 : 메인메뉴
type
  TWORKMNLIST = packed record
    MYTR : array [1..5] of char;
    WKTR : array [1..200] of char;
end;

// 사용 : 자재로트추적(33240)
type 
  TJAJAELOTSCH = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 라인명
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BPNAME   : array [1..40] of char; // 업체명
    SPLSN    : array [1..20] of char;  // 업체LOT
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // 일자
    JUYA     : char;
  end;

// 사용 : 자재로트추적(33350)
type 
  TJAJAELOTSCH2 = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 라인명
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BPNAME   : array [1..40] of char; // 업체명
    SPLSN    : array [1..20] of char;  // 업체LOT
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // 일자
    JUYA     : char;
  end;

// 사용 : 부여시간등록(00200)
type
  TBOOYOIN = packed record
    PCODE  : array [1..5] of char;   // 공정코드
    PNAME  : array [1..40] of char;  // 공정명
    PLINE  : array [1..5] of char;   // 라인명
end;

// 사용 : 개인별 부여시간입력(00200)
type
  TBOOYOINLIST2 = packed record
    SABUN : array [1..10] of char; // 사번
    IRUM  : array [1..20] of char; // 이름
    STIME : array [1..8] of char;  // 시작
    ETIME : array [1..8] of char;  // 종료
  end;

// 사용 : 호기별자재투입현황(50070)
type
  TJAJAETOIPLIST = packed record
    ILJA     : array [1..10] of char;
    YURASN   : array [1..10] of char;  // 자재바코드
    YURACODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    SIGAN    : array [1..8] of char;   // 시간
    BPNAME   : array [1..50] of char;  // 업체명
    SPLSN    : array [1..20] of char;  // 업체LOT
    IPDATE   : array [1..10] of char;  // 입고일자
    DANWI    : array [1..5] of char;   // 단위
  end;

// 사용 : 공정자재 실사현황(10960)
type
  TGONGJAJAESIL = packed record
    YURASN   : array [1..20] of char;  // 자재바코드
    YURACODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 이름
    PCODE  : array [1..5] of char;     // 공정코드
  end;

// 사용 : 공정반제품 실사현황(10970)
type
  TGONGBANSIL = packed record
    YURASN   : array [1..20] of char;   // 박스바코드
    YURACODE : array [1..20] of char;   // 품번
    PMNAME   : array [1..50] of char;   // 품명
    STD      : array [1..50] of char;   // 규격명
    QTY      : integer;                 // 입하수량
    SIGAN    : array [1..8] of char;    // 시간
    IRUM     : array [1..20] of char;   // 이름
    PCODE    : array [1..5] of char;    // 공정코드
    SLCODE   : array [1..4] of char;    // 저장위치 코드
    SLNAME   : array [1..50] of char;   // 저장위치명
  end;

// 사용 : 조립박스 변경이력(10980)
type
  TJOBOXCHG = packed record
    FIXEDBOXNO1 : array [1..6] of char;   // 박스바코드
    FIXEDBOXNO2 : array [1..6] of char;   // 품번
    BOXNO       : array [1..13] of char;  // 품명
    ILJA        : array [1..10] of char;  //
    SIGAN       : array [1..8] of char;   //
    YURACODE    : array [1..20] of char;   // 품번
    PMNAME      : array [1..50] of char;   // 품명
    STD         : array [1..50] of char;   // 규격명
    RQTY        : integer;
    IRUM        : array [1..20] of char;  // 이름
    HOGI        : array [1..5] of char;
  end;

// 사용 : 반제품실사재고조정(10550) 
type 
  THWIPJOJUNGLIST = packed record 
    ITEMCODE : array [1..20] of char; 
    PMNAME   : array [1..50] of char; 
    STD      : array [1..50] of char; 
    DANWI    : array [1..5] of char; 
    PCODE    : array [1..5] of char; 
    QTY      : integer; 
  end; 

  // 사용 : 캐스팅 배출 실적처리(40100)
type
  TPALLETINFO = packed record
    BOXSEQ   : array [1..13] of char;  // 파렛번호
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    PLINE    : array [1..5] of char;   // 조립라인
  end;

// 사용 : 캐스팅 배출 실적처리(40100)
type
  TCASTINGUNLIST = packed record
    PALLET1  : array [1..13] of char;  // 캐스팅파렛
    PALLET   : array [1..6] of char;   // 캐스팅파렛(바코드)
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    CBOXNO   : array [1..13] of char;  // BOX NO
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
    ITEMCODE : array [1..20] of char;  // 품번
  end;

// 사용 : 1차권선실적조회(50020),2차권선실적조회(50030),아크용접실적조회(50040), 리워크현황(50620)
type
  TINSERTPINLIST2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    PREBOX   : array [1..13] of char;  // BOX NO
    IRUM     : array [1..20] of char;  // 작업자      
end;

// 사용 : 로테이팅실적조회(50010)
type
  TROTATINGLST = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    IRUM     : array [1..20] of char;  // 작업자    
end;

// 사용 : 조립실적조회(50050)
type
  TJOLIPINLIST2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    ENDCHK   : char;                   // 투입여부
    IRUM     : array [1..20] of char;  // 작업자
end;

// 사용 : 공정자재재고현황_단가(10870)
type
  TGONGJUNGJGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 입고고
    QTY3     : double;                 // 출고
    QTY4     : double;                 // 조정
  end;

// 사용 : 개인별 부여시간조회(50000)
type
  TBOOYOINLIST = packed record
    PLINE  : array [1..5] of char;   // 라인
    HONM   : array [1..20] of char;  // 공정
    SILJA  : array [1..10] of char;  // 시작일자
    SSIGAN : array [1..8] of char;   // 시작시간
    EILJA  : array [1..10] of char;  // 종료일자
    ESIGAN : array [1..8] of char;   // 종료시간
    IRUM   : array [1..20] of char;  // 이름
    IDNO   : integer;                // IDNO
  end;
  
// 사용 : 사번_사람찾기(00301) 
type 
  TSUSERSEARCH= packed record 
    SABUN : array [1..8] of char; // 사번 
    IRUM  : array [1..20] of char; // 이름
  end;

// 사용 : 캐스팅 라인 불러오기(50590)
type
  THCastLine = packed record
    PLINE  : array [1..5] of char;   // 라인명
end;

// 사용 : 검사마킹 잔량등록현황 (10990)
type
  TGUMMAJAN = packed record
    PLINE : array [1..5] of char;    // 라인
    ILJA  : array [1..10] of char;   // 일자
    SIGAN : array [1..8] of char;    // 시간
    JQTY  : integer;                 // 생산수량
    IRUM  : array [1..20] of char;   // 이름
end;

// 사용 : 공정별 목표PPM 관리(30110)
type
  TDSPAIMPPM = packed record
    YM     : array [1..7] of char;  // 년월
    PCODE  : array [1..5] of char;  // 공정
    APPM   : integer;               // 목표PPM
end;

// 사용 : 공정라인별 PPM현황 (33250)
type
  TAIMRBQTY = packed record
    PLINE    : array [1..5] of char;    // 라인
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
    APPM     : integer;                 // PPM
end;

// 사용 : 캐스팅NO(LOTNO) 조회(33260)
type 
  TDSPCASTLOTNO = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // CASTNO
    LOTNO    : array [1..15] of char;  // LOTNO
  end;

// 사용 : 자재라벨 분리(10130)
type
  TSPTJAJAEREPRT = packed record
    PMNAME    : array [1..50] of char;  // 품목명
    STD       : array [1..50] of char;  // 규격
    ILJA      : array [1..10] of char;  // 입고일자
    SPLSN     : array [1..20] of char;  // 업체S/N(업체LOT)
    QTY       : integer;                // 입고수량
    YURASN    : array [1..10] of char;  // S/N
    SIGAN     : array [1..8] of char;   // 시간
    ITEMCODE  : array [1..20] of char;  // 품번
    DANWI     : array [1..5] of char;  // 단위
  end;
    
// 사용 : 자재라벨 분리(10130)
type
  TSPTPRINT = packed record
    YURASN    : array [1..10] of char;  // S/N
    QTY       : integer;                // 입고수량
  end;

// 사용 : 반제품재고현황(10880)
type
  THGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : int64;                 // 이월재고
    QTY2     : int64;                 // 생산입고
    QTY3     : int64;                 // 리워크입고
    QTY4     : int64;                 // 생산출고
    QTY5     : int64;                 // 불량출고
    QTY6     : int64;                 // 샘플출고
    QTY7     : int64;                 // 자주(시료)출고
    QTY8     : int64;                 // 조정
end;

// 사용 : 반제품재고현황(11290)
type
  TSUMGONGJUNGJG = packed record
    PNAME    : array [1..40] of char; // 공정설명
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 생산입고
    QTY3     : double;                 // 리워크입고
    QTY4     : double;                 // 생산출고
    QTY5     : double;                 // 불량출고
    QTY6     : double;                 // 샘플출고
    QTY7     : double;                 // 자주(시료)출고
    QTY8     : double;                 // 폐기
    QTY9     : double;                 // 반품
    QTY10    : double;                 // 시스템재고
    QTY11    : double;                 // 실사재고
    QTY12    : double;                 // 조정(차이)
    QTY13    : double;                 // 재생
    QTY14    : double;                 // LOSS
end;

// 사용 : 반제품재고현황(11310)
type
  TSMYGONGJUNGJG = packed record
    PNAME    : array [1..40] of char; // 공정설명
    YURACODE : array [1..3] of char;  // 자재코드
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 생산입고
    QTY3     : double;                 // 리워크입고
    QTY4     : double;                 // 생산출고
    QTY5     : double;                 // 불량출고
    QTY6     : double;                 // 샘플출고
    QTY7     : double;                 // 자주(시료)출고
    QTY8     : double;                 // 폐기
    QTY9     : double;                 // 반품
    QTY10    : double;                // 시스템재고
    QTY11    : double;                // 실사재고
    QTY12    : double;                // 조정(차이)
    QTY13    : double;                // 재생
    QTY14    : double;                // LOSS

end;

// 사용 : 반제품재고현황(10880)
type
  THGONGJUNGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 생산입고
    QTY3     : double;                 // 리워크입고
    QTY4     : double;                 // 생산출고
    QTY5     : double;                 // 불량출고
    QTY6     : double;                 // 샘플출고
    QTY7     : double;                 // 자주(시료)출고
    QTY8     : double;                 // 조정
end;

// 사용 : 자재수불부(11250)
type
  TJAJAERDLIST = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY1     : int64;                   // 이월재고
    QTY2     : integer;                 // 구매입고
    QTY10     : integer;                // 계정대체입고
    QTY11     : integer;                // 공정반품입고
    QTY3     : integer;                 // 생산출고
    QTY4     : integer;                 // 판매출고
    QTY5     : integer;                 // 외주출고
    QTY6     : integer;                 // 샘플출고
    QTY7     : integer;                 // 전환출고
    QTY8     : integer;                 // 반품출고
    QTY9     : integer;                 // 조정출고
end;

// 사용 : 제품수불부(70670)
type
  TPRODRDLIST = packed record
    YURACODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY1     : integer;               // 이월재고
    QTY2     : integer;               // 생산입고
    QTY3     : integer;               // 전환입고
    QTY4     : integer;               // 대체입고
    QTY5     : integer;               // 반품입고
    QTY6     : integer;               // 판매출고
    QTY7     : integer;               // 전환출고
    QTY8     : integer;               // 고객샘플출고
    QTY9     : integer;               // 조정출고
    QTY10    : integer;               // 1달치 판매출고수량
    QTY11    : integer;               // 일자
    QTY12    : integer;               // 사내샘플출고
end;

// 사용 : 제품수불부(70670)
type
  TPRODRDLIST2 = packed record
    YURACODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY1     : Double;                // 이월재고
    QTY2     : Double;                // 생산입고
    QTY3     : Double;                // 전환입고
    QTY4     : Double;                // 대체입고
    QTY5     : Double;                // 반품입고
    QTY6     : Double;                // 판매출고
    QTY7     : Double;                // 전환출고
    QTY8     : Double;                // 고객샘플출고
    QTY9     : Double;                // 조정출고
    QTY10    : Double;                // 1달치 판매출고수량
    QTY11    : integer;               // 일자
    QTY12    : Double;               // 사내샘플출고
end;

// 사용 : 제품수불부(저장위치별)(70710)
type
  TPRODRDLIST3 = packed record
    YURACODE : array [1..20] of char; // 품목코드
    STD      : array [1..50] of char; // 규격명 
    SLCODE   : array [1.. 4] of char; // 저장위치 코드
    SLNAME   : array [1..50] of char; // 저장위치명
    DANWI    : array [1..5] of char;  // 단위
    QTY1     : integer;               // 이월재고
    QTY2     : integer;               // 생산입고
    QTY3     : integer;               // 전환입고
    QTY4     : integer;               // 대체입고
    QTY5     : integer;               // 반품입고
    QTY6     : integer;               // 판매출고
    QTY7     : integer;               // 전환출고
    QTY8     : integer;               // 고객샘플출고
    QTY9     : integer;               // 조정출고
    QTY10    : integer;               // 1달치 판매출고수량
    QTY11    : integer;               // 일자
    QTY12    : integer;               // 사내샘플출고
end;  

// 사용 : 제품수불부(저장위치별)(70710)
type
  TPRODRDLIST4 = packed record
    YURACODE : array [1..20] of char; // 품목코드
    STD      : array [1..50] of char; // 규격명
    SLCODE   : array [1.. 4] of char; // 저장위치 코드
    SLNAME   : array [1..50] of char; // 저장위치명
    DANWI    : array [1.. 5] of char; // 단위
    QTY1     : Double;                // 이월재고
    QTY2     : Double;                // 생산입고
    QTY3     : Double;                // 전환입고
    QTY4     : Double;                // 대체입고
    QTY5     : Double;                // 반품입고
    QTY6     : Double;                // 판매출고
    QTY7     : Double;                // 전환출고
    QTY8     : Double;                // 고객샘플출고
    QTY9     : Double;                // 조정출고
    QTY10    : Double;                // 1달치 판매출고수량
    QTY11    : integer;               // 일자
    QTY12    : Double;               // 사내샘플출고
end;

// 사용 : 제품수불부(70670)
type
  TPRODCHSUM = packed record
    QTY1    : Double;                 // 1달치 판매출고수량
    QTY2    : integer;                 // 일자
end;

// 사용 : 기간별 캐스팅NO 성능불량현황(33270)
type
  TCASTQCSDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량계
    QTY1     : integer;               //
    QTY2     : integer;               //
    QTY3     : integer;               //
    QTY4     : integer;               //
    QTY5     : integer;               //
    QTY6     : integer;               //
    QTY7     : integer;               //
    QTY8     : integer;               //
    VQTY     : integer;               //
    JOLINE   : array [1..5] of char;  // 조립라인
    GUMLINE  : array [1..6] of char;  // 검사라인
    NTF      : integer;               //
    BIGO     : array [1..400] of char;  // 비고
    PBIGO    : array [1..400] of char;  // 비고
end;

// 사용 : 권선수동실적처리(40020) 외..
type
  TVIEWPIN = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
  end;

// 사용 : 수동조립투입처리(40040)
type
  TARCWELDING = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 양품수량
    BOXNO    : array [1..13] of char;  // 아크용접 BOX NO
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
  end;

// 사용 : 자재입고 상세정보 등록(11010)
type
  TJAJAEIIPDESC = packed record
    IPDATE   : array [1..10] of char; // 입고일자
    SPLCODE  : array [1..10] of char;  // 업체코드
    YURACODE : array [1..20] of char; // 자재코드
    SPLSN    : array [1..20] of char;  // 업체S/N(업체LOT)
    WHLOC    : array [1..10] of char;  //  LOCATION
    QTY      : integer;               // 입고수량
    REMARK   : array [1..100] of char; // REMARK    
    SLCODE   : array [1..4] of char;  // 저장위치 코드
end;

// 사용 : 공정자재 반품현황(50650)
type
  TJAJAECHGHIS = packed record
    ILJA     : array [1..10] of char;
    YURASN   : array [1..10] of char;  // 자재바코드
    YURACODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 반출수량
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 이름
  end;

// 사용 : 반품 입고처리(70310)
type
  TJPBANIP = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    PQTY     : integer;                // 적입수량
    BOXNO    : array [1..10] of char;  // 박스바코드
    LOTNO    : array [1..10] of char;  // LOTNO    
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
    SETQTY   : double;                 // SET수량
    SLCODE   : array [1..4] of char;   // 저장위치
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 제품품목전환처리(70330)
type
  TCHGCHLGOSCAN = packed record
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 입고수량
    CASTNO   : array [1..10] of char; // 캐스팅번호
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
  end;

// 사용 : 제품품목전환처리(70330)
type
  TCHGCHLGOSCANL = packed record
    BOXNO    : array [1..10] of char; // 박스바코드
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 입고수량
    CASTNO   : array [1..10] of char; // 캐스팅번호
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
    SABUN    : array [1..10] of char; // 입고자
  end;

// 사용 : 자재라벨 재발행(10120)
type
  TJAJAEREPRT = packed record   
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME    : array [1..50] of char;  // 품목명
    STD       : array [1..50] of char;  // 규격
    ILJA      : array [1..10] of char;  // 입고일자
    SPLSN     : array [1..20] of char;  // 업체S/N(업체LOT)
    QTY       : integer;                // 입고수량
    YURASN    : array [1..10] of char;  // S/N
    KEYNUMBER : array [1..10] of char;  // 대표바코드
    SIGAN     : array [1..8] of char;   // 시간
    DANWI     : array [1..5] of char;   // 단위
  end;

// 사용 : 권선수동실적처리(40020)
type
  TKWONSUN = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    BOXNO    : array [1..13] of char;  // BOX NO
    PINBOX   : array [1..13] of char;  // 로테이팅 BOX NO
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
  end;

// 사용 : 캐스팅 불량유형별 현황 (33310)
type
  TCASTBADQTY = packed record
    RQTY     : integer;                 // 생산수량
    PQCCODE  : array [1..8] of char;    // 불량코드
    PQCNAME  : array [1..50] of char;   // 불량코드명
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 자재입하등록(10100)
type
  TDANWIList = Packed Record
    YURACODE : array [1..20] of char; // 자재코드
    DANWI    : array [1..5] of char;  // 단위
  end;

// 사용 : 업체별 특채승인 정보(30310)
type 
  TJAJAETUKINFO = packed record
    SPLCODE  : array [1..10] of char;   // 업체코드 
    BPNAME   : array [1..40] of char;  // 업체명 
    YURACODE : array [1..20] of char;  // 자재코드 
    PMNAME   : array [1..50] of char;  // 품목명 
    STD      : array [1..50] of char;  // 규격 
    DANWI    : array [1..5] of char;   // 단위 
    ILJA     : array [1..10] of char;  // 특채승인일자
    QTY      : integer;                // 특채수량
    DCHK     : char;
end;

// 사용 : 자주검사 공정코드(00510) 
type 
  THJAJOOPCodeList = packed record 
    PCODE  : array [1..5] of char;  // 공정코드  
    PNAME  : array [1..40] of char; // 공정명  
end;

// 사용 : 관리상하한값 관리(30120)
type
  TJAJOOHANGMOK = packed record
    HANGMOK  : array [1..60] of char; // 공정명
end;

// 사용 : 비가동신고(00410)
type  
  TLINEINFO2 = packed record
    PLINE  : array [1..5] of char;   // 라인명
    PCODE  : array [1..5] of char;   // 공정코드
    HONM   : array [1..20] of char;  // 설명
end;

// 사용 : 비가동신고(00410)
type
  TMAGROUPLIST = packed record
    HOGI  : array [1..5] of char;
    MHOGI : array [1..200] of char;
end;

// 사용 : 비가동신고(00410)
type
  THNOOPCODE = packed record
    LCODE   : array [1..2] of char;   // 코드종류(01.고장현상코드, 02.고장원인코드, 03.고장내용코드)
    CODE    : array [1..5] of char;   // 코드
    NAEYONG : array [1..50] of char;  // 내용
end;

// 사용 : 비가동신고(00410)
type
  TBIGADONGLIST = packed record
    IDNO      : integer;               // IDNO
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    GBN       : char;                  // 비가동구분
    JCODE     : array [1..5] of char;  // 세부내역코드
    PLINE     : array [1..5] of char;  // 라인
    HONM      : array [1..20] of char; // 라인설명
  end;
  
// 사용 : 관리상하한값 관리(30120)
type
  TULCLVAL = packed record
    YM       : array [1..7] of char;   // 공정코드
    PCODE    : array [1..5] of char;   // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 공정라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    HANGMOK  : array [1..60] of char;  // 항목
    USLX     : double;                 // 범위상한
    LSLX     : double;                 // 범위하한
    UCLX     : double;                 // 범위상한
    LCLX     : double;                 // 범위하한
    UCLR     : double;                 // 범위하한
end;

// 사용 : 관리상하한값 관리(30120)
type
  TNOINSPEC = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    REMARK   : array [1..200] of char;  // 규격명
end;

// 사용 : 비가동현황(50330)
type
  TBIGADONGLIST2 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    CR_NAE    : array [1..80] of char; // 처리내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
  end;

  // 사용 : 고정스캐너로그조회(59000)
type
  TSCANLOGLIST = packed record
    HOGI  : array [1..5] of char;   // 호기
    HONM  : array [1..20] of char;  // 라인설명
    GBN   : array [1..20] of char;  // 자재바코드
    MYLOG : array [1..100] of char; // 품번
    ILJA  : array [1..10] of char;  // 일자    
    SIGAN : array [1..8] of char;   // 시간
  end;

  // 사용 : [20310] Bom정전개
type
  TBOMEXPAND = packed record
    NLEV     : integer;                // 창고명
    CD_CHILD : array [1..20] of char;  // 품목
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    NO_LEVEL : array [1..255] of char;
    SILQTY   : double;                 // 실소요량
end;

// 사용 : 재공 자재산출(10881)
type
  TJAEGONGCHG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY1      : double;                // 이월재고
    QTY2      : double;
    QTY3      : double;
    DSUM      : double;
  end;

// 사용 : 반제품 샘플 출고처리(40820)
type
  TVIEWBOXLIST = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 박스에 담긴 날짜
end;

// 사용 : 자주검사 및 시료출고(40830)
type
  TJAJOOCODELIST = packed record
    HANGMOK : array [1..60] of char;  // 항목
    JTOOIP  : char;                   // 재투입 여부 (0: 폐기, 1: 재투입)
    MAXDATA : double;                 // MAX
    MINDATA : double;                 // MIN
    SIRYO   : integer;                // 시료수
    BIGO    : array [1..50] of char;  // 비고
end;

// 사용 : 자주검사및시료출고(40830)
type
  TITEMLIST = packed record
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
end;

// 사용 : 캐스팅NO별 NTF등록(33450)
type
  TCASTNTF = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    PV_QTY  : integer;                // 수량
    UT_QTY  : integer;                // 수량
    HV_QTY  : integer;                // 수량
    MC_QTY  : integer;                // 수량
    IB_QTY  : integer;                // 수량
    R1_QTY  : integer;                // 수량
    R2_QTY  : integer;                // 수량
    ETC_QTY : integer;                // 수량
    REMARK  : array [1..100] of char;  // 기타
  end;

  // 사용 : v2검사실적처리(40300)
type
  TGUMMALIST2 = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    BOXNO    : array [1..13] of char;  // BOX NO
    SEQ      : integer;                // 검사횟수
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    SIGAN    : array [1..8] of char;   // 시간
    SABUN    : array [1..10] of char;  // 등록자
  end;

// 사용 : 공정자재반품(11350) 
type 
  TRTNJAJAEPRT = packed record
    NEWYRSN   : array [1..10] of char;  // 신규S/N 
    YURACODE  : array [1..20] of char;  // 품번 
    PMNAME    : array [1..50] of char;  // 품목명 
    STD       : array [1..50] of char;  // 규격
    SPLSN     : array [1..20] of char;  // 업체S/N(업체LOT)
    QTY       : integer;                // 입고수량
    DANWI     : array [1..5] of char;   // 단위
    YURASN    : array [1..50] of char;  // 원본S/N
    FRSLCODE  : array [1..10] of char;  // From 저장위치
    TOSLCODE  : array [1..4] of char;   // TO 저장위치
  end;

// 사용 : 반제품 폐기 출고처리(40890)
type
  TVIEWDISUSE = packed record
    PCODE    : array [1..5] of char;   // 공정
    PNAME    : array [1..40] of char;  // 공정설명
    PLINE    : array [1..5] of char;   // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    ILJA     : array [1..10] of char;  // 박스에 담긴 날짜
end;

// 사용 : 공정별 재생품 등록(40550)
type
  TRECYCLEM = packed record
    REGNO    : array [1..12] of char;  //
    CYCDT    : array [1..10] of char;  //
    PCODE    : array [1..5] of char;   //
    PLINE    : array [1..5] of char;   //
    ITEMCODE : array [1..20] of char;  //
    PMNAME   : array [1..50] of char;  //
    STD      : array [1..50] of char;  //
    REMARK   : array [1..100] of char;  //
    REGDT    : array [1..10] of char;  //
    IRUM     : array [1..20] of char;  //
end;

// 사용 : 반제품 샘플출고 현황(11360)
type
  TME_JAJAESPL = packed record
    ILJA     : array [1..10] of char;  // 일자
    TNAME    : array [1..50] of char;  // 출고처
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SQTY     : integer;                // 신청수량
    CQTY     : integer;                // 출고수량
    REMARK   : array [1..50] of char;  // 내용
    IRUM     : array [1..20] of char;  // 출고자
end;

// 사용 : 자주검사 항목관리(33380)
type
  TMSPRODTRACE = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 공정라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // 박스번호
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 처리자
    JUYA     : char;                   // 주야
end;

// 사용 : 포장 재발행(40530)
type
  TREPOJANG = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 규격명
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    ZONE     : array [1..15] of char;  // 지역
    CAR      : array [1..15] of char;  // 차종
    JANGSO   : array [1..14] of char;  // 납품장소
    DANWI    : array [1..5] of char;   // 단위
    PQTY     : integer;                // 적입수량
    LCOL     : array [1..10] of char;  // 라벨색상
    MARK     : array [1..10] of char;  // 각인
    LTYPE    : char;                   // 라벨타입
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // 고객구분
    QTY      : double;                 // set 수량
    BOXNO    : array [1..10] of char;  // BOXNO
    LOTNO    : array [1..10] of char;  // BOXNO
end;

// 사용 : 공급Loss 코드관리(00430), 40570 사용
type
  TLossCode = packed record
    LCODE  : array [1..5] of char;  // 업체코드
    LNAME  : array [1..30] of char; // 업체명
end;

// 사용 : 개인별 부여시간수정(00210)
type
  TBOOYOINLIST3 = packed record
    ILJA   : array [1..10] of char;  // 일자
    PLINE  : array [1..5] of char;   // 라인
    PCODE  : array [1..5] of char;   // 공정
    HOGI   : array [1..5] of char;   // 호기
    HONM   : array [1..20] of char;  // 공정설명
    JBTIME : integer;                // 부여시간
    JUYA   : char;                   // 주야
  end;

// 사용 : 캐스팅NO별 용의설정 현황(33340)
type
  TCASTYOUNG = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    ITEMCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    SDATE    : array [1..10] of char; // 발생일
    SSIGAN   : array [1.. 8] of char; // 발생시간
    EDATE    : array [1..10] of char; // 해제일
    ESIGAN   : array [1.. 8] of char; // 해제시간
    REASON   : array [1..50] of char; // 사유
    REMARK   : array [1..50] of char; // 비고
end;

 
// 사용 : 자재입하등록용 자재발주리스트(10100) 
type 
  TMS_DOINFO = Packed Record
    OCM_NO   : array [1..10] of char; // 발주번호
    DOSEQ    : integer;               // 순번
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품목명
    DANWI    : array [1..5] of char;  // 환산단위
    DOQTY    : integer;               // 환산수량
    IPQTY    : integer;               // 입고수량
  end;
  
 // 사용 : 자재마스터일부(10100) 
type 
  TMS_DOINFOLST = Packed Record
    YURACODE : array [1..20] of char; // 자재코드 
    STD      : array [1..50] of char; // 규격 
    PMNAME   : array [1..50] of char; // 품목명 
    PACKQTY  : integer;               // 자재포장 단위 수량
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 입고된수량
    BPCODE   : array [1..10] of char; // 업체코드
    BPNAME   : array [1..40] of char; // 업체명
    DOQTY    : integer;               // 납품서수량
    SPLSN    : array [1..20] of char; // 입고로트
    SLCODE   : array [1..4] of char;  // 입고저장위치
  end;

// 사용 : 계정대체 입고(10140) 
type 
  TMS_JAJAEINFO = Packed Record 
    YURACODE : array [1..20] of char; // 자재코드 
    STD      : array [1..50] of char; // 규격  
    PMNAME   : array [1..50] of char; // 품목명  
    PACKQTY  : integer;               // 자재포장 단위 수량  
    DANWI    : array [1..5] of char;  // 단위 
  end;

// 사용 : 포장실적처리(40510) 
type 
  TNEWPOJANGJOB = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    STD      : array [1..50] of char;  // 규격명 
    ITEMNM   : array [1..30] of char;  // 부품명 
    PQTY     : integer;                // 적입수량 
    BOXNO    : array [1..10] of char;  // 박스바코드 
    CASTNO1  : array [1..10] of char;  // 캐스팅번호 
    QTY1     : integer; 
    CASTNO2  : array [1..10] of char;  // 캐스팅번호 
    QTY2     : integer; 
    LOTNO    : array [1..10] of char;  // LOTNO 
    SIGAN    : array [1..8] of char;   // 시간 
    SABUN    : array [1..10] of char;  // 등록자 
    SETQTY   : integer;                // SET수량 
    SLCODE   : array [1..4] of char;   // 저장위치 
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 포장실적처리(40510)
type 
  TMS_POJANG = packed record 
    ITEMCODE : array [1..20] of char;  // 품번 
    STD      : array [1..50] of char;  // 규격명 
    ITEMNM   : array [1..50] of char;  // 품목명 
    SLCODE   : array [1..4] of char;   // 저장위치 
    SLNAME   : array [1..50] of char;  // 저장위치명 
end;


// ============================================ 이동희   DLEHDGML

// 사용 : 납품서 정보조회 (11610)
type
  TDH_DOINFOLIST = packed record
    DONO     : array [1..10] of char;    // 납품서번호
    DOSEQ    : integer;                  // 순번
    YURACODE : array [1..20] of char;    // 자재코드
    PMNAME   : array [1..50] of char;    // 품목명
    STD      : array [1..50] of char;    // 규격명
    SLCODE   : array [1.. 4] of char;    // 저장위치
    SLNAME   : array [1..50] of char;    // 저장위치명
    QTY      : double;                   // 수량
    DANWI    : array [1.. 5] of char;    // 단위
    SPLSN    : array [1..20] of char;    // 입고로트
    BPCODE   : array [1..10] of char;    // 공급업체
    BPNAME   : array [1..40] of char;    // 공급업체명
    DT_REG   : array [1..19] of char;    // 납품일시
end;

// 사용 : 부산물 코드관리(00440)
type
  TBYPRODUCT = packed record
    BPCODE  : array [1..20] of char;  // 부산물코드
    BPNAME  : array [1..40] of char;  // 부산물
    DANWI   : array [1..5]  of char;  // 단위
end;

// 사용 : 반제품 샘플출고 코드관리(00500)
type
  THWIPSCODE = packed record
    CODE    : array [1.. 5] of char;  // 코드
    NAEYONG : array [1..50] of char;  // 코드명
end;

// 사용 : 공정별라인정보(20200) 
type 
  TCJaegbn = packed record 
    ITEMGB  : array [1..2] of char;  // 제품구분 (20102테스트 11.10.18) 
    NAEYONG : array [1..20] of char; 
end;

// 사용 : 메신저보내기(98120)
type
  TMESSENGER = packed record
    HOGI  : array [1..5] of char;   // 호기
    HONM  : array [1..20] of char;  // 라인설명
  end;

// 사용 : TOOL 구입처 관리(60010)
type
  THTOOLBPCode = packed record
    BPCODE  : array [1..8] of char;  // 업체코드
    BPNAME  : array [1..40] of char; // 업체명
end;

// 사용 : TOOL입고 등록 마스터(60200)
type
  THIPGOREGMST = packed record
    IPGONO    : array [1..12] of char; // 입고번호
    IPGODT    : array [1..10] of char; // 입고일자
    PCODE     : array [1..5] of char;  // 구입처코드
    PNAME     : array [1..40] of char; // 구입처명
    REGDT     : array [1..10] of char; // 등록일자(의뢰일자)
    IRUM      : array [1..20] of char; // 등록자(의뢰자)
    REMARK    : array [1..60] of char; // REMARK
end;

// 사용 : TOOL교체내역(60400)
type
  THCHANGELIST = packed record
    HOGI      : array [1..26] of char; // 출고호기
    TOOLCODE  : array [1..20] of char; // 품목코드
    PNAME     : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
    CHGONO    : array [1..12] of char; // 출고번호
    CHQTY     : integer;               // 출고수량
    ILJA      : array [1..10] of char; // 출고일자
    SIGAN     : array [1..8] of char;  // 출고시간
    CH_ILJA   : array [1..10] of char; // 교체일자
    CH_SIGAN  : array [1..8] of char;  // 교체시간
    REMARK    : array [1..60] of char; // REMARK
end;

// 사용 : TOOL 점검/교체 메모등록 (60700)
type
  TTOOLMEMO = packed record
    IDNO     : integer;                      // key값
    CHGONO   : array [1..12] of char;        // 출고번호
    TOOLCODE : array [1..20] of char;        // 품목코드
    GGBN     : char;                         // 점검여부(0:점검, 1:교체)
    ILJA     : array [1..10] of char;        // 점검일자
    SABUN    : array [1.. 8] of char;        // 등록자
    GUMCODE  : array [1..100] of char;       // 점검내용
    CGBN     : char;                         // 초품검사(0:미검사, 1:검사완료)
    REMARK   : array [1..200] of char;       // REMARK
end;

// 사용 : TOOL 코드관리(60100)
type
  THTOOLCODE = packed record
    TOOLCODE : array [1..20] of char;   // TOOL 코드
    PMNAME   : array [1..50] of char;   // 품명
    STD      : array [1..50] of char;   // 규격명
    DANWI    : array [1.. 5] of char;   // 단위
    LIMIT    : integer;                 // 한계수명
    UPPERSTD : integer;                 // 보유기준(상)
    LOWERSTD : integer;                 // 보유기준(하)
    LOC      : array [1..50] of char;   // 보관위치
    YCHK     : char;                    // 예비품(0: 정상, 1: 예비)
    TOOLRANK : char;                    // Tool랭커
    REMARK   : array [1..60] of char;   // REMARK
end;

// 사용 : TOOL입고 등록 상세내역(60210)
type
  THIPGOREGL = packed record
    TOOLCODE  : array [1..20] of char; // 품목코드
    PNAME     : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
    IPQTY     : integer;               // 입고수량
    REMARK    : array [1..50] of char; // REMARK
end;

// 사용 : TOOL코드 조회(60211)
type
  THTOOLMST = packed record
    TOOLCODE  : array [1..20] of char; // 품목코드
    PMNAME    : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
end;

// 사용 : TOOL출고내역(60300)
type
  THCHGOLIST = packed record
    CHGONO    : array [1..12] of char; // 출고번호
    ILJA      : array [1..10] of char; // 출고일자
    SIGAN     : array [1..8] of char;  // 출고시간
    TOOLCODE  : array [1..20] of char; // 품목코드
    PNAME     : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
    CHQTY     : integer;               // 출고수량
    HOGI      : array [1..26] of char; // 출고호기
    CHSABUN   : array [1..20] of char; // 출고자
    REMARK    : array [1..60] of char; // REMARK
end;

// 사용 : 호기그룹그룹 정보(60310)
type
  THHOGIGROUP = packed record
    HOGI  : array [1..5] of char;  // 호기코드
    HONM  : array [1..20] of char; // 호기이름
end;

// 사용 : TOOL 투입현황 조회 (60510)
type
  THTOOLHOGILIST = packed record
    CHGONO   : array [1..12] of char; //출고번호
    HOGI     : array [1..5] of char;  // 호기코드
    HONM     : array [1..20] of char; // 호기명
    TOOLCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    LIMIT    : integer;               // 한계수명
    QTY      : integer;               // 수량
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
    REMARK   : array [1..60] of char; // 비고
end;

// 사용 : 호기 찾기 (60510)
type
  THHOGILIST = packed record
    HOGI  : array [1..5] of char;  // 호기코드
    HONM  : array [1..20] of char; // 호기명
end;

// 사용 : TOOL 투입현황 조회 (60510)
type
  THTOOLCODELIST = packed record
    TOOLCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    HOGI     : array [1..5] of char;  // 호기코드
    HONM     : array [1..20] of char; // 호기명
    LIMIT    : integer;               // 한계수명
    QTY      : integer;               // 수량
    ILJA     : array [1..10] of char; // 일자
    SIGAN    : array [1..8] of char;  // 시간
    REMARK   : array [1..60] of char; // 비고
end; 

// 사용 : 품목코드찾기(60311)
type
  THPCodeList = packed record
    TOOLCODE  : array [1..20] of char; // TOOL코드
    PMNAME    : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
end;   

// 사용 : TOOL 재고현황 조회 (60530)
type
  THTOOLSTOCKLIST = packed record
    PCODE    : array [1..5] of char;  // 구입처코드
    BPNAME   : array [1..40] of char; // 구입처명
    TOOLCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 수량     
    UPPERSTD : integer;               // 보유기준(상)
    LOWERSTD : integer;               // 보유기준(하)
    YCHK     : char;                  // 예비품(0: 정상, 1: 예비)
    LOC      : array [1..50] of char; // 보관위치 
    TOOLRANK : char;                    // Tool랭커
end;     

// 사용 : 기간별 TOOL 누계수량 조회(60540)
type
  THTOOLSUM_LIST1 = packed record
    TOOLCODE : array [1..20] of char; // 품목코드
    QTY      : integer;               // 수량
    ILJA     : array [1..10] of char; // 일자
end;

// 사용 : 기준일자 최초 누적수량 조회(60540)
type
  THNUJUKQTY = packed record
    QTY      : integer;                // 누적수량
end;   

// 사용 : 출고내역찾기(60541)
type
  THCHGOSMALLLIST = packed record
    CHGONO    : array [1..12] of char; // 출고번호
    HOGI      : array [1..26] of char; // 출고호기
    TOOLCODE  : array [1..20] of char; // TOOL코드
    PMNAME    : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격명
    DANWI     : array [1..5] of char;  // 단위
    CHQTY     : integer;               // 출고수량
    ILJA      : array [1..10] of char; // 출고일자
    SIGAN     : array [1..8] of char;  // 출고시간
end;       

// 사용 : TOOL 입고현황 조회 (60550)
type
  TTOOLIPLIST = packed record
    PCODE    : array [1..5] of char;  // 구입처코드
    BPNAME   : array [1..40] of char; // 구입처명
    TOOLCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 수량
    IPILJA   : array [1..10] of char; // 입고일자
    IRUM     : array [1..20] of char; // 이름
end;  

// 사용 : 기간별 TOOL 출고현황 조회 (60570)
type
  TTOOLIPLIST3 = packed record
    TOOLCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    HOGI     : array [1..5] of char;  // 단위
    HONM     : array [1..20] of char; // 단위
    QTY      : integer;               // 수량
    IPILJA   : array [1..10] of char; // 입고일자
    IRUM     : array [1..20] of char; // 이름
end;     

// 사용 : TOOL 점검/교체 메모등록 (60700)
type
  TTOOLMEMOLIST = packed record
    CHGONO   : array [1..12] of char;        // 출고번호
    TOOLCODE : array [1..20] of char;        // 품목코드
    PMNAME   : array [1..50] of char;        // TOOL명
    GGBN     : char;                         // 점검여부(0:점검, 1:교체)
    ILJA     : array [1..10] of char;        // 점검일자
    SIGAN    : array [1.. 8] of char;        // 점검시간
    IRUM     : array [1..20] of char;        // 등록자
    GUMCODE  : array [1..100] of char;       // 점검내용
    CGBN     : char;                         // 초품검사(0:미검사, 1:검사완료)
    REMARK   : array [1..200] of char;       // REMARK
end;


// 사용 : 자재 메모 등록(10610)
type
  TJAJAEMemo = packed record
    MEMOIDX : array [1..12] of char;  // 인덱스
    SABUN   : array [1..8] of char;   // 사번
    IRUM    : array [1..20] of char;  // 이름
    MEMO    : array [1..200] of char; // 메모
    SIGAN   : array [1..8] of char;   // 시간
end;

// 사용 : 라인별 작업자 메모 현황 (50290)
type
  TJAJAEMemoList = packed record
    ILJA    : array [1..10] of char;  // 등록일자
    SIGAN   : array [1..8] of char;   // 시간
    MEMO    : array [1..200] of char; // 메모
    SABUN   : array [1..8] of char;   // 사번
    IRUM    : array [1..20] of char;  // 이름
end;


// 사용 : 입고 I/F 확정조회(11640)
type
  TDH_IPIFCHKLIST = packed record
    OCM_NO   : array [1..10] of char;  // 발주번호
    DOSEQ    : integer;                // 순번
    SPLCODE  : array [1..10] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드    
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    QTY1     : integer;                // 납품서수량    
    IPILJA   : array [1..10] of char; // 입고일자
  end;

  // 사용 : 저장위치간 이동처리(11620)
type
  TDH_JAJAEMOVE = packed record
    SLCODE    : array [1..4] of char;   // 저장위치 코드
    SLNAME    : array [1..50] of char;  // 저장위치명
    SPLSN     : array [1..20] of char;  // 업체S/N(업체LOT) 
    ITEMCODE  : array [1..20] of char;  // 품번
    QTY       : integer;                // 입고수량 
    DANWI     : array [1..5] of char;   // 단위
    PMNAME    : array [1..50] of char;  // 품목명
    STD       : array [1..50] of char;  // 규격
  end;

// 사용 : 저장위치간 이동처리(11650)
type
  TDH_JAJAEMOVELIST = packed record
    MVNO     : array [1..12] of char;      // 이동번호
    YURASN   : array [1..10] of char;      // YURASN    
    YURACODE : array [1..20] of char;      // 자재코드
    PMNAME   : array [1..50] of char;      // 품목명
    STD      : array [1..50] of char;      // 규격명
    FSLCODE  : array [1.. 4] of char;      // FROM 위치
    FSLNAME  : array [1..50] of char;      // FROM 위치명
    TSLCODE  : array [1.. 4] of char;      // TO 위치
    TSLNAME  : array [1..50] of char;      // TO 위치명
    QTY      : integer;                    // 수량
    DANWI    : array [1.. 5] of char;      // 단위
    SPLSN    : array [1..20] of char;      // 입고로트
    MV_DATE  : array [1..10] of char;      // 이동일자
    MV_TIME  : array [1.. 8] of char;      // 이동시간
    IRUM     : array [1..20] of char;      // 이동처리자
end;

// 사용 : 제품 이동처리 현황(70890)
type
  TDH_PRODMOVELIST = packed record
    MVNO     : array [1..12] of char;      // 이동번호
    BOXNO    : array [1..10] of char;      // 박스번호
    ITEMCODE : array [1..20] of char;      // 품목코드
    PMNAME   : array [1..50] of char;      // 품목명
    STD      : array [1..50] of char;      // 규격명
    FSLCODE  : array [1.. 4] of char;      // FROM 위치
    FSLNAME  : array [1..50] of char;      // FROM 위치명
    TSLCODE  : array [1.. 4] of char;      // TO 위치
    TSLNAME  : array [1..50] of char;      // TO 위치명
    QTY      : integer;                    // 수량
    DANWI    : array [1.. 5] of char;      // 단위
    LOTNO    : array [1..10] of char;      // 로트
    MV_DATE  : array [1..10] of char;      // 이동일자
    MV_TIME  : array [1.. 8] of char;      // 이동시간
    IRUM     : array [1..20] of char;      // 이동처리자
end;

// 사용 : 기간별계정대체입고현황(업체SN포함)(10950)
type
  TDH_JAJAJAELIST = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    WHNAME   : array [1..40] of char;  // 창고명
    WHLOC    : array [1..10] of char;  // LOCATION
    SPLCODE  : array [1..10] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SPLSN    : array [1..20] of char;  // 업체S/N
    QTY      : integer;                // 입고수량
    FSTSLOC  : array [1..4] of char;   // 저장위치
    FSLNAME  : array [1..50] of char;  // 위치명
end;

// 사용 : LOC별 재고현황(11120)
type
  TDH_LOCJAJAELIST = packed record
    YURACODE : array [1..20] of char;  // 자재코드
    ILJA     : array [1..10] of char;  // 입하일자
    QTY      : integer;                // 입하수량
  end;

// 사용 : 창고별 Loc재고현황(11300)
type
  TDH_JAJAEWHLIST3 = packed record
    WHCODE   : array [1..8] of char;  // 창고코드 
    WHNAME   : array [1..40] of char; // 창고명
    WHLOC    : array [1..10] of char; // LOCATION      
    YURACODE : array [1..20] of char; // 자재코드
    IPDATE   : array [1..10] of char; // 입하일자
    BPCODE   : array [1..40] of char;
    SPLSN    : array [1..20] of char; // 업체SN(LOT)
    PMNAME   : array [1..50] of char; // 품명 
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 입하수량  
    FSTSLOC  : array [1..4] of char;  // 저장위치
    FSLNAME  : array [1..50] of char; // 위치명
  end;  

// 사용 : 창고별 Loc재고현황(11300)
type
  TDH_JAJAEWHLIST4 = packed record
    WHCODE   : array [1..8] of char;  // 창고코드 
    WHNAME   : array [1..40] of char; // 창고명
    WHLOC    : array [1..10] of char; // LOCATION      
    YURACODE : array [1..20] of char; // 자재코드
    IPDATE   : array [1..10] of char; // 입하일자
    BPCODE   : array [1..40] of char;
    SPLSN    : array [1..20] of char; // 업체SN(LOT)
    PMNAME   : array [1..50] of char; // 품명 
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 입하수량
  end;

// 사용 : 자재코드별 창고재고(11110)
type
  TDH_JAJAEWHLIST = packed record
    WHCODE : array [1..8] of char;  // 창고코드
    WHNAME : array [1..40] of char; // 창고명
    QTY    : integer;               // 입하수량
  end;


// 사용 : 호기별자재투입현황(50070)
type
  TDH_JAJAETOIPLIST = packed record
    ILJA     : array [1..10] of char;  //    일자
    YURASN   : array [1..10] of char;  //    바코드
    BARSN    : array [1..50] of char;  //    업체바코드
    YURACODE : array [1..20] of char;  //    품번
    PMNAME   : array [1..50] of char;  //    품목명
    STD      : array [1..50] of char;  //    규격
    QTY      : integer;                //    수량
    SIGAN    : array [1..8] of char;   //    투입시간
    BPNAME   : array [1..40] of char;  //    업체명
    SPLSN    : array [1..20] of char;  //    업체LOT
    IPDATE   : array [1..10] of char;  //    입고일
    DANWI    : array [1..5] of char;   //    단위
  end;

  // 사용 : 라인별 작업자 메모 등록(40850)
type
  TDH_LineMemo = packed record
    MEMOIDX : array [1..12] of char;  // 인덱스
    HOGINM  : array [1..26] of char;  // 호기.호기명
    SABUN   : array [1..8] of char;   // 사번
    IRUM    : array [1..20] of char;  // 이름
    MEMO    : array [1..200] of char; // 메모
    SIGAN   : array [1..8] of char;   // 시간
end;

  // 사용 : 라인별 작업자 메모 현황(50290)
type
  TDH_LineMemoList = packed record
    ILJA    : array [1..10] of char;   // 일자
    SIGAN   : array [1..8] of char;    // 시간
    HOGINM  : array [1..26] of char;   // 호기.호기명
    MEMO    : array [1..200] of char;  // 메모
    SABUN   : array [1..8] of char;    // 사번
    IRUM    : array [1..20] of char;   // 이름
end;

// 사용 : 자재 메모 등록(10610)
type
  TDH_JAJAEMemo = packed record
    MEMOIDX : array [1..12] of char;  // 인덱스
    SABUN   : array [1..8] of char;   // 사번
    IRUM    : array [1..20] of char;  // 이름
    MEMO    : array [1..200] of char; // 메모
    SIGAN   : array [1..8] of char;   // 시간
end;

// 사용 : 라인별 작업자 메모 현황 (50290)
type
  TDH_JAJAEMemoList = packed record
    ILJA    : array [1..10] of char;  // 등록일자
    SIGAN   : array [1..8] of char;   // 시간
    MEMO    : array [1..200] of char; // 메모
    SABUN   : array [1..8] of char;   // 사번
    IRUM    : array [1..20] of char;  // 이름
end;

// 사용 : 로테이팅수동실적처리(40010) 
type
  TINSERTPIN = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    RQTY     : integer;                // 양품수량 
    BQTY     : integer;                // 불량수량 
    BOXNO    : array [1..13] of char;  // BOX NO 
    SIGAN    : array [1..8] of char;   // 시간 
    SABUN    : array [1..10] of char;  // 등록자 
  end; 

// 사용 : 조립박스 변경이력(10980)
type
  TDH_JOBOXCHG = packed record
    FIXEDBOXNO1 : array [1..6] of char;   // 박스바코드
    FIXEDBOXNO2 : array [1..6] of char;   // 품번
    BOXNO       : array [1..13] of char;  // 품명
    ILJA        : array [1..10] of char;  //
    SIGAN       : array [1..8] of char;   //
    YURACODE    : array [1..20] of char;   // 품번
    PMNAME      : array [1..50] of char;   // 품명
    STD         : array [1..50] of char;   // 규격명
    RQTY        : integer;
    IRUM        : array [1..20] of char;  // 이름
    HOGI        : array [1..5] of char;
  end;

// 사용 : 로테이팅실적조회(50010),1차권선실적조회(50020),2차권선실적조회(50030),아크용접실적조회(50040),조립실적조회(50050),캐스팅실적조회(50060),검마실적조회(50080),V2검사실적조회(50090),외관검사실적조회(50300)
type
  TDH_INSERTPINLIST3 = packed record
//    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
end;

// 사용 : 검사마킹 투입 상세조회(50570)
type
  TDH_GUMMALIST2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    IRUM     : array [1..20] of char;
end;

// 사용 : 개인별 부여시간조회(50000)
type
  TDH_BOOYOINLIST = packed record
    PLINE  : array [1..5] of char;   // 라인
    HONM   : array [1..20] of char;  // 공정
    SILJA  : array [1..10] of char;  // 시작일자
    SSIGAN : array [1..8] of char;   // 시작시간
    EILJA  : array [1..10] of char;  // 종료일자
    ESIGAN : array [1..8] of char;   // 종료시간
    IRUM   : array [1..20] of char;  // 이름
    IDNO   : integer;                // IDNO
  end;

// 사용 : 로테이팅실적조회(50010)
type
  TDH_ROTATINGLST = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    IRUM     : array [1..20] of char;  // 작업자
    ENDCHK   : char;                   // 투입여부
end;

// 사용 : 아크용접실적조회(50040), 리워크현황(50620)
type
  TDH_INSERTPINLIST2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    PREBOX   : array [1..13] of char;  // BOX NO
    IRUM     : array [1..20] of char;  // 작업자
end;   

// 사용 : 1차권선실적조회(50020),2차권선실적조회(50030)
type
  TDH_INSERTPINLIST4 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    PREBOX   : array [1..13] of char;  // BOX NO
    IRUM     : array [1..20] of char;  // 작업자  
    ENDCHK   : char;                   // 투입여부
end;

// 사용 : 조립실적조회(50050)
type
  TDH_JOLIPINLIST2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    ENDCHK   : char;                   // 투입여부
    IRUM     : array [1..20] of char;  // 작업자
    PALLET   : array [1..6] of char;  // PALLET
end;

// 사용 : 캐스팅실적조회(50060)
type
  TDH_CASTINGLIST1 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    PALLET   : array [1..6] of char;   // 파렛트번호
    JOLINE   : array [1..5] of char;   // 조립라인
    IRUM     : array [1..20] of char;  // 작업자
    INILJA   : array [1..10] of char;  // 일자
    INSIGAN  : array [1..8] of char;   // 시간
    LT       : integer;
    JBOXNO   : array [1..13] of char;  // BOX NO
end;

  // 사용 : 캐스팅 상세생산현황(50490)
type
  TDH_CAST_SANG_LIST1 = packed record
    STD  : array [1..50] of char; // 규격명
    ILJA : array [1..10] of char; // 일자
    QTY  : double;                // 수량
  end;

    // 사용 : 캐스팅 상세생산현황(50490)
type
  TDH_CAST_SANG_LIST3 = packed record
    STD  : array [1..50] of char; // 규격명
    ILJA : array [1..10] of char; // 일자
    QTY  : integer;               // 수량
  end;

// 사용 : 캐스팅 상세생산현황(50490)
type
  TDH_CAST_SANG_LIST2 = packed record
    ILJA   : array [1..10] of char; // 일자
    RQTY   : integer;               // 양품수량
    JBTIME : integer;               // 부여시간
    GATIME : integer;               // 가동시간
    BITIME : integer;               // 비가동시간
    BQTY   : integer;               // 불량수량
  end;

  // 사용 : 조립 계획대비 실적현황(50520)
type
  TDH_PVSSIL = packed record
    ILJA : array [1..10] of char; // 일자
    LINE : array [1..5] of char;  // 라인
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
  end;

// 사용 : 조립 계획대비 실적현황(50520)
type
  TDH_PVSSIL1 = packed record
    ILJA : array [1..10] of char; // 일자
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
  end;

  // 사용 : 검사마킹 잔량등록현황 (10990)
type
  TDH_GUMMAJAN = packed record
    PLINE : array [1..5] of char;    // 라인
    ILJA  : array [1..10] of char;   // 일자
    SIGAN : array [1..8] of char;    // 시간
    JQTY  : integer;                 // 생산수량
    IRUM  : array [1..20] of char;   // 이름
end;

// 사용 : 라인코드(39000)
type
  TDH_MLineCode = packed record
    LCODE  : array [1..5] of char;  // 라인코드
    LNAME  : array [1..40] of char; // reMARK
end;

// 사용 : 비가동현황(50330)
type
  TDH_BIGADONGLIST2 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    IDNO      : integer;               // IDNO
  end;

// 사용 : 공정코드(20220)
type
  TDH_MPCodeList = packed record
    PCODE  : array [1..5] of char;  // 공정코드
    PNAME  : array [1..40] of char; // 공정명
end;

  // 사용 : 고정스캐너로그조회(59000)
type
  TDH_SCANLOGLIST = packed record
    HOGI  : array [1..5] of char;   // 호기
    HONM  : array [1..20] of char;  // 라인설명
    GBN   : array [1..20] of char;  // 자재바코드
    MYLOG : array [1..100] of char; // 품번
    ILJA  : array [1..10] of char;  // 일자    
    SIGAN : array [1..8] of char;   // 시간
  end;

// 사용 : 포장마스터(70100)
type
  TDH_POJANGMST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    ITEMNM   : array [1..30] of char;  // 부품명
    ZONE     : array [1..15] of char;  // 지역
    CAR      : array [1..15] of char;  // 차종
    JANGSO   : array [1..14] of char;  // 납품장소
    PQTY     : Integer;                // 적입수량
    LCOL     : array [1..10] of char;  // 라벨색상
    MARK     : array [1..10] of char;  // 각인
    LTYPE    : char;                   // 라벨타입
    HEAD     : char;                   // 앞문자
    CGBN     : char;                   // 고객구분 
    YN       : char;                   // 사용여부
    SLCODE	 : array [1.. 4] of char;  // 저장위치
    SLNAME	 : array [1..50] of char;  // 저장위치명
end;

// 사용 : 공정자재 실사현황(10960)
type
  TDH_GONGJAJAESIL = packed record
    YURASN   : array [1..20] of char;  // 자재바코드
    YURACODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입하수량
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 이름
    PCODE  : array [1..5] of char;     // 공정코드
  end;

// 사용 : 공정별불량현황조회(33110)
type
  TDH_QLT_B_LIST2 = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;

// 사용 : 공정별불량현황조회(33110)
type
  TDH_QLT_B_LIST = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    ILJA     : array [1..10] of char;  // 작업일자
    SIGAN    : array [1..8] of char;   // 작업시간
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;

// 사용 : 공정 라인별 불량률현황 (33120)
type
  TDH_PLINEPPM = packed record
    PCODE    : array [1..5] of char;    // 공정
    PLINE    : array [1..5] of char;    // 라인
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정별 불량률 현황 (33330)
type
  TDH_GONGLINEPPM = packed record
    PLINE    : array [1..5] of char;   // 생산일자
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정 라인 일자별 불량률현황 (33130)
type
  TDH_RQTYNBQTY = packed record
    FDATE    : array [1..10] of char;    // 생산일자
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정 라인 불량유형별 현황 (33140)
type
  TDH_PQCCODENQTY = packed record
    PQCCODE  : array [1..8] of char;    // 불량코드
    PQCNAME  : array [1..50] of char;   // 불량코드명
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정별 불량률현황 (33150)
type
  TDH_PROCPPM = packed record
    PCODE    : array [1..5] of char;    // 공정
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 기간별 캐스팅NO 품질현황(33180)
type
  TDH_CASTQCDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    SQTY     : integer;               // 검마성능불량수량
    VQTY     : integer;               // V2성능불량수량
    EQTY     : integer;               // 외관불량수량(캐스팅~포장)
    DQTY     : integer;               // 계정대체수량
    CARE     : char;
    GUMMA    : array [1..10] of char; // CASTNO
    V2GUM    : array [1..10] of char; // CASTNO
    CTNO     : array [1..10] of char; // CASTNO
    NTF      : integer;               // NTF수량
    BIGO     : array [1..400] of char; // 비고
    PBIGO    : array [1..400] of char;  // 비고     
end;

// 사용 : 기간별 캐스팅NO 성능불량현황(33270)
type
  TDH_CASTQCSDSP = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량계
    QTY1     : integer;               //
    QTY2     : integer;               //
    QTY3     : integer;               //
    QTY4     : integer;               //
    QTY5     : integer;               //
    QTY6     : integer;               //
    QTY7     : integer;               //
    QTY8     : integer;               //
    VQTY     : integer;               //
    JOLINE   : array [1..7] of char;  // 조립라인
    GUMLINE  : array [1..8] of char;  // 검사라인
    NTF      : integer;               //
    BIGO     : array [1..400] of char;  // 비고
    PBIGO    : array [1..400] of char;  // 비고
end;

// 사용 : 기간별 캐스팅NO 성능불량현황 (차크)(33320)
type
  TDH_CASTQCCHART = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량계
    NTF      : integer;               // 불량수량계    
end;

// 사용 : 캐스팅NO별 외관불량 현황(33190)
type
  TDH_APPQCPRE = packed record
    PNAME   : array [1..40] of char;  // 공정명
    PQCCODE : array [1..8] of char;   // 불량코드
    PQCNAME : array [1..50] of char;  // 불량코드명
    QTY     : integer;                // 불량수량
  end;

// 사용 : 캐스팅NO별 계정대체 현황(33200)
type
  TDH_DAECHEPRE = packed record
    PNAME   : array [1..40] of char;   // 공정명
    PLINE   : array [1..5] of char;    // 라인
    QTY     : integer;                 // 불량수량
    TNAME   : array [1..50] of char;   // 부서명
    NAEYONG  : array [1..50] of char;  // 출고사유코드명
    SNAEYONG : array [1..50] of char;  // 사유내용
    ILJA    : array [1..10] of char;   // 일자
    SIGAN   : array [1..8] of char;    // 시간
    IRUM    : array [1..20] of char;     // 처리자
  end;

// 사용 : 캐스팅 불량유형별 현황 (33310)
type
  TDH_CASTBADQTY = packed record
    RQTY     : integer;                 // 생산수량
    PQCCODE  : array [1..8] of char;    // 불량코드
    PQCNAME  : array [1..50] of char;   // 불량코드명
    BQTY     : integer;                 // 불량수량
end;

// 사용 : 공정별 일일 품질현황(33230)
type
  TDH_QCDAYDSP = packed record
    PCODE: array [1..5] of char;  // 공정코드
    LINE : array [1..5] of char;  // 라인
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
    BQTY : integer;               // 불량수량
  end;

// 사용 : 공정별 일일 품질현황(33230)
type
  TDH_QCDAYDSP1 = packed record
    PCODE: array [1..5] of char;  // 공정코드
    PQTY : integer;               // 계획수량
    SQTY : integer;               // 실적수량
    BQTY : integer;               // 불량수량
  end;

// 사용 : 자재로트추적(33240)
type 
  TDH_JAJAELOTSCH = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 라인명
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BPNAME   : array [1..40] of char; // 업체명
    SPLSN    : array [1..20] of char;  // 업체LOT
    IPDATE   : array [1..10] of char;  // 업체LOT
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // 일자
    JUYA     : char;
  end;

// 사용 : 자재로트추적(33350)
type
  TDH_JAJAELOTSCH2 = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 라인명
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BPNAME   : array [1..40] of char; // 업체명
    SPLSN    : array [1..20] of char;  // 업체LOT
    IPDATE   : array [1..10] of char;  // 자재입고일자
    IRUM     : array [1..20] of char;
    ILJA     : array [1..10] of char;  // 일자
    JUYA     : char;
  end;

  // 사용 : 자주검사 항목관리(33380)
type
  TDH_MSPRODTRACE = packed record
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 공정라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // 박스번호
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 처리자
    JUYA     : char;                   // 주야
end;

// 사용 : 공정라인별 PPM현황 (33250)
type
  TDH_AIMRBQTY = packed record
    PLINE    : array [1..5] of char;    // 라인
    RQTY     : integer;                 // 생산수량
    BQTY     : integer;                 // 불량수량
    APPM     : integer;                 // PPM
end;

// 사용 : 캐스팅NO(LOTNO) 조회(33260)
type 
  TDH_DSPCASTLOTNO = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // CASTNO
    LOTNO    : array [1..15] of char;  // LOTNO
  end;

// 사용 : 캐스팅NO별 용의설정 현황(33340)
type
  TDH_CASTYOUNG = packed record                
    STAT     : char;                    // 구분코드
    CASTNO   : array [1..10] of char;   // CASTNO
    ITEMCODE : array [1..20] of char;   // 품목코드
    PMNAME   : array [1..50] of char;   // 품명
    STD      : array [1..50] of char;   // 규격명
    RQTY     : integer;                 // 양품수량
    SDATE    : array [1..10] of char;   // 발생일
    SSIGAN   : array [1.. 8] of char;   // 발생시간
    EDATE    : array [1..10] of char;   // 해제일
    ESIGAN   : array [1.. 8] of char;   // 해제시간
    REASON   : array [1..50] of char;   // 사유
    REMARK   : array [1..50] of char;   // 비고     
    FACTORY  : array [1..6] of char;    // 용의설정 사업장
    REQID    : array [1..20] of char;   // 용의설정자
    REGID    : array [1..20] of char;   // 용의해제자
end;

// 사용 : 시험기간별 내구시험 현황(33280)
type
  TDH_CASTTEST_LIST = packed record
    CASTNO  : array [1..10] of char;  // 캐스팅번호
    MANAME  : array [1..20] of char;  // 시험장비
    TDATE   : array [1..10] of char;  // 시험일자
    SEQNO   : integer;                // 순번
    FAILT   : integer;                // 고장시간
    STOPT   : integer;                //  중단시간
    RLTDEC  : array [1..60] of char;  //  분석결과
    IMGNM   : array [1..20] of char;  // 첨부
    REMARK  : array [1..500] of char; // 기타
  end;

// 사용 : 캐스팅NO별 내구시험(32120)
type
  TDH_CASTTEST = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    MANAME  : array [1..20] of char;  // 시험장비
    TDATE   : array [1..10] of char;  // 시험일자
    SEQNO   : integer;                // 순번
    FAILT   : integer;                // 고장시간
    STOPT   : integer;                // 중단시간
    RLTDEC  : array [1..60] of char;  // 분석결과
    IMGNM   : array [1..20] of char;  // 첨부
    REMARK  : array [1..500] of char; // 기타
  end;

// 사용 : 캐스팅NO별 NTF등록(33450)
type
  TDH_CASTNTF = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    PV_QTY  : integer;                // 수량
    UT_QTY  : integer;                // 수량
    HV_QTY  : integer;                // 수량
    MC_QTY  : integer;                // 수량
    IB_QTY  : integer;                // 수량
    R1_QTY  : integer;                // 수량
    R2_QTY  : integer;                // 수량
    ETC_QTY : integer;                // 수량
    REMARK  : array [1..100] of char;  // 기타
  end;

// 사용 : 캐스팅NO별 용의 설정(32110)
type
  TDH_CASTCARE = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SDATE   : array [1..10] of char;  // 발생일
    SSIGAN  : array [1..8]  of char;  // 발생시간
    EDATE   : array [1..10] of char;  // 해제일
    ESIGAN  : array [1..8]  of char;  // 해제시간
    REASON  : array [1..50] of char;  // 사유
    REMARK  : array [1..50] of char;  // 기타
    STAT    : char;                   // 상태코드( B : 일반 용의품,  Q : 평가품) 
  end;

  // 사용 : 캐스팅NO별 불량분석(32100)
type
  TDH_CASTANALY = packed record
    CASTNO  : array [1..10] of char;  // CASTNO
    SEQNO   : integer;                // 순번
    BADTYPE : array [1..20] of char;  // 불량유형
    ONER    : array [1..6] of char;   // 1차저항
    TWOR    : array [1..6] of char;   // 2차저항
    TWOV    : array [1..6] of char;   // 2차전압
    IMGNM   : array [1..20] of char;  // 첨부
    REMARK  : array [1..50] of char;  // 기타
    GUMTYPE : array [1..20] of char;  // 검출유형
    QTY     : integer;                // 수량
  end;

// 사용 : 1차저항 XBAR-R관리도 (33410)
type
  TDH_ILXBAR = packed record
    XCNT   : array [1..10] of char;   // 생산일자
//    XCNT   : integer;   // 생산일자
    X1     : integer;                 // 생산수량
    X2     : integer;                 // 불량수량
    X3     : integer;                 // 생산수량
    X4     : integer;                 // 불량수량
    X5     : integer;                 // 생산수량
end;

// 사용 : 1차저항 XBAR-R관리도 (33430)
type
  TDH_ILXBARDBL = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 생산수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 생산수량
end;

// 사용 : 1차저항 XBAR-R관리도 (33410)
type
  TDH_SPECULVAL = packed record
    USLX   : double;                 // USLX
    LSLX   : double;                 // LSLX
    UCLX   : double;                 // UCLX
    LCLX   : double;                 // LCLX
    UCLR   : double;                 // UCLR
end; 

// 사용 : 1차권선  XBAR-R관리도 (33490)
type
  TDH_SPECULVAL2 = packed record
    USLX   : double;                 // USLX
    LSLX   : double;                 // LSLX
    UCLX   : double;                 // UCLX
    LCLX   : double;                 // LCLX
    UCLR   : double;                 // UCLR  
    SIRYO  : integer;                // 시료수
end;

// 사용 : 캐스팅 주입량,굴절율 Xbar-R 관리도
type
  TDH_CASTXBAR1 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
end;

// 사용 : 캐스팅 배합비 Xbar-R 관리도
type
  TDH_CASTXBAR2 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
end; 

// 사용 :
type
  TDH_CASTXBAR3 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR4 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR5 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR6 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR7 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
    X8     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR8 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
    X8     : double;                 // 불량수량
    X9     : double;                 // 불량수량
end;

// 사용 :
type
  TDH_CASTXBAR9= packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
    X8     : double;                 // 불량수량
    X9     : double;                 // 불량수량
    X10    : double;                 // 불량수량
end;

//
type
  TDH_CASTXBAR10 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
    X8     : double;                 // 불량수량
    X9     : double;                 // 불량수량
    X10    : double;                 // 불량수량
    X11    : double;                 // 불량수량
end;

//
type
  TDH_CASTXBAR11 = packed record
    XCNT   : array [1..10] of char;   // 생산일자
    X1     : double;                 // 생산수량
    X2     : double;                 // 불량수량
    X3     : double;                 // 불량수량
    X4     : double;                 // 불량수량
    X5     : double;                 // 불량수량
    X6     : double;                 // 불량수량
    X7     : double;                 // 불량수량
    X8     : double;                 // 불량수량
    X9     : double;                 // 불량수량
    X10    : double;                 // 불량수량
    X11    : double;                 // 불량수량
    X12    : double;                 // 불량수량
end;

// 사용 : 기간별 업체 특채승인 정보 조회(30320)
type
  TDH_HILJATUKLIST = packed record
    ILJA     : array [1..10] of char;  // 특채승인일자
    SPLCODE  : array [1.. 8] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 특채수량
end;

// 사용 : 업체별 자재입고현황(11150)
type
  TDH_ILJAJAJAELIST4 = packed record
    IPDATE   : array [1..10] of char;  // 입고일자
    SPLCODE  : array [1..10] of char;  // 업체코드
    BPNAME   : array [1..40] of char;  // 업체명
    YURACODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    QTY      : integer;                // 입고수량
    QTY1     : integer;                // 특채수량
end;

// 사용 : 기간별수입검사현황(31700) 
type 
  TDH_SOOIPQTLIST = packed record
    SOOIPNO  : array [1.. 9] of char;  // 수입검사번호
    IPDATE   : array [1..10] of char;  // 입하일자 
    ILJA     : array [1..10] of char;  // 등록일자 
    SPLCODE  : array [1..10] of char;  // 업체코드 
    BPNAME   : array [1..40] of char;  // 업체명 
    IPQTY    : integer;                // 입하수량 
    GQTY     : integer;                // 검사수량 
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    JQCCODE  : array [1..8] of char;   // 불량코드 
    JQCNAME  : array [1..50] of char;  // 불량명 
    JQBQTY   : integer;                // 코드별 불량수량 
    YURACODE : array [1..20] of char;  // 자재코드 
    PMNAME   : array [1..50] of char;  // 품목명 
    STD      : array [1..50] of char;  // 규격 
    DANWI    : array [1..5] of char;   // 단위 
    GETC     : array [1..50] of char;  // 기타 
end; 

// 사용 : 검사마킹 데이타 조회(라인별)(39000)
type
  TDH_MARKDATA = packed record
    INBOX       : array [1..13] of char;  // 담은박스
    CASTNO      : array [1..10] of char;  // 캐스트NO
    LOTNO       : array [1..15] of char;  // LOTNO
    ITEMCODE    : array [1..20] of char;  // 품목코드        
    PMNAME      : array [1..50] of char;  // 품명            
    STD         : array [1..50] of char;  // 규격명
    HOLENO      : INTEGER;                // HOLENO        
    RESULT      : array [1..2] of char;   // 결과            
    POWVAL      : array [1..8] of char;   // POWER           
    CHARTIME    : array [1..8] of char;   // Charging Time   
    CURRAT      : array [1..8] of char;   // Current at 1.5ms
    MAXCUR      : array [1..8] of char;   // Max Current     
    RISTIME     : array [1..8] of char;   // Rising Time     
    REVVOLT     : array [1..8] of char;   // Reverse Volt    
    PEAKVOLT    : array [1..8] of char;   // Peak Volt       
    LOWPPM      : INTEGER;                // 저RPM           
    LOWONTIME   : array [1..8] of char;   // OnTime          
    HIGHPPM     : INTEGER;                // 고RPM           
    HIGHONTIME  : array [1..8] of char;   // OnTime          
    INVOLT      : array [1..8] of char;   // 내전압          
    VTWO        : array [1..8] of char;   // V2검사
    LPEAKVOLT   : array [1..8] of char;   // L.PEAKVOLT      
    TEMP        : array [1..8] of char;   // TEMP            
    DT_REG      : array [1..10] of char;  // 검사일자        
    SIGAN       : array [1..8] of char;   // 검사시간        
    DT_MARK     : array [1..10] of char;  // 마킹일자
end;

// 사용 : 검사마킹 데이타 조회(LOT별)(39100)
type
  TDH_MARKDATALOT = packed record
    LOTNO       : array [1..15] of char;  // LOTNO
    ITEMCODE    : array [1..20] of char;  // 품목코드        
    PMNAME      : array [1..50] of char;  // 품명            
    STD         : array [1..50] of char;  // 규격명
    HOLENO      : INTEGER;                // HOLENO        
    RESULT      : array [1..2] of char;   // 결과            
    POWVAL      : array [1..8] of char;   // POWER           
    CHARTIME    : array [1..8] of char;   // Charging Time   
    CURRAT      : array [1..8] of char;   // Current at 1.5ms
    MAXCUR      : array [1..8] of char;   // Max Current     
    RISTIME     : array [1..8] of char;   // Rising Time     
    REVVOLT     : array [1..8] of char;   // Reverse Volt    
    PEAKVOLT    : array [1..8] of char;   // Peak Volt       
    LOWPPM      : INTEGER;                // 저RPM           
    LOWONTIME   : array [1..8] of char;   // OnTime          
    HIGHPPM     : INTEGER;                // 고RPM           
    HIGHONTIME  : array [1..8] of char;   // OnTime          
    INVOLT      : array [1..8] of char;   // 내전압          
    VTWO        : array [1..8] of char;   // V2검사
    LPEAKVOLT   : array [1..8] of char;   // L.PEAKVOLT      
    TEMP        : array [1..8] of char;   // TEMP            
    DT_REG      : array [1..10] of char;  // 검사일자        
    SIGAN       : array [1..8] of char;   // 검사시간        
    DT_MARK     : array [1..10] of char;  // 마킹일자
end;  

// 사용 : 공정 제조Loss 등록(40570)
type
  TDH_LossM = packed record
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

// 사용 : 공정별 재생품 등록 상세(40560)
type
  TDH_RECYCLES = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    GBN      : char;
    JQTY     : double;
end;

// 사용 : 소요품목(40561)
type
  TDH_SOYOPT = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    GBN      : char;
end;

    // 사용 : 부산물 등록(40910)
type
  TDH_BYPRODUCTLILST = packed record
    REGNO    : array [1..12] of char;  //  등록번호
    IPDATE   : array [1..10] of char;  //  입력일자
    PCODE    : array [1..5]  of char;  //  공정
    PLINE    : array [1..5]  of char;  //  라인
    BPCODE   : array [1..20] of char;  //  부산물코드
    BPNAME   : array [1..40] of char;  //  부산물명
    BPQTY    : double;                 //  수량
    REMARK   : array [1..100]of char;  //  비고
    REGDT    : array [1..10] of char;  //  입력일
    IRUM     : array [1..20] of char;  //  입력자
end;

// 사용 : 캐스팅실적조회(50060),검마실적조회(50080),V2검사실적조회(50090),외관검사실적조회(50300)
// 50570
type
  TDH_CASTINGLIST = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    IRUM     : array [1..20] of char;  // 작업자
end;

// 사용 : 포장 실적 상세조회[50310]
type
  TDH_POJANGLIST = packed record
    HONM     : array [1..20] of char;  // 공정(라인)
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..10] of char;  // BOX NO
    RQTY     : integer;                // 적입수량
    QTY      : integer;                // 낱개수량
    LOTNO    : array [1..10] of char;  // LOTNO
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    QTY1     : integer;                // 수량
    CASTNO2  : array [1..10] of char;  // 캐스팅번호2
    QTY2     : integer;                // 수량
    KEYNUM   : array [1..10] of char;  // 대표바코드
    IRUM     : array [1..20] of char;  // 작업자    
end; 

// 사용 : 포장 실적 상세조회(저장위치 포함)[50690]
type
  TDH_POJANGLIST2 = packed record
    HONM     : array [1..20] of char;  // 공정(라인)
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..10] of char;  // BOX NO
    RQTY     : integer;                // 적입수량
    QTY      : integer;                // 낱개수량
    LOTNO    : array [1..10] of char;  // LOTNO
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    QTY1     : integer;                // 수량
    CASTNO2  : array [1..10] of char;  // 캐스팅번호2
    QTY2     : integer;                // 수량
    KEYNUM   : array [1..10] of char;  // 대표바코드
    IRUM     : array [1..20] of char;  // 작업자  
    SLCODE   : array [1.. 4] of char;  // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 포장 실적 상세조회[50310]
type
  TDH_SMPOJANGLIST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 적입수량
    QTY     : integer;                 // 낱개수량
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야 
    SLCODE   : array [1.. 4] of char;  // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

//사용 : 공정별 작업일보 조회[50190]
type
  TDH_WORKLIST = packed record
    ILJA     : array [1..10] of char; // 일자
    LINE     : array [1..5] of char;  // 라인
    JUYA     : char;                  // 주야
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량
    JBTIME   : integer;               // 부여시간
    BIGADONG : integer;               // 비가동시간
    CAPA     : integer;               // CAPA
    MEMO     : array [1..1000] of char; // 규격명
    WORKER    : array [1..100] of char; // 작업자
  end;

// 사용 : 호기별부여시간등록(31000)
type 
  TDH_BooyoSigan = packed record
    ILJA     : array [1..10] of char; // 작업일자
    PLINE    : array [1..5] of char;  // 라인
    HONM     : array [1..20] of char; // 공정설명
    HOGI     : array [1..5] of char;  // 호기
    A_STIME  : array [1..5] of char;  // 부여시작시간
    A_ETIME  : array [1..5] of char;  // 부여종료시간 
    A_JTIME  : integer;               // 제외시간(분) 
    A_CTIME  : integer;               // 추가작업시간(분) 
    A_JBTIME : integer;               // 부여시간 
    B_STIME  : array [1..5] of char;  // 부여시작시간 
    B_ETIME  : array [1..5] of char;  // 부여종료시간 
    B_JTIME  : integer;               // 제외시간(분) 
    B_CTIME  : integer;               // 추가작업시간(분)
    B_JBTIME : integer;               // 부여시간
end;
// 사용 : 조립공정설비종합효율(50340,50350)
type
  TDH_JOSULHYOLIST = packed record
    ILJA     : array [1..10] of char; // 일자
    LINE     : array [1..5] of char;  // 라인
    JUYA     : char;                  // 주야
    CAPA     : integer;               // CAPA
    RQTY     : integer;               // 양품수량
    BQTY     : integer;               // 불량수량
    JBTIME   : integer;               // 부여시간
    BIGADONG : integer;               // 비가동시간
end;

// 사용 : 공정 라인별 효율 (50560)
type
  TDH_GLHYORUL = packed record
    FDATE    : array [1..10] of char;   // 생산일자
    RQTY     : integer;                 // 생산수량
    JBTIME   : integer;                 // 부여시간(총시간)
    BTIME    : integer;                 // 비가동시간(간접시간)
    CTIME    : double;                  // C/T
    MAN      : double;                  // 인원
    BQTY     : integer;                 // 생산수량
end;

// 사용 : 공정 라인별 간접시간 (50580)
type
  TDH_BIGATYPE = packed record
    FDATE    : array [1..10] of char;   // 생산일자
    JCODE    : array [1..50] of char;    // 비가동코드
    BTIME    : integer;                 // 비가동시간(간접시간)
end;

// 사용 : 기간별 LOSS현황 [52020]
type
  TDH_RECYCLELST = packed record
    PNAME  : array [1..40] of char;    // 공정명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    REGNO    : array [1..12] of char;  //
    RQTY     : double;                // 양품수량
    FDATE    : array [1..10] of char;  // 일자
end;
      
// 사용 : 기간별 LOSS현황 [52020]
type
  TDH_RECYCLELST2 = packed record
    PNAME  : array [1..40] of char;    // 공정명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : double;                // 양품수량
    FDATE    : array [1..10] of char;  // 일자
end;

    // 사용 : 부산물 조회(52030)
type
  TDH_BYPRODUCTLILST2 = packed record
    BPCODE   : array [1..20] of char;  //  부산물코드
    BPNAME   : array [1..40] of char;  //  부산물명
    REGNO    : array [1..12] of char;  //  등록번호
    IPDATE   : array [1..10] of char;  //  입력일자
    PNAME    : array [1..40] of char;  //  공정코드
    PLINE    : array [1..5]  of char;  //  라인
    BPQTY    : double;                 //  수량
    DANWI    : array [1..5]  of char;  //  단위
    REGDT    : array [1..10] of char;  //  입력일
    IRUM     : array [1..20] of char;  //  입력자
    REMARK   : array [1..100]of char;  //  비고
end;

// 사용 : 자주검사 항목관리(00510)
type
  TDH_JAJOOCODE = packed record
    PCODE    : array [1..5] of char;   // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 공정라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    HANGMOK  : array [1..60] of char;  // 항목
    MAXDATA  : double;                 // 범위상한
    MINDATA  : double;                 // 범위하한
    SIRYO    : integer;                // 시료수
    JTOOIP   : char;                   // 재투입여부
    BIGO     : array [1..50] of char;  // 비고
end;

// 사용 : 출하의뢰 및 출고현황(70500)
type
  TDH_CHULHAREQMSTYN = packed record
    CHLDT    : array [1..10] of char;  // 출고요청일자
    CHLNO    : array [1..12] of char;  // 출하번호
    CTNAME   : array [1..50] of char;  // 납품처명
    JGBN     : array [1..2] of char;   // 제품구분
    SIRUM    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    YIRUM    : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 구분
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
    IFACE    : char;                   // I/F여부
end;

// 사용 : 출하의뢰대비출고현황(70501)
type
  TDH_CHCHULHAREQL = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SINQTY   : Integer;
    CHLQTY   : Integer;
    DIFQTY   : Integer;
    GBN      : array[1..2] of char;
    CHLDT    : array [1..10] of char;
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 일자별 제품(생산) 상세 입고현황(70590)
type
  TDH_PRODIPDLIST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5]  of char;  // 단위
    CASTNO   : array [1..10] of char;  // CASTNO
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // 입고수량
    IPDATE   : array [1..10] of char;  // 입고일자
    IPSIGAN  : array [1..8]  of char;  // 입고시간
    IRUM     : array [1..20] of char;  // 이름
    WHLOC    : array [1..10] of char;  //
    KEYNUM   : array [1..10] of char; 
    SLCODE   : array [1..4] of char;  // 저장위치 코드
    SLNAME   : array [1..50] of char; // 저장위치명
end;

// 사용 : 기간별 제품(생산)입고현황(70600)
type
  TDH_PRODIPLIST = packed record
    ILJA     : array [1..10] of char;  // 입고일자
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량   
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 기간별 제품 입고현황(LOTNO포함)(70610)
type
  TDH_PRODIPLOTLIST = packed record
    ILJA     : array [1..10] of char;  // 입고일자
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // 입고수량
    WHLOC    : array [1..10] of char;  //
    QTY1     : Double;                 // 입고수량     
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 기간별 제품 입고현황(CASTNO포함)(7080)
type
  TDH_PRODIPCASTLIST = packed record
    ILJA     : array [1..10] of char;  // 입고일자
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // 입고수량
    WHLOC    : array [1..10] of char;  //
    QTY1     : double;                 // 입고수량
    CASTNO   : array [1..10] of char;  // LOTNO    
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 제품입고 상세내용 등록(70820)
type
  TDH_PRODIIPDESC = packed record
    IPDATE   : array [1..10] of char; // 입고일자
    ITEMCODE : array [1..20] of char;  // 업체코드
    LOTNO    : array [1..10] of char; // 자재코드
    CASTNO   : array [1..10] of char;  // 업체S/N(업체LOT)
    WHLOC    : array [1..10] of char;  //  LOCATION
    QTY      : integer;               // 입고수량
    REMARK   : array [1..100] of char; // REMARK  
    SLCODE   : array [1.. 4] of char; // 저장위치
end;

// 사용 : 창고별 제품재고현황(70620)
type
  TDH_PRODWHLIST = packed record
    SLCODE   : array [1..4] of char;  // 저장위치코드
    SLNAME   : array [1..50] of char; // 저장위치명
    ITEMCODE : array [1..20] of char; // 유라코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 재고수량 
    REPITEM  : array [1..20] of char; // 대표품목CODE
  end;

// 사용 : 창고별 제품재고현황(상세)(70810)
type
  TDH_PRODWHDET = packed record
    WHCODE   : array [1..8] of char;  // 창고코드
    WHNAME   : array [1..40] of char; // 창고명
    ITEMCODE : array [1..20] of char; // 유라코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 재고수량
    WHLOC    : array [1..10] of char;  // LOCATION
    LOTNO    : array [1..10] of char;  // LOTNO
    CASTNO   : array [1..10] of char;  // CASTNO
    IPDATE   : array [1..10] of char;  // 입고일자
  end;

// 사용 : 저장위치별 제품재고현황(상세)(70840)
type
  TDH_PRODWHDET2 = packed record
    SLCODE  : array [1..4] of char;   // 저장위치 코드
    SLNAME  : array [1..50] of char;  // 저장위치명
    ITEMCODE : array [1..20] of char; // 유라코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 재고수량
    WHLOC    : array [1..10] of char; // LOCATION
    LOTNO    : array [1..10] of char; // LOTNO
    WHNAME   : array [1..40] of char; // 창고명
    IPDATE   : array [1..10] of char; // 입고일자
  end;

// 사용 : 품콕코드별 LOC재고(70630)
type
  TDH_PROCLOCLIST = packed record
    ILJA  : array [1..10] of char;  // 입고일자
    WHLOC : array [1..10] of char;  // LOCATION
    QTY   : integer;                // 입고수량
  end;

// 사용 : 대표품번+저장위치별 LOC재고(70630)
type
  TDH_PROCLOCLIST2 = packed record
    REPITEM  : array [1..20] of char;  // 품목CODE
    ILJA     : array [1..10] of char;  // 입고일자
    WHLOC    : array [1..10] of char;  // LOCATION
    LOTNO    : array [1..10] of char;  // LOTNO
    QTY      : integer;                // 입고수량
    REMARK   : array [1..100] of char; // 리마크
  end;

// 사용 : 품목코드별 LOC재고현황(상세)(70830)
type
  TDH_ITEMLOCDET = packed record
    ILJA     : array [1..10] of char;     // 입고일자
    WHLOC    : array [1..10] of char;     // LOCATION
    LOTNO    : array [1..10] of char;     // LOTNO
    CASTNO   : array [1..10] of char;     // CASTNO
    QTY      : integer;                   // 입고수량
    REMARK   : array [1..100] of char;    // 비고
  end;

// 사용 : 박스바코드 정보(70831)
type
  TDH_PRODJANEGOBOX = packed record
    BOXNO  : array [1..10] of char;  // 입고일자
    QTY    : integer;                // 입고수량
    KEYNUM : array [1..10] of char;  // 대표바코드
  end;
                       
// 사용 : 일자별 반품입고현황(70640)
type
  TDH_PRODBANIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5]  of char;  // 단위
    QTY      : integer;                // 입고수량
    IPDATE   : array [1..10] of char;  // 입고일자
    IPSIGAN  : array [1..8]  of char;  // 입고시간
    IRUM     : array [1..20] of char;  // 이름
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 기간별 품목전환 입고현황(70650)
type
  TDH_PRODCHGIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5]  of char;  // 단위
    QTY      : integer;                // 입고수량
    IPDATE   : array [1..10] of char;  // 입고일자
    IPSIGAN  : array [1..8]  of char;  // 입고시간
    IRUM     : array [1..20] of char;  // 이름
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO  
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 기간별 계정대체 입고현황(70660)
type
  TDH_PRODDAEIPLST = packed record
    BOXNO    : array [1..10] of char;  // BOXNO
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5]  of char;  // 단위
    QTY      : integer;                // 입고수량
    IPDATE   : array [1..10] of char;  // 입고일자
    IPSIGAN  : array [1..8]  of char;  // 입고시간
    IRUM     : array [1..20] of char;  // 이름
    WHLOC    : array [1..10] of char;  //
    LOTNO    : array [1..10] of char;  // LOTNO  
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 반제품 샘플출고 현황(50600) 
type 
  TDH_DSPSAMPLECHOOL = packed record
    TNAME    : array [1..50] of char;  // 출고처
    ITEMCODE : array [1..20] of char;  // 품번 
    PMNAME   : array [1..50] of char;  // 품명 
    STD      : array [1..50] of char;  // 규격명 
    BOXNO    : array [1..13] of char;  // 박스번호 
    RQTY     : integer;                // 수량 
    SNAEYONG : array [1..50] of char;  // 내용 
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간 
    HOGI     : array [1..5] of char;   // 호기 
    IRUM     : array [1..20] of char;  // 출고자
end;

// 사용 : 공정자재재고현황(10870)
type
  TDH_GONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : int64;                 // 이월재고
    QTY2     : int64;                 // 기간출고
    QTY3     : int64;                 // 기간출고
  end;

// 사용 : 반제품 샘플출고 현황(50600)
type
  TDH_SUMSAMPLECHOOL = packed record
    TNAME    : array [1..50] of char;  // 출고처
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 수량
end;

// 사용 : 반제품시료출고현황(50660)
type
  TDH_JAJOOCHLGO = packed record
    JAJOONO  : array [1..10] of char;  // 자주검사번호
    HONM     : array [1..40] of char;  // 공정
    PLINE    : array [1..5] of char;   // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 수량
    GSIGN    : array [1..5] of char;   // 검사기준시간
    FDATE    : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    JUYA     : char;                   // 주야
    IRUM     : array [1..20] of char;
end;

// 사용 : 반제품시료출고현황(50660)
type
  TDH_JAJOOCHLGOSUM = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 수량
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
end;

// 사용 : 반제품시료출고현황(50680)
type
  TDH_DISUSECHLGO = packed record
    PNAME    : array [1..40] of char;  // 공정
    PLINE    : array [1..5] of char;   // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 수량
    BOXNO    : array [1..13] of char;  // 폐기번호
    HOGI     : array [1.. 5] of char;  // 호기
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 이름
    REMARK   : array [1..50] of char;  // 이름
end;

// 사용 : 공정자재 반품현황(50650)
type
  TDH_RETRUNJAJAE = packed record
    ILJA     : array [1..10] of char;
    YURASN   : array [1..10] of char;  // 자재바코드   
    BARSN    : array [1..50] of char;  // 업체바코드
    REYURASN : array [1..10] of char;  // 자재바코드
    YURACODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BPNAME   : array [1..40] of char;  // 업체명
    SPLSN    : array [1..20] of char;  // LOT
    CHGQTY   : integer;                // 반품수량
    DANWI    : array [1..5] of char;   // 단위
    CHGGBN   : char;                   // 반품구분
    SIGAN    : array [1..8] of char;   // 시간
    IRUM     : array [1..20] of char;  // 이름
  end;

// 사용 : 상세출고현황(70502)
type
  TDH_CHULHADELL = packed record
    BOXNO     : array [1..10] of char;  // 박스바코드
    CHLQTY    : Integer;
    CHLDT     : array [1..10] of char;
    CHSIGAN   : array [1..8]  of char;
    LOTNO     : array [1..20] of char;
    YURACODE  : array [1..20] of char;
    KEYNUMBER : array [1..10] of char;  // 대표바코드
end;

// 사용 : 캐스팅NO별 처리현황(50590)
type
  TDH_CASTPROCESS = packed record
    CASTNO   : array [1..10] of char; // CASTNO
    STD      : array [1..50] of char; // 규격명
    RQTY     : integer;               // 캐스팅양품수량
    IQTY     : integer;               // 검마투입양품수량
    IBQTY    : integer;               // 검마투입불량수량
    ISUMQTY  : integer;               // 검마투입수량
    OQTY     : integer;               // 검마실적양품수량
    OBQTY    : integer;               // 검마실적불량수량
    OSQTY    : integer;               // 검마실적샘플수량
    OSUMQTY  : integer;               // 검마실적수량
    VQTY     : integer;               // V2실적양품수량
    VBQTY    : integer;               // V2실적불량수량
    VSQTY     : integer;              // V2실적샘플수량
    VSUMQTY  : integer;               // V2실적수량
end;

// 사용 : 캐스팅NO별 공정재고 현황(50900)
type          
  TDH_CASTNOGONGLIST = packed record
    CASTNO   : array [1..10] of char; // 캐스트NO
    STD      : array [1..50] of char; // 규격
    C_QTY1   : integer;               // 캐스팅
    GO_QTY1  : integer;               // 검마실적
    GO_QTY2  : integer;               // 검마불량
    V2_QTY1  : integer;               // V2실적
    V2_QTY2  : integer;               // V2불량
    Q_QTY1   : integer;               // 외관실적
    Q_QTY2   : integer;               // 외관불량
    PO_QTY1  : integer;               // 포장실적
    PO_QTY2  : integer;               // 포장불량
  end;

// 사용 : 캐스팅 진행중 현황(50610)
type
  TDH_INGCASTING = packed record
    PLINE    : array [1..5] of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
end;
// 사용 : 캐스팅 진행중 현황(50610)
type
  TDH_IINGSCASTING = packed record
    PLINE    : array [1..5] of char;   // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 수량
end;

// 사용 : 제품 이동처리(저장위치간)	 (70450)
type
  TDH_JEPUMMOVE = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 규격명
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    ZONE     : array [1..15] of char;  // 지역
    CAR      : array [1..15] of char;  // 차종
    JANGSO   : array [1..14] of char;  // 납품장소
    DANWI    : array [1..5] of char;   // 단위
    PQTY     : integer;                // 적입수량
    LCOL     : array [1..10] of char;  // 라벨색상
    MARK     : array [1..10] of char;  // 각인
    LTYPE    : char;                   // 라벨타입
    HEAD     : char;                   // HEAD
    CGBN     : char;                   // 고객구분
    QTY      : Double;                 // set 수량
    BOXNO    : array [1..10] of char;  // BOXNO
    LOTNO    : array [1..10] of char;  // BOXNO
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

  // 사용 : 기간별 제품출고 현황(70680)
type
  TDH_ILPRODCHLGO = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    CTCODE   : array [1..10] of char;  // 업체코드
    CTNAME   : array [1..50] of char;  // 업체명
    ITEMCODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량  
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

  // 사용 : 기간별 제품출고 현황(품목별)(70900)
type
  TDH_PRODCHLGOPUM = packed record
    ITEMCODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량  
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

  // 사용 : 기간별 제품출고 현황(품목별)(70900)
type
  TDH_ILPRODCHLGOPUM = packed record
    ILJA     : array [1..10] of char;  // 입하일자
    ITEMCODE : array [1..20] of char;  // 자재코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    QTY      : integer;                // 입고수량 
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 출고요청 대비 출고수량(70700)
type
  TDH_PRODCHLIST = packed record
    ITEMCODE : array [1..20] of char;  // 품목CODE
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    S_QTY    : integer;                // 의뢰수량
    C_QTY    : integer;                // 출고수량
    BIGO     : array [1..50] of char; // 비고
end;

// 사용 : 제품 샘플출고 현황(70910)
type
  TDH_PRODSPL = packed record
    ILJA     : array [1..10] of char;  // 일자
    TNAME    : array [1..50] of char;  // 출고처
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    SQTY     : integer;                // 신청수량
    CQTY     : integer;                // 출고수량
    REMARK   : array [1..50] of char;  // 내용
    IRUM     : array [1..20] of char;  // 출고자   
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 제품 LOT추적(70690)
type
  TDH_PRODLOTSCH = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    LOTNO    : array [1..10] of char;  // LOTNO
    IPQTY    : integer;                // 수량
    SLCODE   : array [1.. 4] of char;  // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
  end;

// 사용 : 제품 LOT추적(70690)
type
  TDH_PRODLOTSCHDET = packed record
    BOXNO     : array [1..10] of char;  // 품목코드
    IPDATE    : array [1..10] of char;  // 품명
    IPQTY     : integer;                // 수량
    CHDATE    : array [1..10] of char;  // 규격명
    CHGNUMBER : array [1..12] of char;  // LOTNO
    CTNAME    : array [1..40] of char;  // 수량
    CHQTY     : integer;                // 수량
    SLCODE   : array [1.. 4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;   // 저장위치명
  end;

// 사용 : 공정별 자재소진 처리(10860)
type
  TDH_SOYOLIST = packed record
    PLINE    : array [1..5] of char;  // 라인
    PNAME    : array [1..40] of char; // 공정
    ITEMCODE : array [1..20] of char; // 품번
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME2  : array [1..50] of char; // 자재품목명
    STD2     : array [1..50] of char; // 자재규격명
    DANWI    : array [1..5] of char;  // 단위
    QTY      : integer;               // 생산수량
    SOYO     : double;                // 소요량
    SOJIN    : double;                // 소진량
  end;   

// 사용 : 반제품재고현황(10820)
type
  TDH_NGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : int64;                 // 이월재고
    QTY2     : int64;                 // 생산입고
    QTY3     : int64;                 // 리워크입고
    QTY4     : int64;                 // 생산출고
    QTY5     : int64;                 // 불량출고
    QTY6     : int64;                 // 샘플출고
    QTY7     : int64;                 // 자주(시료)출고
    QTY8     : int64;                 // 조정
    QTY9     : int64;                 // 폐기
    QTY10    : int64;                 // V2불량
    QTY11    : int64;                 // V2불량 
    QTY12    : int64;                 // V2불량
end;

// 사용 : 공정자재재고현황(10820)
type
  TDH_NEGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 입고고
    QTY3     : double;                 // 출고
    QTY4     : double;                 // 조정
    QTY5     : double;                 // 반품 
    QTY6     : double;                 // 반품
    QTY7     : double;                 // 반품
  end;  

// 사용 : 공정자재재고현황_단가(10870)
type
  TDH_NGONGJUNGJGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 입고고
    QTY3     : double;                 // 출고
    QTY4     : double;                 // 조정
    QTY5     : double;                 // 반품 
    QTY6     : double;                 //
    QTY7     : double;                 //
  end; 

// 사용 : 반제품재고현황(10820)
type
  TDH_NDGONGJUNGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 생산입고
    QTY3     : double;                 // 리워크입고
    QTY4     : double;                 // 생산출고
    QTY5     : double;                 // 불량출고
    QTY6     : double;                 // 샘플출고
    QTY7     : double;                 // 자주(시료)출고
    QTY8     : double;                 // 조정
    QTY9     : double;                 // 조정
    QTY10    : double;                 // 조정
    QTY11    : double;                 // 조정
end;
 
// 사용 : 자재입하등록용 자재발주리스트(10100) 
type
  TDH_LOCJAJAELIST2 = Packed Record
    YURACODE : array [1..20] of char; // 자재코드
    QTY      : integer;               // 수량
  end;

// 사용 : 리워크현황(50620)
type
  TDH_REWORKLSIT = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
//    PREBOX   : array [1..13] of char;  // BOX NO
//    IRUM     : array [1..20] of char;  // 작업자
end;

// 사용 : 리워크현황(50620)
type
  TDH_REWORKLSIT2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
end;

// 사용 : [70110]	판매 SAP IF 예외 관리
type
  TDH_IFEXC = packed record
    CTCODE   : array [1..10] of char;  // 업체코드
    CTNAME   : array [1..40] of char;  // 납품처명
    REPITEM  : array [1..20] of char;  // 대표품번
    STD      : array [1..50] of char;  // 규격명
    PMNAME   : array [1..50] of char;  // 업체명
    DANWI    : array [1.. 5] of char;   // 단위
end;

// 사용 : 박스바코드 정보(70831)
type
  TDH_SPLCODELIST = packed record
    YURASN : array [1..10] of char;  // 입고일자
    QTY    : integer;                // 입고수량
    KEYNUM : array [1..10] of char;  // 대표바코드
end;

// 사용 : IF자료조회 - 생산실적(80000)
type
  TDH_IFSILJUK = packed record
    BOXNO : array [1..14] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    ORNUM : char;                   // 작업오더번호
    WERKS : array [1.. 4] of char;  // 플랜트
    FEVOR : array [1.. 4] of char;  // 공정
    ARBPL : array [1.. 9] of char;  // 작업장
    MATNR : array [1..20] of char;  // 자재 번호
    STLAL : array [1.. 9] of char;  // 개정번호
    BUDAT : array [1..10] of char;  // 생산일
    SEQNP : integer;                // 순번
    LGORT : array [1.. 4] of char;  // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end; 

// 사용 : IF자료조회 - 불량(80010)
type
  TDH_IFBAD = packed record
    BOXNO : array [1..14] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    ORNUM : char;                   // 작업오더번호
    WERKS : array [1.. 4] of char;  // 플랜트
    FEVOR : array [1.. 4] of char;  // 공정
    ARBPL : array [1.. 9] of char;  // 작업장
    MATNR : array [1..20] of char;  // 자재 번호
    STLAL : array [1.. 6] of char;  // 개정번호
    BUDAT : array [1..10] of char;  // 생산일
    SEQNP : integer;                // 순번
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;    

// 사용 : IF자료조회 - REWORK(80020)
type
  TDH_IFREWORK = packed record
    BOXNO : array [1..13] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    ORNUM : char;                   // 작업오더번호
    WERKS : array [1.. 4] of char;  // 플랜트
    FEVOR : array [1.. 4] of char;  // 공정
    ARBPL : array [1.. 9] of char;  // 작업장
    MATNR : array [1..20] of char;  // 자재 번호
    STLAL : array [1.. 6] of char;  // 개정번호
    BUDAT : array [1..10] of char;  // 생산일
    SEQNP : integer;                // 순번
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;   

// 사용 : IF자료조회 - 기타출고(시료)(80030)
type
  TDH_IFETCSIRUO = packed record
    IFSEQ : array [1..10] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    WERKS : array [1.. 4] of char;  // 플랜트
    ARBPL : array [1.. 9] of char;  // 작업장
    IOGBN : array [1.. 4] of char;  // 출고구분
    MATNR : array [1..20] of char;  // 자재 번호
    BUDAT : array [1..10] of char;  // 출고일
    SEQNP : integer;                // 순번
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;

// 사용 : IF자료조회 - 기타출고(폐기)(80040)
type
  TDH_IFETCPEGI = packed record
    IFSEQ : array [1..13] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    WERKS : array [1.. 4] of char;  // 플랜트
    ARBPL : array [1.. 9] of char;  // 작업장
    IOGBN : array [1.. 4] of char;  // 출고구분
    MATNR : array [1..20] of char;  // 자재 번호
    BUDAT : array [1..10] of char;  // 출고일
    SEQNP : integer;                // 순번
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;

// 사용 : IF자료조회 - 기타출고(샘플)(80050)
type
  TDH_IFETCSEMPLE = packed record
    IFSEQ : array [1..13] of char;  // 등록번호
    F_FLAG: char;                   // 처리 유형
    WERKS : array [1.. 4] of char;  // 플랜트
    ARBPL : array [1.. 9] of char;  // 작업장
    IOGBN : array [1.. 4] of char;  // 출고구분
    MATNR : array [1..20] of char;  // 자재 번호
    BUDAT : array [1..10] of char;  // 출고일
    SEQNP : Integer;                  // 순번
    LGORT : array [1.. 4] of char;  // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;

// 사용 : IF자료조회 - 재생품(80060)
type
  TDH_IFETCJESENG = packed record
    IFSEQ : array [1..12] of char;  // 등록번호
    F_FLAG: char;                   // 처리유형
    WERKS : array [1.. 4] of char;  // 플랜트
    ARBPL : array [1.. 9] of char;  // 작업장
    MSGBN : char;                   // 처리구분
    MATNR : array [1..20] of char;  // 품번
    IDNRK : array [1..20] of char;  // 자재번호
    STLAL : array [1.. 3] of char;                   // 개정번호
    BUDAT : array [1..10] of char;  // 생산일
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 생산수량
    ERFME : array [1.. 5] of char;  // 생산단위
end;

// 사용 : IF자료조회 - LOSS(80070)
type
  TDH_IFETCLOSS = packed record
    IFSEQ : array [1..12] of char;  // 등록번호
    F_FLAG: char;                   // 처리유형
    ORNUM : char;                   // 작업오더번호
    WERKS : array [1.. 4] of char;  // 플랜트
    ARBPL : array [1.. 9] of char;  // 작업장
    MATNR : array [1..20] of char;  // 자재번호
    IDNRK : array [1..20] of char;  // 구성부품
    STLAL : array [1.. 3] of char;  // 개정
    BUDAT : array [1..10] of char;  // 발생일자
    LOSTP : array [1.. 5] of char;  // 유형
    LGORT : char;                   // 저장위치
    ERFMG : integer;                // 수량
    ERFME : array [1.. 5] of char;  // 단위
end; 

// 사용 : 공정재고조정현황(11260)
type
  TJAEGOLIST = packed record
    ILJA      : array [1..10] of char;  // 조정일자
    YURACODE  : array [1..20] of char;  // 유라코드
    PMNAME    : array [1..50] of char;  // 품목명
    STD       : array [1..50] of char;  // 규격
    QTY1      : integer;                // 실사수량
    QTY2      : Double;                 // 재고조정수량
end;

// 사용 : 공정재고조정현황(11260)
type
  TJAEGOLIST2 = packed record
    ILJA      : array [1..10] of char;  // 조정일자
    YURACODE  : array [1..20] of char;  // 유라코드
    PMNAME    : array [1..50] of char;  // 품목명
    STD       : array [1..50] of char;  // 규격
    QTY1      : integer;                // 실사수량
    QTY2      : integer;                // 재고조정수량
    SLCODE    : array [1..4] of char;   // 저장위치 코드
    SLNAME    : array [1..50] of char;  // 저장위치명
end;

// 사용 : 일자별 자재출고 현황(11390)
type
  TDH_JAJAEILCHOOL = packed record
    PCODE    : array [1..10] of char;    // 출고위치
    PNAME    : array [1..50] of char;    // 공정(부서)
    ITEMCODE : array [1..20] of char;    // 품목코드      
    PMNAME   : array [1..50] of char;    // 품목명        
    STD      : array [1..50] of char;    // 규격명        
    DANWI    : array [1..5] of char;     // 단위
    CQTY     : integer;                  // 출고수량      
    CHDATE   : array [1..10] of char;    // 출고일자      
    SPLCODE  : array [1..10] of char;    // 공급업체코드
    SPLNAME  : array [1..40] of char;    // 공급업체
    SPLSN    : array [1..20] of char;    // 업체SN        
    IPDATE   : array [1..10] of char;    // 입고일자      
end;

// 사용 : 일자별 제품출고 현황(70880)
type
  TDH_JEPUMILCHOOL = packed record
    PCODE    : array [1..10] of char;    // 납품처
    PNAME    : array [1..50] of char;    // 납품처명    
    SLCODE   : array [1..4] of char;     // 저장위치 코드
    SLNAME   : array [1..50] of char;    // 저장위치명
    ITEMCODE : array [1..20] of char;    // 품목코드
    PMNAME   : array [1..50] of char;    // 품목명
    STD      : array [1..50] of char;    // 규격
    DANWI    : array [1..5] of char;     // 단위
    CQTY     : integer;                  // 출고수량
    CHDATE   : array [1..10] of char;    // 출고일자
    LOTNO    : array [1..10] of char;    // LOTNO
    CASTNO   : array [1..10] of char;    // CASTNO
    IPDATE   : array [1..10] of char;    // 입고일자
end;  

// 사용 : 업체별입하상세내역(10941)
type
  TSPLCODELIST2 = packed record
    YURASN    : array [1..10] of char;  // 유라S/N
    QTY       : integer;                // 수량
    KEYNUMBER : array [1..10] of char;  // 대표바코드
end;

// 사용 : 반제품 샘플 출고처리(40820) 
type 
  TWIPSCODE = packed record 
    CODE    : array [1..5] of char;   // 코드 
    NAEYONG : array [1..50] of char;  // 내용 
end;

// 사용 : 조립/캐스팅(50700)
type
  TDH_JORIPCASTING2 = packed record
    HONM     : array [1..20] of char;  // 공정설명
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    FDATE    : array [1..10] of char;  // 일자
    JUYA     : char;                   // 주야
    IRUM     : array [1..20] of char;  // 작업자
    PALLET   : array [1..6] of char;   // PALLET
end;

// 사용 : 출하의뢰 등록(50100)
type
  TDH_CHULHAREQMST = packed record
    CHLNO    : array [1..12] of char;  // 출하번호
    CHLDT    : array [1..10] of char;  // 출고요청일자
    CTCODE   : array [1..10] of char;  // 납품처 코드
    CTNAME   : array [1..50] of char;  // 납품처명
    JGBN     : array [1..2] of char;   // 제품구분
    SINDT    : array [1..10] of char;  // 의뢰일자
    SABUN    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    ID_PASS  : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 출고구분
    SLCODE   : array [1..4] of char;   // 출고저장위치
    SLNAME   : array [1..50] of char;  // 출고저장위치명
end;

// 사용 : 반제품 포장마스터(10570)
type
  TDH_HALFPOJANGMST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    DANWI    : array [1..5] of char;   // 단위
    ITEMNM   : array [1..30] of char;  // 부품명
    PQTY     : Integer;                // 적입수량
    YN       : char;                   // 사용여부
end;

// 사용 : 반제품 포장실적처리(40590)
type 
  THALFPOJANG = packed record
    ITEMCODE : array [1..20] of char;  // 품번 
    STD      : array [1..50] of char;  // 규격명 
    ITEMNM   : array [1..30] of char;  // 부품명
    PQTY     : integer;                // 적입수량
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    LOTNO    : array [1..10] of char;  // LOTNO
    SIGAN    : array [1.. 8] of char;  // 시간
    SABUN    : array [1..10] of char;  // 등록자   
    KEYNUM   : array [1..10] of char;  // 대표바코드
end;


// 사용 : 반제품 포장실적처리(40590)
type
  THALFPOJANGCB = packed record
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
    ITEMNM   : array [1..30] of char;  // 부품명
    DANWI    : array [1..5] of char;   // 단위 
    RQTY     : integer;                // set 수량
    PQTY     : integer;                // 적입수량
end;


// 사용 : 반제품 출하의뢰 등록(10580)
type
  THALFCHULHAREQMST = packed record
    CHLNO    : array [1..12] of char;  // 출하번호
    CHLDT    : array [1..10] of char;  // 출고요청일자
    CTCODE   : array [1..10] of char;  // 납품처 코드
    CTNAME   : array [1..50] of char;  // 납품처명
    JGBN     : array [1..2] of char;   // 제품구분
    SINDT    : array [1..10] of char;  // 의뢰일자
    SABUN    : array [1..20] of char;  // 신청자
    YN       : char;                   // 요청여부 '1;요청'
    DT_PASS  : array [1..10] of char;  // 승인일자
    ID_PASS  : array [1..20] of char;  // 승인자
    REMARK   : array [1..60] of char;  // 비고
    CHGBN    : array [1..2] of char;   // 출고구분
    SLCODE   : array [1..4] of char;   // 출고저장위치
    SLNAME   : array [1..50] of char;  // 출고저장위치명
end;

// 사용 : 출하의뢰 상세(10581)
type
  THALFCHULHAREQL = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // 캐스팅번호  
    BRCD     : array [1..10] of char;  // 대표번호   
    SINQTY   : Integer;                // 의뢰수량
    DANWI    : array [1..5] of char;   // 단위
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 품목코드 조회(50111)
type
  TCASTPTMSTVIEW = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명    
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    DANWI    : array [1..5] of char;   // 단위  
    QTY      : integer;                // 수량     
end;
         {
// 사용 : 반제품재고현황(10820), (10830)
type
  TNGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : int64;                 // 이월재고
    QTY2     : int64;                 // 생산입고
    QTY3     : int64;                 // 리워크입고
    QTY4     : int64;                 // 생산출고
    QTY5     : int64;                 // 불량출고
    QTY6     : int64;                 // 샘플출고
    QTY7     : int64;                 // 자주(시료)출고
    QTY8     : int64;                 // 조정
    QTY9     : int64;                 // 폐기
    QTY10    : int64;                 // V2불량
    QTY11    : int64;                 // 재생   2013.08.07 추가
    QTY12    : int64;                 // 로스   2014.01.22 추가
    QTY13    : int64;                 // 반제품
    SLCODE   : array [1..4] of char;   // 저장위치
    SLNAME   : array [1..50] of char;  // 저장위치명
end;  }
// 사용 : 반제품재고현황(10820), (10830)
type
  TNGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : int64;                 // 이월재고
    QTY2     : int64;                 // 생산입고
    QTY3     : int64;                 // 리워크입고
    QTY4     : int64;                 // 생산출고
    QTY5     : int64;                 // 불량출고
    QTY6     : int64;                 // 샘플출고
    QTY7     : int64;                 // 자주(시료)출고
    QTY8     : int64;                 // 조정
    QTY9     : int64;                 // 폐기
    QTY10    : int64;                 // V2불량
    QTY11    : int64;                 // 재생   2013.08.07 추가
    QTY12    : int64;                 // 로스   2014.01.22 추가
    SLCODE   : array [1..4] of char;   // 저장위치
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 공정자재재고현황(10820)
type
  TNEGONGJUNGJG = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 입고고
    QTY3     : double;                 // 출고
    QTY4     : double;                 // 조정
    QTY5     : double;                 // 반품
    QTY6     : double;                 // 재생 2013.08.07
    QTY7     : double;                 // 로스 2014.01.22
  end;

// 사용 : 반제품재고현황(10830)
type
  TNDGONGJUNGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 생산입고
    QTY3     : double;                 // 리워크입고
    QTY4     : double;                 // 생산출고
    QTY5     : double;                 // 불량출고
    QTY6     : double;                 // 샘플출고
    QTY7     : double;                 // 자주(시료)출고
    QTY8     : double;                 // 조정
    QTY9     : double;                 // 조정
    QTY10     : double;                // 재생
    QTY11     : double;                // LOSS
    QTY12     : double;                // 반제품
    SLCODE   : array [1..4] of char;   // 저장위치
    SLNAME   : array [1..50] of char;  // 저장위치명
end;

// 사용 : 공정자재재고현황_단가(10870)
type
  TNGONGJUNGJGDANGA = packed record
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    DANWI    : array [1..5] of char;  // 단위
    PCODE    : array [1..5] of char;  // 공정코드
    PNAME    : array [1..40] of char; // 공정설명
    QTY1     : double;                 // 이월재고
    QTY2     : double;                 // 입고고
    QTY3     : double;                 // 출고
    QTY4     : double;                 // 조정
    QTY5     : double;                 // 반품
    QTY6     : double;                 // 재생
    QTY7     : double;                 // LOSS
    QTY8     : double;                 // 반제품
  end;

 // 사용 : 50270_외주업체별 제품 운송중 재고현황
type
  TDH_MOVECHOOLSANGLIST = packed record
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..10] of char;  // BOX NO
    RQTY     : integer;                // 적입수량
    LOTNO    : array [1..10] of char;  // LOTNO
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8] of char;   // 시간
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    KEYNUM   : array [1..10] of char;  // 대표바코드
    IRUM     : array [1..20] of char;  // 작업자
end;

 // 사용 : 50270_외주업체별 제품 운송중 재고현황
type
  TDH_MOVECHOOLCASTLIST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 적입수량
    FDATE    : array [1..10] of char;  // 일자
    CASTNO   : array [1..10] of char;  // 캐스팅번호
end;

 // 사용 : 50270_외주업체별 제품 운송중 재고현황
type
  TDH_MOVECHOOLPARTLIST = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 적입수량
    FDATE    : array [1..10] of char;  // 일자
end;

 // 사용 : 50270_외주업체별 제품 운송중 재고현황
type
  TDH_MOVECHOOLLOCLIST = packed record
    SLCODE   : array [1..4] of char;   // 저장위치 코드
    SLNAME   : array [1..50] of char;  // 저장위치명
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    RQTY     : integer;                // 적입수량
    FDATE    : array [1..10] of char;  // 일자
end;

  // 사용 : 초중종물 관려현황(50160)
type
  TMS_MONITOR = packed record
    GBN : char;  // 구분
    V1  : char;  //
    V2  : char;  //
    V3  : char;  //
    V4  : char;  //
    V5  : char;  //
    V6  : char;  //
    V7  : char;  //
    V8  : char;  //
    V9  : char;  //
    V10 : char;  //
    V11 : char;  //
    V12 : char;  //
    V13 : char;  //
    V14 : char;  //
    V15 : char;  //
    V16 : char;  //
    V17 : char;  //
    V18 : char;  //
    V19 : char;  //
    V20 : char;  //
    V21 : char;  //
    V22 : char;  //
    V23 : char;  //
    V24 : char;  //
    V25 : char;  //
    V26 : char;  //
    V27 : char;  //
    V28 : char;  //
    V29 : char;  //
    V30 : char;  //
    V31 : char;  //
    V32 : char;  //
    V33 : char;  //
    V34 : char;  //
    V35 : char;  //
end;

// 사용 : INVOICE 정보 전송처리(70930)
type
  TMS_INVOICE = packed record
    CHLNO  : array [1..12] of char;  // 출하번호
    INVNO  : array [1..12] of char;  // Invoice No
    CONNO  : array [1..10] of char;  // 컨테이너NO
    VOYNO  : array [1..3] of char;   // 차수 (일별 차수) Voyage No               
    OCMNO  : array [1..10] of char;  // 납품서번호
    YQTY   : integer;                // 노랑 파렛수
    BQTY   : integer;                // 파랑 파렛수
    GNQTY  : integer;                // 녹색 파렛수
    GYQTY  : integer;                // 회색 파렛수
    BKQTY  : integer;                // 검정 파렛수
    BBQTY  : integer;                // 보빈 수량                 
    SNDCHK : char;                   // 전송여부 (전송 '1')
    REMARK : array [1..200] of char; // 비고
    REG_DT : array [1..10] of char;  // 등록일
    RIRUM  : array [1..20] of char;  // 등록자
    SND_DT : array [1..10] of char;  // 전송일
    SIRUM  : array [1..20] of char;  // 전송자
end;

 // 사용 : 자재입하(업체라벨사용)(10030)
type
  TDH_DOINFOLST2 = Packed Record
    YURACODE : array [1..20] of char; // 자재코드
    STD      : array [1..50] of char; // 규격
    PMNAME   : array [1..50] of char; // 품목명
    PACKQTY  : integer;               // 자재포장 단위 수량
    DANWI    : array [1..5] of char;  // 기본단위
    QTY      : integer;               // 입고된수량
    BPCODE   : array [1..10] of char; // 업체코드
    BPNAME   : array [1..40] of char; // 업체명
    DOQTY    : integer;               // 납품서수량
    SPLSN    : array [1..20] of char; // 입고로트
    SLCODE   : array [1..4] of char;  // 입고저장위치
    DODANWI    : array [1..5] of char;// 납품서단위
    EXPCHK   : char;                  // 유통기한 관리자재
  end;

  
// 사용 : 자재수불부(11340)
type
  TMS_JAJAERDLIST = packed record
    YURACODE : array [1..20] of char;   // 자재코드
    PMNAME   : array [1..50] of char;   // 품명
    STD      : array [1..50] of char;   // 규격명
    SLCODE   : array [1..4] of char;    // 저장위치
    SLNAME   : array [1..50] of char;   // 저장위치명
    DANWI    : array [1..5] of char;    // 단위
    QTY1     : Int64;                 // 이월재고
    QTY2     : integer;                 // 구매입고
    QTY10    : integer;                 // 계정대체입고
    QTY11    : integer;                 // 공정반품입고
    QTY3     : integer;                 // 생산출고
    QTY4     : integer;                 // 판매출고
    QTY5     : integer;                 // 외주출고
    QTY6     : integer;                 // 샘플출고
    QTY7     : integer;                 // 전환출고
    QTY8     : integer;                 // 반품출고
    QTY9     : integer;                 // 조정출고
end;

// 사용 : 업체별입하상세내역(11201)
type
  TSPLCODELIST = packed record
    YURASN  : array [1..10] of char;  // 유라S/N
    BARSN   : array [1..50] of char;  // 유라S/N
    QTY     : integer;                // 수량
    KEYNUM  : array [1..10] of char;
    EXPCHK  : array [1..10] of char;  // 유통기한 관리자재
end;      
// 사용 : 자주검사및시료출고 이력(40830)
type
  TJAJOOCODEVIEW = packed record
    PNAME    : array [1..40] of char;   // 공정구분
    STD      : array [1..50] of char;   // 규격명
    ITEMCODE : array [1..20] of char;   // 품번
    PLINE    : array [1..5]  of char;   // 라인
    HANGMOK  : array [1..40] of char;   // 항목
    NAEYONG  : array [1..400] of char;  // 시료데이터
    SIRYO    : integer;                 // 시료수
    ILJA     : array [1..10] of char;   // 검사날짜
    GSIGAN    : array [1..5] of char;   // 검사시간대
    SABUN    : array [1..20] of char;   // 등록자
    JUYA     : char;                    // 주야
    SIGAN    : array [1..8] of char;    // 검사시간
end;
// 사용 : 로트추적관리(33240)
type
  TDH_JAJAELOTITEM = packed record
    ITEMCODE : array [1..20] of char;  // 품번
    STD      : array [1..50] of char;  // 규격명
  end;

  
// 사용 : 공정별불량현황조회(33110)
type
  THC_QLT_B_LIST2 = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    PGONG    : array [1..8] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    CASTNO   : array [1..10] of char;  // 캐스팅
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;

// 사용 : 공정별불량현황조회(33110)
type
  THC_QLT_B_LIST = packed record
    PLINE    : array [1..5] of char;   // 라인
    PCODE    : array [1..5] of char;   // 공정
    PGONG    : array [1..8] of char;   // 공정
    ITEMCODE : array [1..20] of char;  // 품목
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격
    CASTNO   : array [1..10] of char;  // 캐스팅   
    BOXNO    : array [1..13] of char;  // 박스번호
    PQCCODE  : array [1..8] of char;   // 불량코드
    PQCNAME  : array [1..50] of char;  // 불량명
    BQTY     : integer;                // 불량코드
    ILJA     : array [1..10] of char;  // 작업일자
    SIGAN    : array [1..8] of char;   // 작업시간
    FDATE    : array [1..10] of char;  // 생산일자
    JUYA     : char;                   // 주야
end;

// 사용 : 기간별 capact관리(00610)
type
  TCAPACT = packed record         
    FRDATE   : array [1..10] of char;  // 시작일자
    TODATE   : array [1..10] of char;  // 종료일자
    PCODE    : array [1.. 5] of char;  // 공정코드
    PNAME    : array [1..40] of char;  // 공정명
    PLINE    : array [1..5] of char;   // 라인명
    CAPA     : integer;                // CAPA
    CT       : double;                 // 사이클타임(초)
    SHIFT    : array [1..2] of char;   // 근무조
    BIGADONG : integer;                // 비가동 목표
end;

// 윤태원 해더 시작 ========================================

// 사용 : 작업시간관리 (00220)
type
  TWORKTIME = packed record
    NUM        : integer;               // 일별 내에 작업시간에 따른 KEY 부여 (추후 계산에 사용하기 위함)
    WORKGBN    : char;                  // W : 작업, B : 쉬는시간
    FRDDAY     : integer;               // D DAY + 0,1 (다음날로 넘어가는 경우 1)
    FRTIME     : array [1..8] of char;  // 시작시간
    TODDAY     : integer;               // D DAY + 0,1 (다음날로 넘어가는 경우 1)
    TOTIME     : array [1..8] of char;  // 종료시간
    MINDIFF    : integer;               // (종료시간 - 시작시간) 분단위
    DAYSTART   : char;                  // 일 작업 시작여부
    DAYEND     : char;                  // 일 작업 종료여부
    SHIFT      : char;                  // SHIFT
    SHIFTSTART : char;                  // SHIFT별 작업 시작여부
    SHIFTEND   : char;                  // SHIFT별 작업 종료여부
    IRUM       : array [1..20] of char; // 등록자
end;

// 사용 : 반제품출하의뢰대비출고현황(50251)
type
  THC_CHCHULHAREQL = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    DANWI    : array [1..5] of char;   // 단위
    SINQTY   : Integer;
    CHLQTY   : Integer;
    DIFQTY   : Integer;
    GBN      : array[1..2] of char;
    CHLDT    : array [1..10] of char;
    IPGOQTY  : Integer;
    SETDT    : array [1..10] of char;
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 공정별 품목정보(40020)
type
  TMS_PROCITEMCODE = packed record
    PCODE     : array [1..5] of char;    // 공정코드
    PNAME     : array [1..40] of char;   // 공정명
    ITEMCODE  : array [1..20] of char;   // 품목코드
    PMNAME    : array [1..50] of char;   // 품목명
    STD       : array [1..50] of char;   // 규격명
    REMARK    : array [1..40] of char;   // Remark
    ASSYN     : char;                    // 하위반제품 여부
end;

// 사용 : 생산 실적 수정 및 삭제(관리자용) (40090)
type
  TMS_DELPROC = packed record
    HOGI      : array [1..5] of char;    // 설비코드
    LINE      : array [1..5] of char;    // 라인
    ITEMCODE  : array [1..20] of char;   // 품목코드
    RQTY      : Integer;                 // 양품 수량
    BQTY      : Integer;                 // 불량 수량
    ILJA      : array [1..10] of char;   // 작업 일자
    SIGAN     : array [1..8] of char;    // 작업 시간
    SABUN     : array [1..10] of char;   // 사번
    JUTA      : char;                    // 주야구분
end;


// 사용 : 생산 실적 수정 및 삭제(관리자용) (40090)
type
  TMS_EXPDATE = packed record
    EXPDATE      : Integer;                 // 화면 사용 가능 남은 일수
end;

// 사용 : 권선 조정 현황 (50910)
type
  TDH_KWONSUN_BAK = packed record
    HONM       : array [1..20] of char;  // 공정설명
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8] of char;   // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자
    JUYA       : char;                   // 주야
    PREBOX     : array [1..13] of char;  // 전공정박스
    IRUM       : array [1..20] of char;  // 작업자
    ENDCHK     : char;                   // 투입여부
    STAT       : char;                   // 상태
    TORQTY     : integer;                // TO 양품수량
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;

// 사용 : 조립 조정 현황 (50920)
type
  TDH_JOLIP_BAK = packed record
    HONM       : array [1..20] of char;  // 공정설명
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8] of char;   // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자
    JUYA       : char;                   // 주야
    ENDCHK     : char;                   // 투입여부
    IRUM       : array [1..20] of char;  // 작업자
    PALLET     : array [1..6] of char;   // PALLET
    STAT       : char;                   // 상태
    TORQTY     : integer;                // TO 양품수량
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;

// 사용 : [40120] 비가동 처리 삭제 요청 (관리자용) (40120)
type
  TDH_BIGADONGLIST3 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리세부내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    IDNO      : integer;               // 비가동번호
  end;

// 사용 : 비가동 처리 삭제 요청 현황 (관리자용) (40130)
type
  TDH_BIGADONGLIST4 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    IDNO      : integer;               // IDNO
    REGID     : array [1..20] of char; // 요청자
    REGDT     : array [1..10] of char; // 요청일 
  end;

// 사용 : 비가동 처리 삭제 현황 (50930)
type
  TDH_BIGADONGLIST5 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    IDNO      : integer;               // IDNO
    REQID     : array [1..20] of char; // 요청자
    REQDT     : array [1..10] of char; // 요청일
    REGID     : array [1..20] of char; // 삭제자
    REGDT     : array [1..10] of char; // 삭제일
  end;

// 사용 : 생산 실적 수정 및 삭제(관리자용) (40090)
//        생산 실적 삭제 요청 현황(관리자용) (40150)
type
  TMS_DELPRO2 = packed record
    HONM      : array [1..20] of char;   // 공정
    ITEMCODE  : array [1..20] of char;   // 품목코드
    RQTY      : Integer;                 // 양품 수량
    BQTY      : Integer;                 // 불량 수량
    ILJA      : array [1..10] of char;   // 작업 일자
    SIGAN     : array [1..8] of char;    // 작업 시간
    SABUN     : array [1..20] of char;   // 작업자
    JUYA      : char;                    // 주야구분
    REQID     : array [1..20] of char;   // 요청자
    REQDT     : array [1..10] of char;   // 요청일
    BOXNO     : array [1..13] of char;   // 박스번호
    PCODE     : array [1..5] of char;    // 공정코드
    PQCCODE   : array [1..8] of char;    // 공정불량코드
end;


// 사용 : 생산 실적 수량 변경 요청 현황(관리자용) (40160)
type
  TMS_MODDIFYPRO = packed record
    HONM      : array [1..20] of char;   // 공정
    ITEMCODE  : array [1..20] of char;   // 품목코드
    RQTY      : Integer;                 // 양품 수량
    BQTY      : Integer;                 // 불량 수량
    ILJA      : array [1..10] of char;   // 작업 일자
    SIGAN     : array [1..8] of char;    // 작업 시간
    SABUN     : array [1..20] of char;   // 작업자
    JUYA      : char;                    // 주야구분
    REQID     : array [1..20] of char;   // 요청자
    REQDT     : array [1..10] of char;   // 요청일
    BOXNO     : array [1..13] of char;   // 박스번호 
    TORQTY    : Integer;                 // TO양품 수량
    TOBQTY    : Integer;                 // TO불량 수량
    PCODE     : array [1..5] of char;    // 공정코드
    PQCCODE   : array [1..8] of char;    // 공정불량코드
end;

// 사용 : 생산 실적 품목코드 변경 요청 현황(관리자용) (40170)
type
  TMS_MODDIFYITEMPRO = packed record
    HONM       : array [1..20] of char;   // 공정
    ITEMCODE   : array [1..20] of char;   // 품목코드
    RQTY       : Integer;                 // 양품 수량
    BQTY       : Integer;                 // 불량 수량
    ILJA       : array [1..10] of char;   // 작업 일자
    SIGAN      : array [1..8] of char;    // 작업 시간
    SABUN      : array [1..20] of char;   // 작업자
    JUYA       : char;                    // 주야구분
    REQID      : array [1..20] of char;   // 요청자
    REQDT      : array [1..10] of char;   // 요청일
    BOXNO      : array [1..13] of char;   // 박스번호
    TOITEMCODE : array [1..20] of char;   // 품목코드
    PCODE      : array [1..5] of char;    // 공정코드
    PQCCODE    : array [1..8] of char;    // 공정불량코드
end;

// 사용 : 로테이팅 조정 현황 (50910)
type
  TDH_INSERTPIN_BAK = packed record
    HONM       : array [1..20] of char;  // 공정
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8]  of char;  // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자
    JUYA       : char;                   // 주야
    ENDCHK     : char;                   // 투입여부
    IRUM       : array [1..20] of char;  // 작업자
    STAT       : char;                   // 상태
    TORQTY     : integer;                // TO 양품수량
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자   
    REGID      : array [1..20] of char;  // 요청자
    REGDT      : array [1..10] of char;  // 요청일자
end;

// 사용 : 캐스팅 조정 현황 (50950) CK
type
  TDH_CASTINGUNLOADING_BAK = packed record
    HONM       : array [1..20] of char;  // 공정
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8]  of char;  // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자
    JUYA       : char;                   // 주야
    CASTNO     : array [1..10] of char;  // 캐스팅번호
    PALLET     : array [1..6]  of char;  // 파렛번호
    JOLIPLINE  : array [1..5]  of char;  // 조립라인
    IRUM       : array [1..20] of char;  // 작업자
    TOIPILJA   : array [1..10] of char;  // 투입일자
    TOIPSIGAN  : array [1..8]  of char;  // 투입시간
    LTMI       : INTEGER;                // LT(분)
    JOLIPBOX   : array [1..13] of char;  // 조립박스    
    STAT       : char;                   // 상태
    TORQTY     : integer;                // TO 양품수량
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;

// 사용 : V2검사 조정 현황 (50960)
type
  TDH_V2GUMSA_BAK = packed record
    HONM       : array [1..20] of char;  // 공정
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8]  of char;   // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자
    JUYA       : char;                   // 주야
    CASTNO     : array [1..10] of char;  // 캐스팅번호
    IRUM       : array [1..20] of char;  // 작업자
    STAT       : char;                   // 상태
    TORQTY     : integer;                // TO 양품수량
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;

// 사용 : 불량 조정 현황 (50970)
type
  TDH_QLT_B_BAK = packed record
    PLINE      : array [1..5]  of char;  // 라인
    PCODE      : array [1..5]  of char;  // 공정
    CUSTNM     : array [1..6]  of char;  // 업체명
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    CASTNO     : array [1..10] of char;  // 캐스팅번호
    BOXNO      : array [1..13] of char;  // 박스번호
    PQCCODE    : array [1..8]  of char;  // 불량코드
    PQCNAME    : array [1..50] of char;  // 불량명
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    STAT       : char;                   // 상태
    TOBQTY     : integer;                // TO 불량수량
    TOITEMCODE : array [1..20] of char;  // TO 품목코드
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;


// 사용 : 캐스팅 <-> 조립 실적 매칭 요청 (관리자용) (40140)
type
  TMS_CASTANDJOLIPMAT = packed record
    HOGI      : array [1..5] of char;    // 설비코드
    LINE      : array [1..5] of char;    // 라인
    ITEMCODE  : array [1..20] of char;   // 품목코드
    RQTY      : Integer;                 // 양품 수량
    BQTY      : Integer;                 // 불량 수량
    ILJA      : array [1..10] of char;   // 작업 일자
    SIGAN     : array [1..8] of char;    // 작업 시간
    IRUM      : array [1..20] of char;   // 작업자
    JUTA      : char;                    // 주야구분
    PALLET1   : array [1..13] of char;   // PALLET1
    PALLET2   : array [1..13] of char;   // PALLET2
end;

           
// 사용 : 캐스팅↔조립 실적 매칭 요청 현황 (관리자용) (40180)
type
  TMS_CASTANDJOLIPMATSH = packed record
    HONM      : array [1..20] of char;   // 공정
    ITEMCODE  : array [1..20] of char;   // 품목코드
    RQTY      : Integer;                 // 양품 수량
    BQTY      : Integer;                 // 불량 수량 
    PALLET1   : array [1..13] of char;   // PALLET1
    PALLET2   : array [1..13] of char;   // PALLET2
    ILJA      : array [1..10] of char;   // 작업 일자
    SIGAN     : array [1..8]  of char;   // 작업 시간
    SABUN     : array [1..20] of char;   // 작업자
    JUYA      : char;                    // 주야구분
    REQID     : array [1..20] of char;   // 요청자
    REQDT     : array [1..10] of char;   // 요청일
    BOXNO     : array [1..13] of char;   // 박스번호
    TOPALLET1 : array [1..13] of char;   // TOPALLET1
    TOPALLET2 : array [1..13] of char;   // TOPALLET1
end;


// 사용 : 캐스팅↔조립 실적 매칭 현황 (50980)
type
  TDH_CASTANDJOLIPMATCH = packed record
    HONM       : array [1..20] of char;  // 공정
    ITEMCODE   : array [1..20] of char;  // 품번
    PMNAME     : array [1..50] of char;  // 품명
    STD        : array [1..50] of char;  // 규격
    BOXNO      : array [1..13] of char;  // 박스번호
    RQTY       : integer;                // 양품수량
    BQTY       : integer;                // 불량수량
    ILJA       : array [1..10] of char;  // 작업일자
    SIGAN      : array [1..8]  of char;  // 작업시간
    FDATE      : array [1..10] of char;  // 생산일자  
    IRUM       : array [1..20] of char;  // 작업자
    JUYA       : char;                   // 주야
    CASTNO     : array [1..10] of char;  // 캐스팅번호
    PALLET1    : array [1..13] of char;  // 파렛번호1
    PALLET2    : array [1..13] of char;  // 파렛번호2
    STAT       : char;                   // 상태
    TOPALLET1  : array [1..13] of char;  // TO파렛번호1
    TOPALLET2  : array [1..13] of char;  // TO파렛번호2
    REQID      : array [1..20] of char;  // 요청자
    REQDT      : array [1..10] of char;  // 요청일자
    REGID      : array [1..20] of char;  // 처리자
    REGDT      : array [1..10] of char;  // 처리일자
end;

// 사용 : 반제품 샘플 출고 수정 요청 (관리자용) (49000)
type
  TMS_SAMPLECHOOL = packed record
    SLNAME    : array [1..50] of char;   // 설비코드
    ITEMCODE  : array [1..20] of char;   // 품목코드
    PMNAME    : array [1..50] of char;   // 품목명
    STD       : array [1..50] of char;   // 규격
    BOXNO     : array [1..13] of char;   // 박스번호
    QTY       : integer;                 // 수량
    ILJA      : array [1..10] of char;   // 출고 일자
    SIGAN     : array [1..8]  of char;   // 출고 시간
    HOGI      : array [1..5]  of char;   // 출고호기
    IRUM      : array [1..20] of char;   // 출고자
    SNAEYONG  : array [1..50] of char;   // 내용
end;


// 사용 : 반제품 샘플 출고 수정 요청 현황 (관리자용) (49020)
type
  TMS_SAMPLECHOOL2 = packed record
    SLNAME    : array [1..50] of char;   // 설비코드
    ITEMCODE  : array [1..20] of char;   // 품목코드
    PMNAME    : array [1..50] of char;   // 품목명
    STD       : array [1..50] of char;   // 규격
    BOXNO     : array [1..13] of char;   // 박스번호
    QTY       : integer;                 // 수량
    SNAEYONG  : array [1..50] of char;   // 내용
    ILJA      : array [1..10] of char;   // 출고일자
    SIGAN     : array [1..8]  of char;   // 출고시간
    HOGI      : array [1..5]  of char;   // 출고호기
    IRUM      : array [1..20] of char;   // 출고자
    STAT      : char;                    // 상태
    REQID     : array [1..20] of char;   // 요청자
    REQDT     : array [1..10] of char;   // 요청일자
end;


// 사용 : 사용자 관리 변경 현황 (98140)
type
  TMS_USERMASTER = packed record
    SABUN      : array [1..8]   of char;   // 사번
    IRUM       : array [1..20]  of char;   // 이름
    NAEYONG    : array [1..20]  of char;   // 사용자등급내용
    USECHK     : array [1..6]   of char;   // 사용여부
    STAT       : array [1..4]   of char;   // 상태
    REGID      : array [1..20]  of char;   // 처리자
    REQDTDATE  : array [1..10]  of char;   // 처리일자
    REQDTTIME  : array [1..8]  of char;    // 처리시간
    TOIRUM     : array [1..20]  of char;   // TO이름
    TONAEYONG  : array [1..20]  of char;   // TO사용자등급내용
    TOUSECHK   : array [1..6]   of char;   // TO사용여부
    RMK        : array [1..500] of char;   // 비고
end;


// 사용 : 계정별 메뉴 권한 변경 현황 (98150)
type
  TMS_USER_MENULIST = packed record
    SABUN      : array [1..8]   of char;   // 사번
    IRUM       : array [1..20]  of char;   // 이름
    NAEYONG    : array [1..20]  of char;   // 사용자등급내용
    USECHK     : array [1..6]   of char;   // 사용여부
    STAT       : array [1..4]   of char;   // 상태
    REGID      : array [1..20]  of char;   // 처리자
    REQDTDATE  : array [1..10]  of char;   // 처리일자
    REQDTTIME  : array [1..8]   of char;   // 처리시간
    RMK        : array [1..500] of char;   // 비고
    SEQ        : integer;                  // SEQ
    STATCD     : array [1..2]   of char;   // 상태코드('IN','UP','DE')
end;

// 사용 : 반제품 샘플 출고 조정 현황 (50990)
type
  TMS_SAMPLECHOOL3 = packed record
    TNAME    : array [1..50] of char;  // 출고처
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // 박스번호
    RQTY     : integer;                // 수량
    SNAEYONG : array [1..50] of char;  // 내용
    ILJA     : array [1..10] of char;  // 일자
    SIGAN    : array [1..8]  of char;  // 시간
    HOGI     : array [1..5]  of char;  // 호기
    IRUM     : array [1..20] of char;  // 출고자
    STAT     : char;                   // 상태
    REQID    : array [1..20] of char;  // 요청자
    REQDT    : array [1..10] of char;  // 요청일자   
    REGID    : array [1..20] of char;  // 처리자
    REGDT    : array [1..10] of char;  // 처리일자
end;
                        
// 사용 : 자주검사 및 시료 출고현황 (50130)
type
  TJAJOOCODEVIEW2 = packed record
    PNAME    : array [1..40]  of char;   // 공정구분
    STD      : array [1..50]  of char;   // 규격명
    ITEMCODE : array [1..20]  of char;   // 품목코드
    PLINE    : array [1..5]   of char;   // 라인
    HANGMOK  : array [1..40]  of char;   // 항목
    NAEYONG  : array [1..400] of char;   // 시료데이터
    SIRYO    : integer;                  // 시료수
    ILJA     : array [1..10]  of char;   // 검사날짜
    GSIGAN   : array [1..5]   of char;   // 검사시간대
    SABUN    : array [1..20]  of char;   // 등록자
    JUYA     : char;                     // 주야      
    SIGAN    : array [1..8]   of char;   // 검사시간
    JAJOONO  : array [1..10]  of char;   // 자주검사NO
end;

// 사용 : 자주검사시료 출고 수정 요청 (관리자용) (49010)
type
  TMS_JAJOOCODEVIEW = packed record
    JAJOONO  : array [1..10]  of char;   // 자주검사NO
    PNAME    : array [1..40]  of char;   // 공정구분
    ITEMCODE : array [1..20]  of char;   // 품목코드
    PLINE    : array [1..5]   of char;   // 라인
    ILJA     : array [1..10]  of char;   // 측정일자
    SIGAN    : array [1..8]   of char;   // 측정시간
    SABUN    : array [1..20]  of char;   // 등록자
    JUYA     : char;                     // 주야
end;

// 사용 : 자주검사시료 출고 수정 요청 현황 (관리자용) (49030)
type
  TMS_JAJOOCODEVIEW2 = packed record
    JAJOONO  : array [1..10]  of char;   // 자주검사NO
    PNAME    : array [1..40]  of char;   // 공정구분
    ITEMCODE : array [1..20]  of char;   // 품목코드
    PLINE    : array [1..5]   of char;   // 라인    
    SIRYO    : integer;                  // 실요수량
    ILJA     : array [1..10]  of char;   // 측정일자
    SIGAN    : array [1..8]   of char;   // 측정시간
    SABUN    : array [1..20]  of char;   // 등록자
    JUYA     : char;                     // 주야
    STAT     : char;                     // 상태
    TOSIRYO  : integer;                  // TO실요수량
    REQID    : array [1..20] of char;    // 요청자
    REQDT    : array [1..10] of char;    // 요청일자
end;
                
// 사용 : 자주검사시료 출고 조정 현황 (51000)
type
  TMS_JAJOOCODEVIEW3 = packed record
    JAJOONO  : array [1..10]  of char;   // 자주검사NO
    PNAME    : array [1..40]  of char;   // 공정구분
    ITEMCODE : array [1..20]  of char;   // 품목코드
    PLINE    : array [1..5]   of char;   // 라인    
    SIRYO    : integer;                  // 실요수량
    ILJA     : array [1..10]  of char;   // 측정일자
    SIGAN    : array [1..8]   of char;   // 측정시간
    SABUN    : array [1..20]  of char;   // 등록자
    JUYA     : char;                     // 주야
    STAT     : char;                     // 상태
    TOSIRYO  : integer;                  // TO실요수량
    REQID    : array [1..20] of char;    // 요청자
    REQDT    : array [1..10] of char;    // 요청일자  
    REGID    : array [1..20] of char;    // 처리자
    REGDT    : array [1..10] of char;    // 처리일자
end;

// 사용 : 포장 실적 수정 요청 (관리자용) [49040]
type
  TMS_POJANGINVIEW = packed record
    HONM     : array [1..20] of char;  // 공정정보
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 생산일자
    SIGAN    : array [1..8]  of char;  // 생산시간
    SABUN    : array [1..20] of char;  // 등록자
    JUYA     : char;                   // 주야
    BOXNO    : array [1..13] of char;  // 박스번호
  end;

// 사용 : 포장 실적 수정 요청 현황 (관리자용) [49060]
type
  TMS_POJANGINVIEW2 = packed record
    HONM     : array [1..20] of char;  // 공정정보
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 생산일자
    SIGAN    : array [1..8]  of char;  // 생산시간
    SABUN    : array [1..20] of char;  // 작업자
    JUYA     : char;                   // 주야
    STAT     : char;                   // 상태
    REQID    : array [1..20] of char;  // 요청자
    REQDT    : array [1..10] of char;  // 요청일자
    BOXNO    : array [1..10] of char;  // 박스번호
    PCODE    : char;                   // 공정코드
  end;
      
// 사용 : 포장 실적 조정 현황 [49080]
type
  TMS_POJANGINVIEW3 = packed record
    PCODE    : char;                   // 공정코드
    HONM     : array [1..20] of char;  // 공정정보
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    RQTY     : integer;                // 양품수량
    BQTY     : integer;                // 불량수량
    ILJA     : array [1..10] of char;  // 생산일자
    SIGAN    : array [1..8]  of char;  // 생산시간
    SABUN    : array [1..20] of char;  // 작업자
    JUYA     : char;                   // 주야
    STAT     : char;                   // 상태
    REQID    : array [1..20] of char;  // 요청자
    REQDT    : array [1..10] of char;  // 요청일자
    BOXNO    : array [1..10] of char;  // 박스번호
    REGID    : array [1..20] of char;  // 처리자
    REGDT    : array [1..10] of char;  // 처리일
  end;
                       
// 사용 : 캐스팅 진행중 현황 수정 요청 (관리자용) [49050]
type
  TMS_INGCASTING2 = packed record
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품번
    PMNAME   : array [1..50] of char;  // 품명
    STD      : array [1..50] of char;  // 규격명
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 투입일자
    SIGAN    : array [1..8]  of char;  // 투입시간
end;

// 사용 : 캐스팅 진행중 현황 수정 요청 현황 (관리자용) [49070]
type
  TMS_INGCASTING3 = packed record
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격
    BOXNO    : array [1..13] of char;  // BOX NO
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 투입일자
    SIGAN    : array [1..8]  of char;  // 투입시간
    STAT     : char;                   // 상태
    REQID    : array [1..20] of char;  // 요청자
    REQDT    : array [1..10] of char;  // 요청일자
end;

// 사용 : 캐스팅 진행중 조정 현황 [49090]
type
  TMS_INGCASTING4 = packed record
    PLINE    : array [1..5]  of char;  // 라인
    ITEMCODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격
    RQTY     : integer;                // 수량
    ILJA     : array [1..10] of char;  // 투입일자
    SIGAN    : array [1..8]  of char;  // 투입시간
    STAT     : char;                   // 상태
    REQID    : array [1..20] of char;  // 요청자
    REQDT    : array [1..10] of char;  // 요청일자
    BOXNO    : array [1..13] of char;  // BOX NO   
    REGID    : array [1..20] of char;  // 처리자
    REGDT    : array [1..10] of char;  // 처리일자
end;

// 사용 : 비가동 현황 내역 수정 (관리자용)(49100)
type
  TMS_BIGADONGLISTVIEW = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    IRUM      : array [1..20] of char; // 신고자
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    IDNO      : integer;               // IDNO
    JCODE     : array [1..5] of char;  // 비가동코드
    HCODE     : array [1..5] of char;  // 비가동코드
    TONAEYONG : array [1..50] of char; // TO세부내역
    TONAEYONG2: array [1..50] of char; // TO고장현상
    RMK       : array [1..80] of char; // 수정사유
end;

// 사용 : 비가동 내역 수정 현황 (관리자용)(49110)
type
  TMS_BIGADONGLISTVIEW2 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리세부내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야     
    TONAEYONG : array [1..50] of char; // TO세부내역
    TONAEYONG2: array [1..50] of char; // TO고장현상
    RMK       : array [1..80] of char; // 수정사유
    IDNO      : integer;               // IDNO
end;


// 사용 : 비가동 처리 내역 변경 현황(51010)
type
  TMS_BIGADONGLISTVIEW3 = packed record
    PNAME     : array [1..40] of char; // 공정
    HOGI      : array [1..5] of char;  // 호기
    JOONGDAND : array [1..10] of char; // 중단일자
    JOONGDANT : array [1..8] of char;  // 중단시간
    NAEYONG   : array [1..50] of char; // 세부내역
    IRUM2     : array [1..20] of char; // 처리자
    GADONGD   : array [1..10] of char; // 가동일자
    GADONGT   : array [1..8] of char;  // 가동시간
    NAEYONG2  : array [1..50] of char; // 고장현상
    NAEYONG3  : array [1..50] of char; // 고장원인
    CR_NAE    : array [1..80] of char; // 처리세부내역
    BIGADONG  : integer;               // 비가동시간
    JUYA      : char;                  // 주야
    TONAEYONG : array [1..50] of char; // TO세부내역
    TONAEYONG2: array [1..50] of char; // TO고장현상
    RMK       : array [1..80] of char; // 수정사유
    IDNO      : integer;               // IDNO
    REQID     : array [1..20] of char; // 요청자
    REQDT     : array [1..19] of char; // 요청일자
    REGID     : array [1..20] of char; // 승인자
    REGDT     : array [1..19] of char; // 승인일자
end;
     
// 사용 : 반제품 포장 묶음 처리(40600)
type
  HALFPOJANG_BRCD = packed record
    ITEMCODE : array [1..20] of char;    // 품목코드
    CASTNO   : array [1..10] of char;    // 캐스팅NO
    LOTNO    : array [1..10] of char;    // LOTNO
    KEYNUM   : array [1..10] of char;    // 대표바코드
    QTY      : integer;                  // 총수량
    DANWI    : array [1..5] of char;     // 단위
    SLNAME   : array [1..50] of char;    // 저장위치명
    SLCODE   : array [1..4] of char;     // 저장위치 코드
    STD      : array [1..50] of char;    // 규격
end;                                    
      
// 사용 : 반제품 포장 묶음 취소(40610)
type
  HALFPOJANG_BRCD_DEL = packed record        
    BRCD     : array [1..10] of char;    // 대표번호
    ITEMCODE : array [1..20] of char;    // 품목코드  
    STD      : array [1..50] of char;    // 규격
    CASTNO   : array [1..10] of char;    // 캐스팅NO
    LOTNO    : array [1..10] of char;    // LOTNO
    KEYNUM   : array [1..10] of char;    // 대표바코드
    QTY      : integer;                  // 총수량
    DANWI    : array [1..5] of char;     // 단위
    SLNAME   : array [1..50] of char;    // 저장위치명
end;

// 사용 : 반제품 포장 묶음 처리 현황(40620)
type
  HALFPOJANG_BRCD_SCH = packed record
    BRCD     : array [1..10] of char;    // 대표번호
    ITEMCODE : array [1..20] of char;    // 품목코드
    STD      : array [1..50] of char;    // 규격
    CASTNO   : array [1..10] of char;    // 캐스팅NO
    LOTNO    : array [1..10] of char;    // LOTNO
    KEYNUM   : array [1..10] of char;    // 대표바코드
    QTY      : integer;                  // 총수량
    DANWI    : array [1..5] of char;     // 단위
    SLNAME   : array [1..50] of char;    // 저장위치명
    REGID    : array [1..20] of char;    // 처리자
    REGDT    : array [1..10] of char;    // 처리일시
end;

// 사용 : 반제품 포장 대표번호 재발행(40640)
type
  HALFPOJANG_BRCD_RE = packed record               
    BRCD     : array [1..10] of char;    // 대표번호
    ITEMCODE : array [1..20] of char;    // 품목코드
    STD      : array [1..50] of char;    // 규격
    COUNT    : integer;                  // 캐스팅NO 수량
end;
                                       
// 사용 : 품목코드 조회(10582)
type
  TCASTPTMSTVIEW2 = packed record
    YURACODE : array [1..20] of char;  // 품목코드
    PMNAME   : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // 캐스팅번호
    BRCD     : array [1..10] of char;  // 대표번호
    QTY      : integer;                // 수량
    DANWI    : array [1..5] of char;   // 단위
end;
                          
// 사용 : 출하의뢰 상세(10630)
type
  THALFCHULHAREQL2 = packed record
    ITEMCODE : array [1..20] of char;  // 품목코드
    PNAME    : array [1..50] of char;  // 품목명
    STD      : array [1..50] of char;  // 규격명
    CASTNO   : array [1..10] of char;  // 캐스팅번호  
    BRCD     : array [1..10] of char;  // 대표번호
    SINQTY   : Integer;                // 의뢰수량
    DANWI    : array [1..5] of char;   // 단위
    REMARK   : array [1..50] of char;  // REMARK
end;

// 사용 : 비가동 코드관리(00420)
type
  THNOOPCODE2 = packed record
    LCODE    : array [1..2] of char;   // 코드종류(01.고장현상코드, 02.고장원인코드, 03.고장내용코드)
    CODE     : array [1..5] of char;   // 코드
    NAEYONG  : array [1..50] of char;  // 내용
    NAEYONG2 : array [1..50] of char;  // 코드매칭내용
    MCODE    : array [1..5] of char;   // 코드매칭
    STANDT   : Integer;                // 기준시간
end;

// 사용 : 저장위치별 재고현황(11320)
type
  TSJAJAEWHLIST3 = packed record
    SLCODE   : array [1.. 4] of char; // 창고코드
    SLNAME   : array [1..50] of char; // 창고명
    YURACODE : array [1..20] of char; // 자재코드
    PMNAME   : array [1..50] of char; // 품명
    STD      : array [1..50] of char; // 규격명
    QTY      : integer;               // 입하수량
    DANWI    : array [1..5] of char;  // 단위
    SILSAQTY : integer;               // 실사수량
    DIFFQTY  : integer;               // 차이수량
  end;


// 사용 : 저장위치별 재고실사 상세 현황 (11420)
type 
  TMJAJAELOCLIST2 = packed record
    SLCODE    : array [1.. 4] of char; // 창고코드
    SLNAME    : array [1..50] of char; // 창고명
    YURACODE  : array [1..20] of char; // 자재코드
    PMNAME    : array [1..50] of char; // 품명
    STD       : array [1..50] of char; // 규격명
    OCMNO     : array [1..10] of char; // 납품서번호
    YURASN    : array [1..10] of char; // 유라바코드
    KEYNUMBER : array [1..10] of char; // 대표바코드
    QTY       : integer;               // 수량
    DANWI     : array [1..5] of char;  // 단위
    CKSILSA   : char;                  // 실사여부
  end;

// 사용 : [70940] 창고별 제품 재고실사 현황
type
  TDH_PRODWHLIST2 = packed record
    SLCODE   : array [1..4] of char;  // 저장위치코드
    SLNAME   : array [1..50] of char; // 저장위치명
    REPITEM  : array [1..20] of char; // 대표품번
    ITEMCODE : array [1..20] of char; // 품목코드
    PMNAME   : array [1..50] of char; // 품목명
    STD      : array [1..50] of char; // 규격명
    QTY      : integer;               // 수량
    DANWI    : array [1..5] of char;  // 단위
    SILSAQTY : integer;               // 실사수량
    DIFFQTY  : integer;               // 차이수량
  end;

// 사용 : [70950] 창고별 제품 재고실사 상세 현황
type
  TMJAJAELOCLIST3 = packed record
    SLCODE    : array [1.. 4] of char; // 창고코드
    SLNAME    : array [1..50] of char; // 창고명
    REPITEM   : array [1..20] of char; // 대표품목
    ITEMCODE  : array [1..20] of char; // 품목코드
    PMNAME    : array [1..50] of char; // 품목명
    STD       : array [1..50] of char; // 규격
    CASTNO    : array [1..10] of char; // CASTNO
    LOTNO     : array [1..10] of char; // LOTNO
    BOXNO     : array [1..10] of char; // BOXNO
    KEYNUMBER : array [1..10] of char; // 대표바코드
    QTY       : integer;               // 수량
    DANWI     : array [1..5] of char;  // 단위
    CKSILSA   : char;                  // 실사여부
  end;
                    
  // 사용 : [50280] 일별 생산 종합 모니터링
type
  JOLIP_MONITORING = packed record               
    GADONGD  : array [1..10] of char; // 일자
    BIGADONG : integer;               // 비가동 총시간
    GQTY     : integer;               // 계획수량
    RQTY     : integer;               // 실적수량
    PER      : double;               // 달성률
  end;

// 윤태원 해더 끝 ========================================

implementation

end.
