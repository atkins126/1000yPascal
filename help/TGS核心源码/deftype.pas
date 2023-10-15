unit deftype;

interface

uses
	Windows, SysUtils, Classes, AUtil32;
{$ALIGN 1}
const
   // Packet Message Define
   PACKET_NONE          = 0;
   PACKET_GAME          = 1;
   PACKET_CLIENT        = 2;
   PACKET_GATE          = 3;
   PACKET_DB            = 4;
   PACKET_LOGIN         = 5;
   PACKET_PAID          = 6;
   PACKET_NOTICE        = 7;

   GM_SM_NONE           = 0;
   GM_SM_ADD            = 1;       // ����� �߰�
   GM_SM_DELETE         = 2;       // ���� ���� �ڷ� ���� ���
   GM_SM_REQUESTCLOSE   = 3;       // ������ΰ� ����
//   GM_SM_ADDGUILDNAME = 4;
   GM_SM_ALLOWGUILDNAME = 5;

   GM_CHECK             = 10;
   GM_CHECK_OK          = 11;

   GM_CM_NONE           = 0;
   GM_CM_SAVE           = 1;       // ���ӻ���                               :  ����
   GM_CM_SAVEANDCLOSE   = 2;       // ���� ���ǿ��� �����ڷ� ����� ����   :  ����
   GM_CM_CLOSE          = 3;       // ���� ����� ���� ��û�� �����㰡       :  ����
   GM_CM_ADDGUILDNAME   = 4;
   GM_CM_ALLOWGUILDNAME = 5;

   NATION_KOREA         = 1;
   NATION_TAIWAN        = 2;
   NATION_CHINA_1       = 3;
   NATION_TAIWAN_TEST   = 4;
   NATION_CHINA_1_TEST  = 5;
   NATION_KOREA_TEST    = 6;

{$IFDEF _CHINA}
      NATION_VERSION    = NATION_CHINA_1;
{$ENDIF}

{$IFDEF _TAIWAN}
      NATION_VERSION = NATION_TAIWAN;
{$ENDIF}

//   PROGRAM_VERSION      = 39;
// ����ׯ�汾
   PROGRAM_VERSION      = 40;

   MONEYMAX             = 61000;
   BOSSVIRTUEVALUE      = 10000;

   HAVEITEMSIZE = 30;
   HAVEBASICMAGICSIZE = 20;
   HAVEMAGICSIZE = 30;
   HAVERISEMAGICSIZE = 30;
   HAVEMATERIALITEMSIZE = 5;
   HAVEMARKETITEMSIZE = 10;
   HAVEMYSTERYMAGICSIZE = 30;
   HAVEBESTSPECIALMAGICSIZE = 15;
   HAVEBESTPROTECTMAGICSIZE = 5;
   HAVEBESTATTACKMAGICSIZE = 5;
   TOTALBESTMAGICNUM = 25;
   
   VIEWRANGEWIDTH = 10;
   VIEWRANGEHEIGHT = 8;

   DEFAULTEXP    = 10000;       // �̺�Ʈ�� ��� �⺻ ��ġ

//   EXPTYPE_NORMAL = 0;        // �⺻���� ����ġ ���Ŀ� ���� ��� ����type
//   EXPTYPE_STATIC = 1;        // ����ġ ������ ������� �ʴ� ���� ����ġ ���
   
   OBJECTUPDATETICK = 20;       // ����,NPC���� ������Ʈ �ϴ� �ּ� TICK

   NAME_SIZE      = 19;         // �ѱ� 9 ����
   CAPTION_SIZE   = 40;         // �ѱ� 20 ����

   NOTARGETPHONE = 0;
   MANAGERPHONE  = 1;

   STARTNEWID = 10000;
   USERMANAGERPOST  = 1000;
   FIELDPOST = 100;
   MAXCONDITIONCOUNT = 3;
   
   SAVE_USERDATA_DELAY_TIME = 5 * 60 * 100;

   SAY_COLOR_NORMAL     = 0;
   SAY_COLOR_SHOUT      = 1;
   SAY_COLOR_SYSTEM     = 2;
   SAY_COLOR_NOTICE     = 3;
   SAY_COLOR_TEAM       = 4;

   SAY_COLOR_GRADE0     = 10;
   SAY_COLOR_GRADE1     = 11;
   SAY_COLOR_GRADE2     = 12;
   SAY_COLOR_GRADE3     = 13;
   SAY_COLOR_GRADE4     = 14;
   SAY_COLOR_GRADE5     = 15;
   {
   SAY_COLOR_GRADE6     = 16;
   SAY_COLOR_GRADE7     = 17;
   SAY_COLOR_GRADE8     = 18;
   SAY_COLOR_GRADE9     = 19;
   }

   HANGON_NONE         = 0;

   ITEM_KIND_NONE          = 0;
   ITEM_KIND_COLORDRUG     = 1;
   ITEM_KIND_BOOK          = 2;
   ITEM_KIND_WEARITEM      = 6;
   ITEM_KIND_ARROW         = 7;
   ITEM_KIND_FLYSWORD      = 8;
   ITEM_KIND_GUILDSTONE    = 9;
   ITEM_KIND_DUMMY         = 10;
   ITEM_KIND_STATICITEM    = 11;
   ITEM_KIND_DRUG          = 13;
   ITEM_KIND_TICKET        = 18;
   ITEM_KIND_HIDESKILL     = 19;
   ITEM_KIND_CANTMOVE      = 20;
   ITEM_KIND_ITEMLOG       = 21;
   ITEM_KIND_CHANGER       = 22;
   ITEM_KIND_SHOWSKILL     = 23;
   ITEM_KIND_WEARITEM2     = 24;
   ITEM_KIND_FOXMIRROR     = 25;
   ITEM_KIND_GUILDLETTER   = 26;       // ������õ��
   ITEM_KIND_PICKAX        = 27;       // ���
   ITEM_KIND_MINERAL       = 28;       // ������
   ITEM_KIND_CAP           = 29;       // ���� �Ӹ� �ȳ�����
   ITEM_KIND_PROCESSDRUG   = 30;       // ��������þ�
   ITEM_KIND_HELPDRUG      = 31;       // �����þ�
   ITEM_KIND_GROWTHHERB    = 32;       // �ڶ�� ����
   ITEM_KIND_SKILLROLLPAPER = 33;      // �η縶��
   ITEM_KIND_QUESTITEM     = 34;       // ���ռ����� ���Ǵ� Quest�� ITEM��.
   ITEM_KIND_WATERCASE     = 35;       // ����(����,��������)
   ITEM_KIND_CHARM         = 36;       // ��� �־ �Ӽ��� ����Ǵ� ������ (����Ʈ��)
   ITEM_KIND_QUESTLOG      = 37;       // e.g. ����
   ITEM_KIND_SUBITEM       = 38;       // Ư���� �������� ����ϰ� ������쿡�� �����ؼ� ��ȿ���� ��������
   ITEM_KIND_NAMEDPOSQUEST = 39;       // ?? �̰� ������?
   ITEM_KIND_QUESTITEM2    = 40;       // Quest�� ������������ ��ø������ �����۵�.
   ITEM_KIND_FILL          = 41;       // ������� (�ʺ������� Ȱ��/��/��/���� ä���ִ°�)
   ITEM_KIND_SPECIALEFFECT = 42;       // ������â�� �����鼭 Ư���� �ɷ��� �����ϴ°�
   ITEM_KIND_ADDATTRIBITEM = 43;       // �Ӽ��߰� ������
   ITEM_KIND_GOLDBAG       = 44;       // ���߰��Ǳݳ�
   ITEM_KIND_DAGGEROFOS    = 45;       // �����ǹ����ֵ�
   ITEM_KIND_DUBU          = 46;       // �������� �κ�. �������� ������ ������ߵ�.
   ITEM_KIND_DELATTRIBITEM = 47;       // �Ӽ��� �߰��� �������� �Ӽ��� �����ִ� ������
   ITEM_KIND_TRANSMONSTER  = 48;       // ���ͷ� �����ϰ� ��
   ITEM_KIND_RECOVERYHUMAN = 49;       // �ΰ����� �ٽ� ȸ���ǰ� ��
   ITEM_KIND_GRADEUPQUESTITEM = 50;
   ITEM_KIND_DURABILITY    = 51;       // �������ִ� ��� ������
   ITEM_KIND_TOPLETTER     = 52;       // ����Ŭ���ؼ� ��۶��°�
   ITEM_KIND_GUILDLOTTERY  = 53;       // ���Ĵ��� ����
   ITEM_KIND_SET           = 54;       // ��Ʈ������
   ITEM_KIND_DBLRANDOM     = 55;       // ����Ŭ�������� ������ �����ϰ� �ִ°�
   ITEM_KIND_USESCRIPT     = 56;       // ��ũ��Ʈ �̿��ϴ� ������
   ITEM_KIND_HIGHPICKAX    = 57;       // ��ް��
   ITEM_KIND_SEAL          = 58;       // ���κ���
   ITEM_KIND_EIGHTANGLES   = 59;       // �Ȱ���
   ITEM_KIND_DURAWEAPON    = 60;       // �����������ִ� ����

   ITEM_KIND_EVENT1     = 200;         // �̺�Ʈ�� ������1, ����â���� ������ ��� ������ �������� ȹ�氡����

   ITEM_DRUG_TYPE_A     = 0;           // ������ �ʴ����� �������� �Ӽ�ġ�� ���� �þ� (�������� �����ð����� ������ ��)
   ITEM_DRUG_TYPE_B     = 1;           // ������ ��ü���� ��%������ �����ð����� ��������
   ITEM_DRUG_TYPE_C     = 2;           // �ִ�ġ/�Ӽ��� �������� ���� �ð� ������

   ITEM_ATTRIBUTE_NONE              = 0;  // 0 �ƹ��͵� �ƴ�
   ITEM_ATTRIBUTE_FIRE              = 1;  // 1 ���Ǽ��� ������
   ITEM_ATTRIBUTE_WATER             = 2;  // 2 ���Ǽ��� ������
   ITEM_ATTRIBUTE_ICE               = 3;  // 3 ������� ������
   ITEM_ATTRIBUTE_FILL              = 4;  // 4 Ȱ��, ��, ��, ���� �÷��ִ°�
   ITEM_ATTRIBUTE_SET               = 5;  // 5 ��Ʈ������
   ITEM_ATTRIBUTE_DIRECT            = 6;  // 6 ���̷�Ʈ�� ������â�� �־��� (�ٴڿ� ���������ʰ�) 040422 saset
   ITEM_ATTRIBUTE_PAPERBESTPROTECT  = 7;  // 7 ����������
   ITEM_ATTRIBUTE_PAPERBESTSPECIAL  = 8;  // 8 �ʽ�����
   ITEM_ATTRIBUTE_QUESTSIGN         = 9;  // 9

   ITEM_ATTRIBUTE_TAEGUK            = 199;

   ITEM_ATTRIBUTE_LOWEST            = 201;
   ITEM_ATTRIBUTE_LOWEER            = 202;
   ITEM_ATTRIBUTE_NORMAL            = 203;
   ITEM_ATTRIBUTE_HIGHER            = 204;
   ITEM_ATTRIBUTE_HIGHEST           = 205;

   ITEM_SPKIND_NONE           = 0;
   ITEM_SPKIND_MUNJANG        = 1;
   ITEM_SPKIND_ZANGSIK        = 2;
   ITEM_SPKIND_JUMOON         = 3;
   ITEM_SPKIND_GOLBANG        = 4;    // @���������� ����� �ִ� �����۵�
   ITEM_SPKIND_DELALLBYDURA   = 5;    // �������� �� �Ǹ� delitem�� �����ִ°ͱ��� �Ѳ����� �������°�
   ITEM_SPKIND_DONTDRUG       = 6;    // ���ܼ��簡 ���� �� ���Դ°�...
   ITEM_SPKIND_ADDALLLIFE     = 7;    // Item.sdb���� cLife�ʵ� �ϳ� ������ �Ӹ�/��/�ٸ��Ǳ��� �ø��°�
   ITEM_SPKIND_1              = 8;    // ����
   ITEM_SPKIND_2              = 9;    // ����
   ITEM_SPKIND_3              = 10;    // ����
   ITEM_SPKIND_4              = 11;    // ȣ��


   MOP_KIND_NONE        = 0;
   MOP_KIND_AUTOCALL    = 1;           // ���� ������ member �ʵ忡 �ִ� �� ��ȯ
   MOP_KIND_AUTODIE     = 2;           // ���ʿ� �ڵ����� ����
   MOP_KIND_NEWSKILL    = 3;           // ���ο� ����ġ ���� ����Ǵ� ��
   MOP_KIND_SEAL        = 4;           // ���ε� ����ȣ������ ����

   GATE_KIND_NORMAL        = 0;
   GATE_KIND_BS            = 1;
   GATE_KIND_DOOR          = 2;
   GATE_KIND_SPECIALTIME   = 3;
   GATE_KIND_FIXPOSITION   = 4;
   GATE_KIND_ORDERADDITEM  = 5;       // ����Ʈ ����� additem 3������ ���ؼ� �ִ°� (�̺�) 031002 saset �����ȸ
   GATE_KIND_LIMITUSER     = 6;       // ������ �ο� ������ (�̺�) 031224 saset �絹��
   GATE_KIND_GUILDWAR      = 7;       // �߱� ���Ĵ��� 040307
   GATE_KIND_FIXTIME       = 8;       // ������ �ð����� ���
   GATE_KIND_SPORTSWAR     = 9;
   GATE_KIND_INTOZHUANG    = 10;

   EFFECT_OFF = 0;
   EFFECT_ON = 1;

   BTEFFECT_KIND_NONE   = 0;
   BTEFFECT_KIND_DECLIFE = 1;

   MAP_TYPE_ICE   = 1;            // ������ �Ӽ��� ����
   MAP_TYPE_FIRE  = 2;            // �߰ſ� �Ӽ��� ����
   MAP_TYPE_FILL  = 3;            // �ʺ����� Ȱ��/��/��/���� �÷���
   MAP_TYPE_BATTLE      = 4;      // ������ ���; (����Ʈ���� �̺�Ʈ) 031001 saset
   MAP_TYPE_DONTTICKET  = 5;      // �̵����������ϴ� ����
   MAP_TYPE_KILLONLYONE = 6;      // ���Ͱ� ���� �Ѹ����� ���س��� ���̴�...
   MAP_TYPE_GUILDBATTLE = 7;      // ���Ĵ��� - ������ �ϳ��� ���� �� ���� (�߱��̺�Ʈ)   040310
   MAP_TYPE_POWERLEVEL  = 8;      // �����޿����� Ȱ�¼Ҹ�
   //Author:Steven Date: 2005-01-19 11:35:12
   //Note:
   MAP_TYPE_SPORTBATTLE = 9;      //������
   //========================

   VIRTUALOBJ_KIND_NONE       = 0;
   VIRTUALOBJ_KIND_OASIS      = 1;    // ���ռ��� �縷���ƽý�
   VIRTUALOBJ_KIND_FILLLIFE   = 2;    // �ʺ����� Ȱ��/��/��/���� �÷��ִ°�
   VIRTUALOBJ_KIND_FILLOASISLIFE = 3;  // 1 + 2 ��ģ�� (���뵵 ä���ְ�, Ȱ��/��/��/����/���� �÷���)

   DYNOBJ_EVENT_NONE    = 0;
   DYNOBJ_EVENT_HIT     = 1;
   DYNOBJ_EVENT_ADDITEM = 2;
   DYNOBJ_EVENT_SAY     = 4;
   DYNOBJ_EVENT_BOW     = 8;    // ��������� �̺�Ʈ�߻� ��ġ��...
   DYNOBJ_EVENT_MOVETICK = 9;

   // 0 �ƹ� �̺�Ʈ�� �߻����� ����
   // 1 ������ �̺�Ʈ �߻�
   // 2 �������� ��������� �̺�Ʈ �߻�
   // 4 ���� �ɸ� �̺�Ʈ �߻�
   // 3 ������ ������ ����ְ�
   // 5 ������ ���ϰ�
   // 6 ������ ������� ���ϰ�
   // 7 ������ ������ ����ְ� ���ϰ�
   //------------
   // 8 ��ȭ��� �̺�Ʈ�߻�
   // 9 �̺�Ʈ�� ���� �ٲ�°��� �ƴ� Tick�� ���� ���� �Ҹ�    03.03.31 saset

   DYNOBJ_TYPE_NONE        = 0;
   DYNOBJ_TYPE_CHECKMOVE   = 1;   // �����°��� �����Ǵ°� �������ؼ�  04.02.10 saset

   // ���� �ִ�ġ ���
   JOB_KIND_MAX               = 4;
   JOB_GRADE_MAX              = 6;
   ITEM_GRADE_MAX             = 10;
   ITEM_UPGRADE_MAX           = 4;
//   HERB_YEAR_MAX              = 5;

   JOB_SOUND_TRUE             = '9210';
   JOB_SOUND_FALSE            = '9211';

   // ����
   JOB_KIND_NONE              = 0;
   JOB_KIND_ALCHEMIST         = 1;     // ���ݼ���
   JOB_KIND_CHEMIST           = 2;     // ���ܼ���
   JOB_KIND_DESIGNER          = 3;     // ���İ�
   JOB_KIND_CRAFTSMAN         = 4;     // ����
   JOB_KIND_SMELT             = 99;    // ���ÿ� ���� ���
   JOB_KIND_MINER             = 5;

   // ����
   JOB_GRADE_NONE             = 0;
   JOB_GRADE_NAMELESSWORKER   = 1;     // �����   (���: 100-1999)
   JOB_GRADE_TECHNICIAN       = 2;     // ��ɰ�   (���:2000-3999)
   JOB_GRADE_SKILLEDWORKER    = 3;     // ���ð�   (���:4000-5999)
   JOB_GRADE_EXPERT           = 4;     // ����     (���:6000-7999)
   JOB_GRADE_MASTER           = 5;     // ����     (���:8000-9999)
   JOB_GRADE_VIRTUEMAN        = 6;     // ����     (���:9999 ����Ʈ����Ϸ�)

   EVENTKIND_NONE       = 0;
   EVENTKIND_DIE_DYNOBJ = 1;
   EVENTKIND_DIE_MOP    = 2;

   DEFAULT_WRESTLING  = 0;              // ��ġ�� ����
   DEFAULT_FENCING    = 1;
   DEFAULT_SWORDSHIP  = 2;
   DEFAULT_HAMMERING  = 3;
   DEFAULT_SPEARING   = 4;
   DEFAULT_BOWING     = 5;
   DEFAULT_THROWING   = 6;
   DEFAULT_RUNNING    = 7;
   DEFAULT_BREATHNG   = 8;
   DEFAULT_PROTECTING = 9;

   MAGIC_BOOK_ICON      = 53;

   MAGICCLASS_MAGIC     = 0;          // �⺻����
   MAGICCLASS_RISEMAGIC = 1;          // ��¹���
   MAGICCLASS_MYSTERY   = 2;          // �����  2002-11-12
   MAGICCLASS_BESTMAGIC = 3;          // ���� ���� 2003-09-18

   MAGICRELATION_0      = 0;           //���ǵ幫��
   MAGICRELATION_1      = 1;
   MAGICRELATION_2      = 2;
   MAGICRELATION_3      = 3;           //����ø���
   MAGICRELATION_4      = 4;
   MAGICRELATION_5      = 5;
   MAGICRELATION_6      = 6;           //�Ŀ�����

   MAGICTYPE_WRESTLING  = 0;              // ��ġ�� ����
   MAGICTYPE_FENCING    = 1;
   MAGICTYPE_SWORDSHIP  = 2;
   MAGICTYPE_HAMMERING  = 3;
   MAGICTYPE_SPEARING   = 4;
   MAGICTYPE_BOWING     = 5;
   MAGICTYPE_THROWING   = 6;
   MAGICTYPE_RUNNING    = 7;
   MAGICTYPE_BREATHNG   = 8;
   MAGICTYPE_PROTECTING = 9;
   MAGICTYPE_ECT        = 10;
   MAGICTYPE_ONLYBOWING = 11;
   MAGICTYPE_SPECIAL    = 12;
      MAGICSPECIAL_HIDE = 0;
      MAGICSPECIAL_SAME = 1;
      MAGICSPECIAL_HEAL = 2;
      MAGICSPECIAL_SWAP = 3;
      MAGICSPECIAL_EAT  = 4;
      MAGICSPECIAL_KILL = 5;
      MAGICSPECIAL_PICK = 6;
      MAGICSPECIAL_BLOOD = 7;
      MAGICSPECIAL_CALL = 8;
      MAGICSPECIAL_DEADBLOW = 9;
      MAGICSPECIAL_SHOW = 10;
      MAGICSPECIAL_LAST = 11;
   MAGICTYPE_WINDOFHAND = 13;
   MAGICTYPE_BESTSPECIAL = 14;
      MAGICBEST_NONE    = 0;
      MAGICBEST_PROTECT = 1;           //���� �ʼ���
      MAGICBEST_CRITICAL1 = 2;         //�ʰ�Ÿ, ��Ÿ�� ���� �⸦ �����µ����� ���� �ʻ��

   MAGIC_KIND_NONE      = 0;
   MAGIC_KIND_KYUNGSIN  = 1;           // ��Ź��� ��������...
   MAGIC_KIND_SAPA1     = 2;           // ���� (��õ����)
   MAGIC_KIND_SAPA2     = 3;           // ���� (�Ͽ��Ű�)
   MAGIC_KIND_JUNGPA1   = 4;           // ���� (���ϽŰ�)
   MAGIC_KIND_JUNGPA2   = 5;           // ���� (�ϸ�Ű�)

   MAGICFUNC_NONE       = 0;
   MAGICFUNC_REFILL     = 1;
   MAGICFUNC_8HIT       = 2;
   MAGICFUNC_5HIT       = 3;

   ATTACKTYPE_NONE      = 0;
   ATTACKTYPE_RANDOM    = 1;

   HITTYPE_WRESTLING  = 0;
   HITTYPE_FENCING    = 1;
   HITTYPE_SWORDSHIP  = 2;
   HITTYPE_HAMMERING  = 3;
   HITTYPE_SPEARING   = 4;
   HITTYPE_BOWING     = 5;
   HITTYPE_THROWING   = 6;
   HITTYPE_PICK       = 7;
   HITTYPE_WINDOFHAND = 8;   

   //-----------------------------------------------------------------------------2003-10
   MAGICPATTERNTYPE_PASSIVE = 0;
   MAGICPATTERNTYPE_CONTINUOUS = 1;
   MAGICPATTERNTYPE_LIMIT = 2;

   TYPE_MAGICRELATION_NONE          = 0;    //�������̴�
   TYPE_MAGICRELATION_BASIC         = 1;
   TYPE_MAGICRELATION_RISE          = 2;
   TYPE_MAGICRELATION_BESTPROTECT   = 3;
   TYPE_MAGICRELATION_BESTATTACK    = 4;

   MOTIONTYPE_NONE      = 0;
   MOTIONTYPE_CHARGE    = 1;  //���⸦ ��� �⸦ �����µ���
   MOTIONTYPE_MAGIC     = 2;  //��������
   MOTIONTYPE_CHARGE2   = 3;

   //Ÿ�� ������ �����Ǵ� ���
   RANGETYPE_NONE       = 0;  //���������� �ƴ� ����
   RANGETYPE_CENTER_8   = 1;  //�ڽ��� �߽����� 8�������� ��������
   RANGETYPE_CENTER_4   = 2;  //�ڽ��� �߽����� �ڽ��� �ٶ󺸴� ������ 4���� ��������

   //Ÿ�Ϲ����� �����Ͽ� ������ �ִ� ����
   CRITICMAGIC_FUNC_NONE = 0; //�ش� ��ǥ�� �ִ� Ÿ�� ĳ���� ������ ����
   CRITICMAGIC_FUNC_ME8  = 1; //������ ����� �߽����� 8����
   CRITICMAGIC_FUNC_ME4  = 2; //������ ����� �߽����� 4����
   CRITICMAGIC_FUNC_ME5  = 3; //������ ����� �߽����� 5���� (=5����)
   CRITICMAGIC_FUNC_YOU8 = 10;//�´� ����� �߽����� 8����
   CRITICMAGIC_FUNC_YOU4 = 11;//�´� ����� �߽����� 4����(�´»�������� ��������)
   //--------------------------------------------------------------------------------------

   //Stun���� : ������ ����Ÿ���� Ǯ������°����� ������
   STUN_NONE             = 0; //Stun ���� NO
   STUN_ON               = 1; //Stun ���� ON

   SELECTMAGIC_RESULT_FALSE   = -1;
   SELECTMAGIC_RESULT_NONE    = 0;
   SELECTMAGIC_RESULT_NORMAL  = 1;
   SELECTMAGIC_RESULT_SITDOWN = 2;
   SELECTMAGIC_RESULT_RUNNING = 3;

   RACE_NONE          = 0;
   RACE_HUMAN         = 1;
   RACE_ITEM          = 2;
   RACE_MONSTER       = 3;
   RACE_NPC           = 4;
   RACE_DYNAMICOBJECT = 5;
   RACE_STATICITEM    = 6;

   CLASS_NONE         = 0;
   CLASS_HUMAN        = 1;
   CLASS_MONSTER      = 2;
   CLASS_NPC          = 3;
   CLASS_ITEM         = 4;
   CLASS_DYNOBJECT    = 5;
   CLASS_GUILDSTONE   = 6;
   CLASS_GUILDNPC     = 7;
   CLASS_GATE         = 8;
   CLASS_STATICITEM   = 9;
   CLASS_DOOR         = 10;
   CLASS_SERVEROBJ    = 11;
   CLASS_MINEOBJECT   = 12;

   CREATE_NONE        = 0;
   CREATE_ITEM        = 1;
   CREATE_MONSTER     = 2;

   SPELLTYPE_NONE     = 0;
   SPELLTYPE_POISON   = 1;  // ����

   SPELLTYPE_MAX      = 1;

   INTRESULT_FALSE   = -1;
   INTRESULT_ARREADY = -2;

   PROC_TRUE      = 0;
   PROC_FALSE     = -1;
   PROC_ARREAY    = -2;
   PROC_DONTDROP  = -3;    // �����ʼ� ���� �������� �ϴ°�

   UPDATE_TRUE  = 0;
   UPDATE_FALSE = -1;

   RET_CLOSE_NONE          = 0;
   RET_CLOSE_RUNNING       = 1;
   RET_CLOSE_BREATHNG      = 2;
   RET_CLOSE_ATTACK        = 3;
   RET_CLOSE_PROTECTING    = 4;
   RET_CLOSE_BESTSPECIAL   = 5;       //2003-10
   RET_CLOSE_ECTMAGIC      = 6;
   RET_CLOSE_BESTPROTECT   = 7;  // ���²���

   DELAYEFFECT_NONE    = 0;

   AM_NONE     =  0;
   AM_DIE      =  1;
   AM_STRUCTED =  2;
   AM_SEATDOWN =  3;
   AM_STANDUP  =  4;
   AM_HELLO    =  5;
   AM_MOTION   =  6;

   AM_TURN     =  10;
   AM_TURN1    =  11;
   AM_TURN2    =  12;
   AM_TURN3    =  13;
   AM_TURN4    =  14;
   AM_TURN5    =  15;
   AM_TURN6    =  16;
   AM_TURN7    =  17;
   AM_TURN8    =  18;
   AM_TURN9    =  19;

   AM_MOVE     =  20;
   AM_MOVE1    =  21;
   AM_MOVE2    =  22;
   AM_MOVE3    =  23;
   AM_MOVE4    =  24;
   AM_MOVE5    =  25;
   AM_MOVE6    =  26;
   AM_MOVE7    =  27;
   AM_MOVE8    =  28;
   AM_MOVE9    =  29;

   AM_HIT      =  30;
   AM_HIT1     =  31;
   AM_HIT2     =  32;
   AM_HIT3     =  33;
   AM_HIT4     =  34;
   AM_HIT5     =  35;
   AM_HIT6     =  36;
   AM_HIT7     =  37;
   AM_HIT8     =  38;
   AM_HIT9     =  39;

   AM_TURNNING  =  40;
   AM_TURNNING1 =  41;
   AM_TURNNING2 =  42;
   AM_TURNNING3 =  43;
   AM_TURNNING4 =  44;
   AM_TURNNING5 =  45;
   AM_TURNNING6 =  46;
   AM_TURNNING7 =  47;
   AM_TURNNING8 =  48;
   AM_TURNNING9 =  49;

   AM_HIT10          = 50;
      STEP_START = 1;
      STEP_NEXT  = 2;
      STEP_CHANGE = 3;
   AM_HIT10_READY    = 51;
   AM_HIT11          = 52;
   AM_HIT11_READY    = 53;

   //53~63���� ������ ����.
   AM_SHIT_START           = 54;
   AM_SHIT_READY_START     = 55; //�ǰ˵�â��

   AM_SHIT_WRESTLE       = 54;
   AM_SHIT_WRESTLE_READY = 55;
   AM_SHIT_SWORD         = 56;
   AM_SHIT_SWORD_READY   = 57;
   AM_SHIT_BLADE         = 58;
   AM_SHIT_BLADE_READY   = 59;
   AM_SHIT_SPEAR         = 60;
   AM_SHIT_SPEAR_READY   = 61;
   AM_SHIT_AXE           = 60;
   AM_SHIT_AXE_READY     = 61;

   {
    HITTYPE_WRESTLING  = 0;
   HITTYPE_FENCING    = 1;
   HITTYPE_SWORDSHIP  = 2;
   HITTYPE_HAMMERING  = 3;
   HITTYPE_SPEARING   = 4;
   HITTYPE_BOWING     = 5;
   HITTYPE_THROWING   = 6;
   HITTYPE_PICK       = 7;
   HITTYPE_WINDOFHAND = 8;
   }
   

{  // �߰��Ұ�
   AM_TURN     =  10;
   AM_TURN1    =  11;
   AM_TURN2    =  12;
   AM_TURN3    =  13;
   AM_TURN4    =  14;
   AM_TURN5    =  15;
   AM_TURN6    =  16;
   AM_TURN7    =  17;
   AM_TURN8    =  18;
   AM_TURN9    =  19;
   AM_TURN10   =  20;
   AM_TURN11   =  21;
   AM_TURN12   =  22;
   AM_TURN13   =  23;
   AM_TURN14   =  24;
   AM_TURN15   =  25;
   AM_TURN16   =  26;
   AM_TURN17   =  27;
   AM_TURN18   =  28;
   AM_TURN19   =  29;

   AM_MOVE     =  30;
   AM_MOVE1    =  31;
   AM_MOVE2    =  32;
   AM_MOVE3    =  33;
   AM_MOVE4    =  34;
   AM_MOVE5    =  35;
   AM_MOVE6    =  36;
   AM_MOVE7    =  37;
   AM_MOVE8    =  38;
   AM_MOVE9    =  39;
   AM_MOVE10   =  40;
   AM_MOVE11   =  41;
   AM_MOVE12   =  42;
   AM_MOVE13   =  43;
   AM_MOVE14   =  44;
   AM_MOVE15   =  45;
   AM_MOVE16   =  46;
   AM_MOVE17   =  47;
   AM_MOVE18   =  48;
   AM_MOVE19   =  49;

   AM_HIT      =  50;
   AM_HIT1     =  51;
   AM_HIT2     =  52;
   AM_HIT3     =  53;
   AM_HIT4     =  54;
   AM_HIT5     =  55;
   AM_HIT6     =  56;
   AM_HIT7     =  57;
   AM_HIT8     =  58;
   AM_HIT9     =  59;
   AM_HIT10    =  60;
   AM_HIT11    =  61;
   AM_HIT12    =  62;
   AM_HIT13    =  63;
   AM_HIT14    =  64;
   AM_HIT15    =  65;
   AM_HIT16    =  66;
   AM_HIT17    =  67;
   AM_HIT18    =  68;
   AM_HIT19    =  69;

   AM_TURNNING   =  70;
   AM_TURNNING1  =  71;
   AM_TURNNING2  =  72;
   AM_TURNNING3  =  73;
   AM_TURNNING4  =  74;
   AM_TURNNING5  =  75;
   AM_TURNNING6  =  76;
   AM_TURNNING7  =  77;
   AM_TURNNING8  =  78;
   AM_TURNNING9  =  79;
   AM_TURNNING10 =  70;
   AM_TURNNING11 =  71;
   AM_TURNNING12 =  72;
   AM_TURNNING13 =  73;
   AM_TURNNING14 =  74;
   AM_TURNNING15 =  75;
   AM_TURNNING16 =  76;
   AM_TURNNING17 =  77;
   AM_TURNNING18 =  78;
   AM_TURNNING19 =  79;
}

   ARR_BODY           = 0;
   ARR_GLOVES         = 1;
   ARR_UPUNDERWEAR    = 2;
   ARR_SHOES          = 3;
   ARR_DOWNUNDERWEAR  = 4;

   ARR_UPOVERWEAR     = 6;
   ARR_HAIR           = 7;
   ARR_CAP            = 8;
   ARR_WEAPON         = 9;

   //2003-04-04
   ROLE_NONE            = 0;
   ROLE_HEAVY_FIGHTER   = 1;
   ROLE_LIGHT_FIGHTER   = 2;
   ROLE_BOWMAN          = 3;
   ROLE_HANDMAN         = 4;

   ADDATTRIB_ARMOR      = 6;
   ADDATTRIB_CAP        = 8;
   ADDATTRIB_ARMARMOR   = 1;
   ADDATTRIB_SHOES      = 3;
   ADDATTRIB_WEAPON     = 9;

   DR_0              = 0;
   DR_1              = 1;
   DR_2              = 2;
   DR_3              = 3;
   DR_4              = 4;
   DR_5              = 5;
   DR_6              = 6;
   DR_7              = 7;
   DR_DONTMOVE       = 8;

   FM_STRING         = 253;
   FM_REBOOT         = 254;
   FM_NONE           = 0;
   FM_CREATE         = 1;
   FM_DESTROY        = 2;
   FM_SHOW           = 3;
   FM_HIDE           = 4;
   FM_MOVE           = 5;
   FM_HIT            = 8;
   FM_SAY            = 9;
   FM_PICKUP         = 11;
   FM_TURN           = 12;
   FM_STRUCTED       = 15;
   FM_CHANGEFEATURE  = 16;
   FM_GIVEMEADDR     = 20;
   FM_ADDATTACKEXP   = 23;
   FM_ADDWINDOFHANDEXP = 24;
   FM_ADDEXTRAEXP    = 25;
   FM_ADDITEM        = 27;
   FM_DELKEYITEM     = 28;
   FM_ADDMONEY       = 29;
   FM_DELMONEY       = 30;
   FM_TURNDAMAGE     = 31; //2003-10

   FM_SOUNDBASE      = 64;
   FM_GOTOXY         = 73;
   FM_MOTION         = 74;
   FM_DELITEM        = 75;

   FM_GATHERVASSAL   = 76;


   FM_SHOUT          = 100;
   FM_WITHME         = 101;
   FM_ADDPROTECTEXP  = 102;

   FM_SYSOPMESSAGE   = 103;
   FM_BOW            = 104;
   FM_CURRENTUSER    = 105;

   FM_SOUND          = 106;
   FM_CLICK          = 107;

   FM_SAYUSEMAGIC    = 108;
   FM_GUILDATTACK    = 109;

   FM_GATE           = 110;

   FM_ENOUGHSPACE    = 111;

   FM_ALLOWGUILDNAME = 112;
   FM_ALLOWGUILDSYSOPNAME = 113;


   FM_CANCELEXCHANGE = 114;
   FM_SHOWEXCHANGE   = 115;

   FM_REFILL         = 116;

   FM_DBLCLICK       = 117;
   FM_CHANGEPROPERTY = 118;
   FM_REMOVEGUILDMEMBER = 119;
   FM_CHECKGUILDUSER = 120;
   FM_DEADHIT        = 121;
   FM_HEAL           = 122;
   FM_KILL           = 123;
   FM_LIFEPERCENT    = 124;
   FM_IAMHERE        = 125;
   
   FM_ADDALLYGUILD   = 126;
   FM_DELALLYGUILD   = 127;
   FM_AGREEALLYGUILD = 128;
   FM_SELFSAY        = 129;
   FM_SPELL          = 130;
   FM_ADDVIRTUEEXP   = 131;
   FM_APPROACH       = 132;
   FM_AWAY           = 133;
   FM_ZONEEFFECT     = 134;
   FM_CHANGESTATE    = 135;
   FM_CHANGESTEP     = 136;
   FM_AFTERCREATE    = 137;
   FM_BEFOREDESTROY  = 138;
   FM_PICK           = 139;
   FM_ADDHERBAMOUNT  = 140;
   FM_ADDMINEAMOUNT  = 141;
   FM_DECDEPOSIT     = 142;
   FM_REPOSITION     = 143;
   FM_BACKMOVE       = 144;
   FM_SAYSYSTEM      = 145;
   FM_CHANGEDURAWATERCASE = 146;
   FM_WINDOFHAND     = 147;
   FM_WINDOFHANDEFFECT = 148;
   FM_SETPOSITION    = 149;
   FM_FILLLIFE       = 150;         // �ʺ����� ����Ϳ��� Ȱ��/��/��/���� ä��°�
   FM_SETEFFECT      = 151;         //2003-10
   FM_CRITICAL       = 152;         //2003-10
   FM_ADDLIFEORENERGY = 153;        //2003-10
   //Author:Steven Date: 2005-01-31 15:59:53
   //Note:
   FM_ADDMINEREXP    = 154;
   //=======================================
   PM_LETMEIN     = 1;
   PM_LETMEOUT    = 2;

   MM_SHOW           = 1;
   MM_HIDE           = 2;
   MM_MOVE           = 3;

   SM_SETCLIENTCONDITION   = 2;

   SM_MSGANDCLOSE    = 252;
   SM_CONNECTTHRU    = 253;
   SM_RECONNECT      = 254;
   SM_CLOSE          = 255;   // ���� Ʋ������
   SM_NONE           =  0;
   SM_WINDOW         =  1;
   SM_MESSAGE        =  2;
      MESSAGE_NONE         = 0;
      MESSAGE_LOGIN        = 1;
      MESSAGE_CREATELOGIN  = 2;
      MESSAGE_SELCHAR      = 3;
      MESSAGE_GAMEING      = 4;
      MESSAGE_AGREE        = 5;

   SM_CHARINFO       = 3;
   SM_CHATMESSAGE    = 4;

   SM_ATTRIBBASE     = 5;
   SM_HAVEITEM       = 6;
   SM_HAVEMAGIC      = 7;
   SM_WEARITEM       = 8;

   SM_NEWMAP         = 9;
   SM_SHOW           = 10;
   SM_HIDE           = 11;
   SM_SAY            = 12;
   SM_MOVE           = 13;
   SM_TURN           = 15;
   SM_SETPOSITION    = 16;

   SM_CHANGEFEATURE  = 18;
   SM_MAGIC          = 19;
   SM_SOUNDBASE      = 21;

   SM_MOTION         = 22;

   SM_ATTRIB_VALUES     = 23;
   SM_ATTRIB_FIGHTBASIC = 24;
   SM_ATTRIB_LIFE       = 25;

   SM_EVENTSTRING     = 26;
   SM_STRUCTED        = 27;

   SM_SHOWITEM        = 28;
   SM_SHOWMONSTER     = 29;
   SM_HIDEITEM        = 30;
   SM_HIDEMONSTER     = 31;

   SM_USEDMAGICSTRING = 32;
   SM_MOVINGMAGIC     = 33;

   SM_BASICMAGIC      = 34;
   SM_SOUNDSTRING     = 35;

   SM_SAYUSEMAGIC     = 36;
   SM_BOSHIFTATTACK   = 37;

   SM_RAINNING        = 38;
   SM_SOUNDBASESTRING = 39;

   SM_SOUNDBASESTRING2= 40;
   SM_SOUNDEFFECT     = 41;

   SM_SHOWINPUTSTRING = 42;

   SM_HIDEEXCHANGE    = 43;
   SM_SHOWEXCHANGE    = 44;

   SM_SHOWCOUNT       = 45;
   SM_CHANGEPROPERTY  = 46;

   SM_SHOWDYNAMICOBJECT = 47;
   SM_HIDEDYNAMICOBJECT = 48;
   SM_CHANGESTATE       = 49;

   SM_SHOWSPECIALWINDOW = 50;

   SM_SSAMZIEITEM       = 51;
   SM_CHECK             = 52;

   // for Battle Server
   SM_SHOWBATTLEBAR     = 53;    // ���δ������� ȭ������ Ȱ�¹ٸ� ǥ��
   SM_SHOWCENTERMSG     = 54;    // �߾ӿ� �簢���� �׸��� ���ڸ� ���

   // saset
   SM_HIDESPECIALWINDOW = 55;    // ȭ�鿡 ���ִ� SpecialWindow �� �ݵ��� Ŭ���̾�Ʈ���� ��û�Ѵ�
   SM_NETSTATE          = 56;

   SM_MINIMAP           = 57;
   SM_SHOWTOPMSG        = 58;
   SM_SETSHORTCUT       = 59;

   SM_PASSWORD          = 60;     // �������, �����ۺ��
   SM_HAVERISEMAGIC     = 61;     // ��¹���

   SM_SETPOWERLEVEL     = 62;     // ���ⷹ��â ����
   SM_STARTHELPWINDOW   = 63;     // F1â, ����Ʈâ
   SM_ITEMHELPWINDOW    = 64;     // ������â

   SM_TRADEWINDOW       = 65;
   SM_SHOWTRADEWINDOW   = 66;
   SM_SETTRADEITEM      = 67;
   SM_SKILLWINDOW       = 68;    // ���â ��ﶧ ���� ���� (����,����,�����̸�,����ShapeNo)
   SM_JOBRESULT         = 69;    // ���� ���� ����, �޼���
   // SM_PROCESSITEM       = 70;    // ���� ���� ����, �޼���
   SM_MATERIALITEM      = 70;    //
   SM_SHOWSALEWINDOW    = 71;
   SM_SETSALEITEM       = 72;
   SM_ITEMHELPWINDOW2   = 73;     // ������â Ver2
   SM_BACKMOVE          = 74;
   SM_SYSTEMINFO        = 75;
   SM_HAVEMYSTERY       = 76;
   SM_MARKETWINDOW      = 77;             // �����Ǹ�â
   SM_MARKETITEM        = 78;             // �����Ǹ�â item������
   SM_SHOWMARKETCOUNT   = 79;             // �����Ǹ�â�� ���Ǵ� ����â
   SM_SHOWINDIVIDUALMARKETWINDOW = 80;    // �ٸ������� �����ǸŹ��� ��� â
   SM_CONFIRMMARKET     = 81;
   SM_TIME              = 82;     // SCREEN CAPTURE �� �ð� �˾Ƴ���
   SM_MESSENGER         = 83;             // �����޼���...                        03.03.03. saset
   SM_SIDEMESSAGE       = 84;             // chat�޼��� �и�... ���ʾƷ�...       03.02.24. saset
   SM_BATTLEINFO        = 85;             // ���δ����� ����                      03.06.23. saset
   SM_HAVEBESTMAGIC     = 86;
   SM_EXTRAATTRIB_VALUES= 87;             //Extra ����ġ �� AddableStatePoint�� ���� �޼���
   SM_SHOWBESTATTACKMAGICWINDOW = 88;
   SM_SHOWBESTPROTECTMAGICWINDOW = 89;
   SM_SHOWBESTSPECIALMAGICWINDOW = 90;
   SM_SETEFFECT         = 91;             //2003-10 Effect�� ���� �޼���
   SM_SETACTIONSTATE    = 92;             //2003-10 ������ ����ȭ�� ����
   SM_SCREENEFFECT      = 93;             //2003-10 Ư��ȿ��Screen
   SM_SHOWEVENTINPUT    = 94;             //�̺�Ʈ�޼��� �Է�â����
   SM_SHOWEVENTMSG      = 95;             //�̺�Ʈ�޼��� ����ϱ�
   SM_ABILITYATTRIB     = 96;             // ĳ���� �ɷ�ġ �Ӽ�
   SM_ITEMHELPWINDOW3   = 97;             // ������â Ver3 (��ư�߰�)

   SM_CHARMOVEFRONTDIEFLAG = 255; // �ӽû�� �ɸ��Ͱ� ����������� �������� �ִ� ��츦 TRUE�� ����

  //Author:Steven Date: 2004-12-12 11:07:15
  //Note:
  SM_ISINVITETEAM = 98;
  SM_TEAMMEMBERLIST = 99;
  //======================================
   SM_MARRYWINDOW       = 100;             // Marry With Who Windows;
   SM_MARRYANSWERWINDOW = 101;
   SM_UNMARRY           = 102;
   SM_GUILDITEM         = 103;

   //Author:Steven Date: 2005-01-10 17:30:28
   //Note:
   SM_INPUTGUILDNAMEWINDOW   = 104;
   SM_GUILDINFOWINDOW        = 105;
   //====================================

   SM_GUILDMONEYCHIPWINDOW   = 106;
   SM_GUILDMONEYAPPLYWINDOW  = 107;
   SM_GUILDINFO              = 108;
   SM_GUILDENERGY            = 109;
   SM_GUILDSUBSYSOP          = 200;
   SM_ARENAWINDOW            = 201;
   SM_ARENAJOINWINDOW        = 202;
   SM_GUILDANSWERWINDOW      = 203;

   WINDOW_NONE        = 0;
   WINDOW_ITEMS       = 1;
   WINDOW_WEARS       = 2;
   WINDOW_SCREEN      = 3;
   WINDOW_BASICFIGHT  = 4;
   WINDOW_MAGICS      = 5;

   WINDOW_EXCHANGE    = 6;
   WINDOW_SSAMZIEITEM = 7;
   WINDOW_ALERT       = 8;
      ALERT_NONE           = 0;
      ALERT_MESSAGE        = 1;
      ALERT_INFORMATION    = 2;
      ALERT_GAMEAGREE      = 3;

   WINDOW_AGREE       = 9;
      AGREE_NONE           = 0;
      AGREE_ALLYGUILD      = 1;

   WINDOW_GUILDMAKE   = 10;
   WINDOW_GUILDINFO   = 11;
   WINDOW_GUILDWAR1   = 12;
   WINDOW_GUILDWAR2   = 13;
   WINDOW_GUILDMAGIC  = 14;

   WINDOW_RISEMAGICS  = 15;   // ��¹���â
   WINDOW_POWERLEVEL  = 16;   // ����ܰ�â

   WINDOW_HELP        = 17;   // ���� â
   WINDOW_TRADE       = 18;   // �Ÿ�â
   WINDOW_SKILL       = 19;   // ���â

   // USE BATTLE SERVER
   WINDOW_GROUPWINDOW = 20;
   WINDOW_ROOMWINDOW  = 21;
   WINDOW_GRADEWINDOW = 22;

   WINDOW_SALE        = 23;    // ���� �Ÿ�â
   WINDOW_MYSTERYMAGICS = 24;  // 2002-11-07
   WINDOW_MARKET      = 25;    // �����Ǹ�â (���� �ȼ��ִ� ������ ����� â)
   WINDOW_INDIVIDUALMARKET = 26;  // �������� ����ִ� �����Ǹ�â
   WINDOW_BESTMAGIC     = 28;
   WINDOW_SHORTCUT      = 29;

   AGREE_GUILDMAKE    = 0;

  //Author:Steven Date: 2004-12-12 11:11:03
  //Note:
  WINDOW_CONFIRM = 30;
  AGREE_INVITATION = 0;
  DISAGREE_INVITATION = 1;
  WINDOW_TEAMMEMBERLIST = 31;
  //=======================================

   WINDOW_GUILDITEMLOG = 32;

   DRAGACTION_NONE              = 0;
   DRAGACTION_DROPITEM          = 2;
   DRAGACTION_ADDEXCHANGEITEM   = 15;

   DRAGACTION_FROMITEMTOLOG     = 16;
   DRAGACTION_FROMLOGTOITEM     = 17;

   DRAGACTION_FROMITEMTOTRADE   = 18;    // ����â
   DRAGACTION_FROMTRADETOITEM   = 19;

   DRAGACTION_FROMITEMTOSKILL   = 20;   // �������â
   DRAGACTION_FROMSKILLTOITEM   = 21;

   DRAGACTION_FROMITEMTOSALE    = 22;
   DRAGACTION_FROMSALETOITEM    = 23;

   DRAGACTION_SMELTITEM         = 24;     // ���ý� ����â
   DRAGACTION_SMELTITEM2        = 25;     // �����Ѱ� ��ȯ�� ����â

   DRAGACTION_FROMINDIVIDUALMARKETTOITEM  = 26;     // �����Ǹ��ϴ� �Ÿ�â

   DRAGACTION_FROMGUILDTOITEM   = 27;
   DRAGACTION_FROMITEMTOGUILD   = 28;

   CM_IPADDR          = 251;

   CM_NONE            =  0;
   CM_CLOSE           =  1;
   CM_VERSION         =  2;
   CM_IDPASS          =  3;
   CM_CREATEIDPASS    =  4;
   CM_CHANGEPASSWORD  =  5;
   CM_CREATECHAR      =  6;
   CM_DELETECHAR      =  7;
   CM_SELECTCHAR      =  8;
   CM_SOUND           =  9;
   CM_TURN            = 10;
   CM_MOVE            = 11;
   CM_SAY             = 12;
   CM_HIT             = 13;
   CM_PICKUP          = 14;
   CM_KEYDOWN         = 19;
   CM_CLICK           = 20;
   CM_DBLCLICK        = 21;
   CM_DRAGDROP        = 22;
   CM_CLICKPERCENT    = 23;
   CM_CREATEIDPASS2   = 24;
   CM_IDPASSAZACOM    = 25;
   CM_INPUTSTRING     = 26;
   CM_SELECTCOUNT     = 27;
   CM_CANCELEXCHANGE  = 28;
   CM_MOUSEEVENT      = 29;
   CM_WINDOWCONFIRM   = 30;
   CM_CHECK           = 31;
   CM_MAKEGUILDDATA   = 32;
   CM_GUILDINFODATA   = 33;
   CM_AGREEDATA       = 34;
   CM_MAKEGUILDMAGIC  = 35;
   CM_NETSTATE        = 36;
   CM_CREATEIDPASS3   = 37;
   CM_MINIMAP         = 38;
   CM_SETSHORTCUT     = 39;
   CM_PASSWORD        = 40;
   CM_SELECTHELPWINDOW = 41;
   CM_SELECTITEMWINDOW = 42;
   CM_TRADEWINDOW     = 43;
   CM_SKILLWINDOW     = 44;
   CM_MAKEITEM        = 45;
   CM_PROCESSITEM     = 46;
   CM_SYSTEMINFO      = 47;
   CM_CONFIRMMARKET   = 48;
   CM_SELECTMARKETCOUNT = 49;    // �����Ǹ�â����â
   CM_GETTIME         = 50;      // SCREEN CAPTURE �� �ð� �˾Ƴ���
   CM_BATTLECONFIRM   = 51;      // ���δ����� ��ư
   CM_BATTLEINFO      = 52;      // ���δ����� ����
   CM_ADDSTATEPOINT   = 53;      // StatePoint ������Ű�� 2003-10
   CM_EVENTINPUT      = 54;      // �߷�Ÿ�ε��� �̺�Ʈ �����Է�
   CM_SETMATERIAL     = 55;      // �������â ��ἳ��
   CM_ITEMBUTTON      = 56;      // �����ۼ���â�� �߰���ư
   // add by Orber at 2004-09-07 16:17
   CM_LOCKITEM        = 57;       //��������
   CM_UNLOCKITEM      = 58;       //��������

  //Author:Steven Date: 2004-12-12 13:25:13
  //Note:
   CM_COMFIRMINVITATION = 59;     //????????
   CM_TEAMMEMBERLIST  = 60;
  //======================================

   CM_MARRY           = 61;       //Ask Marry with who
   CM_MARRYANSWER     = 62;       //Answer Marry with who
   CM_UNMARRY         = 63;
   CM_GUILDITEMPAGE   = 64;
   CM_INPUTGUILDNAME  = 65;
   //====================================
   CM_GUILDMONEYCHIP  = 66;
   CM_GUILDMONEYAPPLY = 67;
   CM_GUILDSUBSYSOP = 68;
   CM_ARENAWINDOW = 99;     //�������ȷ����Ϣ
   CM_ARENAJOINWINDOW = 100;     //�������ȷ����Ϣ
   CM_GUILDANSWERWINDOW = 101;


   DB_CHECKCONNECT     = 1;
   DB_STRING           = 2;
   DB_CHECKCONNECT_OK  = 3;
   DB_USERFIELDS       = 4;

   HAVEITEMMAXCOUNT     = 3;

   RAINTYPE_RAIN        = 0;
   RAINTYPE_SNOW        = 1;

   NPCFT_NONE           = 0;
   NPCFT_SELL           = 1;
   NPCFT_BUY            = 2;
   NPCFT_DEAL           = 3;
   NPCFT_SAY            = 4;
   NPCFT_HELP           = 5;
   NPCFT_QUEST          = 6;

   NPCFT_GUILDWAR       = 7;

   //2002-10-18
   MONSTER_EVENT_TYPE_NONE       = 0 ;
   MONSTER_EVENT_TYPE_SELFDIE    = 1 ;

  //Author:Steven Date: 2004-12-13 10:19:31
  //Note:��������������
  MAX_TEAM_MEMBER = 8;
  //=====================================

type

   TEffectData = packed record
     rWavNumber : integer;
     rPercent : integer; // 100����
   end;
   PTEffectData = ^TEffectData;

   TConditionData = packed record
      rEffectNumber : integer;
      rEndTick : integer;
   end;
   PTConditionData = ^TConditionData;
   
   TDbkey = packed record
     rmsg : byte;
     rconid: integer;
     rkey : word;
   end;
   PTDbKey = ^TDbKey;

   TDbString = packed record
     rmsg : byte;
     rconid: integer;
     rWordString : TWordString;
   end;
   PTDbString = ^TDbString;

   TNameString = array [0..NAME_SIZE-1] of byte;       // �ѱ� 9����
   PTNameString = ^TNameString;   
   TCaptionString = array [0..CAPTION_SIZE-1] of byte;       // �ѱ� 9����

   TLightDark = (gld_light, gld_dark);
   TFeatureState = (wfs_normal, wfs_care, wfs_sitdown, wfs_die, wfs_running, wfs_running2, wfs_shop);
   THiddenState = (hs_100, hs_0, hs_1, hs_99 );
   TActionState = (as_free, as_ice, as_slow );
   TLightEffectKind = ( lek_none, lek_follow, lek_followdir, lek_hit10, lek_off, lek_continue, lek_round );    

   TFeature = packed record
     rrace: byte;                     // ���, ������, ����,
     raninumber: byte;
     rfeaturestate : TFeatureState;          // 0 = normal, 1 = fight, 2 = die
     rboman : Boolean;
     rhitmotion : byte;
     rArr : array [0..31] of byte;    // ������� ¦�� �̹��� Ȧ�� ����   >> �Ӹ�ī��, ��, ...
     rImageNumber : word;             // �����̳�, �������ϰ��.
     rImageColorIndex : byte;         // ���� ����
     rTeamColor: word;                // ��� ����
     rNameColor: word;                // �̸� ����
     rHideState : THiddenState;
     rActionState : TActionState;
     rEffectNumber : word;
     rEffectKind : TLightEffectKind;
     rFlyHeight : Word;               // ���, ��� �� �ߴ� ����
   end;

   // add by minds 040323
   TEncFeature = array[0..64-1] of byte;
   TEncCharPos = array[0..16-1] of byte;

   TBasicData = packed record
     P : Pointer;
     id : longint;
     Feature : TFeature;
     dir, x, y, nx, ny: word;
     Name : TNameString;
     ViewName : TNameString;
     Guild: TNameString;
     ServerName : TNameString;
     ServerID   : integer;
     MarketName : TNameString;
     ClassKind : Byte;
     LifePercent : Byte;
     GuardX : array [0..20 - 1] of ShortInt;
     GuardY : array [0..20 - 1] of ShortInt;
     MonType : Integer;

     conditionData : array [0..MAXCONDITIONCOUNT-1] of TConditionData;
   end;
   PTBasicData = ^TBasicData;

   TStateData = packed record
      damageBody : integer;
      damageHead : integer;
      damageArm : integer;
      damageLeg : integer;
      damageenergy : integer;
      armorBody : integer;
      armorHead : integer;
      armorArm : integer;
      armorLeg : integer;
      armorenergy : integer;
   end;
   PTStateData = ^TStateData;

   TLifeData = packed record
     damageBody : integer;
     damageHead : integer;
     damageArm : integer;
     damageLeg : integer;
     damageenergy : integer;
     armorBody : integer;
     armorHead : integer;
     armorArm : integer;
     armorLeg : integer;
     armorenergy : integer;
     armorevalue : integer;
     AttackSpeed : integer;
     Accuracy : Integer;            // ��Ȯ��
     avoid : integer;
     KeepRecovery : Integer;        // �ڼ�����
     recovery : integer;
     HitArmor : Integer;
     damageExp : Integer;
     armorExp : Integer;
     longavoid : integer;
     SpellResistRate : array [0..SPELLTYPE_MAX - 1] of Byte;
   end;
   PTLifeData = ^TLifeData;

   {
   TEnergyPointData = packed record
      rEnergyPoint : array [0..3-1] of Integer;
   end;
   PTEnergyPointData = ^TEnergyPointData;
   }
   THitData = packed record
      damageBody: integer;
      damageHead: integer;
      damageArm : integer;
      damageLeg : integer;
      damageEnergy : integer;
      ToHit : integer;

      HitType : integer;
      HitLevel : integer;
      boHited : Boolean;
      HitedCount : integer;
      _3HitCount : Integer;   //2003-10
      _3HitTick  : Integer;   //2003-10
      HitFunction : integer;
      HitFunctionSkill : integer;
      Virtue : Integer;
      Accuracy : Integer;
      dir : word;
      LifeStealValue : Integer;
      EnergyStealValue : Integer;
      Stun : byte;
      EffectNumber : integer;
      damageExp               : Integer;
      cPowerLevel             : Integer;
      Race                    : Byte;
      GroupKey                : Word;
      MagicType               : Byte;
      MagicRelation           : Integer;
      CosumeEnergy            : Integer;      
      Grade                   : integer;
      PickConst               : Integer;
      ShortExp, RiseShortExp  : Integer;         //�ٰŸ� ���ݽ� ���������� �ִ� ����ġ
      LongExp, RiseLongExp    : Integer;         //���Ÿ� ���ݽ� ���������� �ִ� ����ġ
      HandExp                 : Integer;         //��� ���ݽ� ���������� �ִ� ����ġ
      _3HitExp                : Integer;         //2003-10 �������� �߰�����ġ
      LimitSkill              : Integer;         //�����Ҽ� �ִ� �Ѱ� ��ų����
      CurMagicDamage          : Integer;         // �����빫���� �ı���       031217
      SoundNumber : Integer;   // lifesteal, energysteal �Ҷ� ���� �ֱ�����  040306 
   end;

   TAtomItem = packed record
      rName: TNameString;
      rCount : Integer;
      rColor : Integer;
   end;
   TCheckSkill = packed record
      rName : TNameString;
      rLevel : Integer;
   end;
   TCheckItem = packed record
      rName : TNameString;
      rCount : Integer;
   end;
   PTCheckItem = ^TCheckItem;

   TAttribUnit = packed record
      rValue : integer;
      rLimit : Byte;
   end;
   PTAttribUnit = ^TAttribUnit;

   TSAbilityAttrib = packed record    // SM_ABILITYATTRIB
      rmsg    : byte;
      rAttackSpeed, rAvoid, rRecovery, rAccuracy, rKeepRecovery: word;
      rDamageBody, rDamageHead, rDamageArm, rDamageLeg: word;
      rArmorBody, rArmorHead, rArmorArm, rArmorLeg: word;
   end;
   PTSAbilityAttrib = ^TSAbilityAttrib;
   
   //�߰��Ӽ� ����Ÿ
   TAddAttribData = packed record
      rBowAttSpd : TAttribUnit;
      rBowAccuracy : TAttribUnit;
      rBowKeepRecovery : TAttribUnit;
      rBowAvoid : TAttribUnit;
      rBowBodyArmor : TAttribUnit;
      rBowHeadArmor : TAttribUnit;
      rBowArmArmor : TAttribUnit;
      rBowLegArmor : TAttribUnit;
      rHandSpd : TAttribUnit;
      rHandAccuracy : TAttribUnit;
      rHandKeepRecovery : TAttribUnit;
      rHandMinValue : TAttribUnit;
      rHandMaxValue : TAttribUnit;
      rHandBodyArmor : TAttribUnit;
      rApproachSpd : TAttribUnit;
      rApproachAccuracy : TAttribUnit;
      rApproachAvoid : TAttribUnit;
      rApproachKeepRecovery : TAttribUnit;
      rApproachBodyArmor : TAttribUnit;
      rApproachHeadArmor : TAttribUnit;
      rApproachLegArmor : TAttribUnit;
      rApproachArmArmor : TAttribUnit;
      rAddBodyDamage : TAttribUnit;
      rAddHeadDamage : TAttribUnit;
      rAddArmDamage : TAttribUnit;
      rAddLegDamage : TAttribUnit;
      rEnergyRegenDec : TAttribUnit;
      rBasicValueDec : TAttribUnit;
   end;
   PTAddAttribData = ^TAddAttribData;

   //���� ���� �Ӽ�����Ÿ
   TRealAddAttribData = packed record
      rBowAttSpd : Integer;
      rBowAccuracy : Integer;
      rBowKeepRecovery : Integer;
      rBowAvoid : Integer;
      rBowBodyArmor : Integer;
      rBowHeadArmor : Integer;
      rBowArmArmor : Integer;
      rBowLegArmor : Integer;
      rHandSpd : Integer;
      rHandAccuracy : Integer;
      rHandKeepRecovery : Integer;
      rHandMinValue : Integer;
      rHandMaxValue : Integer;
      rHandBodyArmor : Integer;
      rApproachSpd : Integer;
      rApproachAccuracy : Integer;
      rApproachAvoid : Integer;
      rApproachKeepRecovery : Integer;
      rApproachBodyArmor : Integer;
      rApproachHeadArmor : Integer;
      rApproachLegArmor : Integer;
      rApproachArmArmor : Integer;
      rAddBodyDamage : Integer;
      rAddHeadDamage : Integer;
      rAddArmDamage : Integer;
      rAddLegDamage : Integer;
      rEnergyRegenDec : Integer;
      rBasicValueDec : Integer;
   end;
   PTRealAddAttribData = ^TRealAddAttribData;

   TItemData = packed record
     rName, rViewName : TNameString;

     rScript : Integer;
     rMaxCount : Integer;
     rSoundEvent : TEffectData;
     rSoundDrop : TEffectData;

     rNeedGrade : integer;
     rcolor : byte;
     rKind : byte;
     rWearArr : byte;
     rWearShape : byte;
     rHitMotion : byte;
     rHitType : byte;

     rLifeData : TLifeData;

     rDurability : integer;                         // ������
     rCurDurability : integer;                      // ���系����
     rAbrasion : Integer;                           // ����

     rPrice : Integer;
     rBuyPrice : Integer;
     rRepairPrice : Integer;                        // �������
     rCount : integer;
     rShape : word;
     rActionImage : Word;
     rboDouble : Boolean;
     rboColoring : Boolean;
     rSex: integer;
     rNameParam : array [0..2 - 1] of String [20];
     rAttribute : Integer;                         // �����ۼӼ� (���ǼӼ��̳� ���ǼӼ��̳�...)

     rGrade : Integer;                             // ������ ǰ��
     rQuestNum : Integer;     
     rMaterial : array [0..4 - 1] of TCheckItem;   // ����
     rUpgrade : Integer;                           // ���� ��������
     rboUpgrade : Boolean;                         // ���׷��̵� ���ɿ���
     rJobKind : byte;                              // ��������
     rMaxUpgrade : byte;                           // �ִ밡����
     rboDurability : Boolean;                      // ������ ��뿩��
     rToolConst : Integer;                         // �������
     rSuccessRate : byte;                          // ����������
     rDesc : array [0..128 - 1] of Byte;            // ������ ����
     rboTalentExp : Boolean;                       // ���ġ�� �ٲ��� ������
     rNeedItem : array [0..4 - 1] of TCheckItem;
     rNotHaveItem : array [0..4 - 1] of TCheckItem;
     rDelItem : array[0..4 - 1] of TCheckItem;
     rAddItem : array[0..4 - 1] of TCheckItem;

     rboNotTrade     : Boolean;
     rboNotExchange  : Boolean;
     rboNotDrop      : Boolean;
     rboNotSsamzie   : Boolean;
     rboNotSkill     : Boolean;     // ssamzie�� skillâ �и���Ŵ
     // add by Orber at 2004-09-16 11:58
     rboNotSave      : Boolean;

     cLife        : Integer;
     rSpecialKind : integer;
     rboPower : Boolean;      // �ʺ����� ���忡 �ɷ�ġ������ �������� ���°Ͷ�����

     rDecDelay : Integer;
     rDecSize : Integer;
     rDecTick : Integer;

     rOwnerRace : Byte;
     rOwnerServerID : Integer;
     rOwnerName : array [0..20 - 1] of byte;
     rOwnerIP : array [0..20 - 1] of byte;
     rOwnerX, rOwnerY : Integer;

     rServerId : integer;
     rX, rY: integer;
     rRoleType : Byte;
     rAddType : Byte;
     rAddAttribData : TAddAttribData;

     //add by Orber at 2004-09-07 10:14
      rLockState : Byte;
      runLockTime : Word;
      //Author:Steven Date: 2005-02-03 13:47:24
      //Note:�ɼ�����
      rExtJobExp: Integer;
      //=======================================
   end;
   PTItemdata = ^TItemData;

   TDynamicObjectData = packed record
     rName : String[64];
     rViewName : String [20];
     rKind : Byte;
     rShape : Word;
     rLife : Integer;
     rArmor : Integer;     
     rSoundEvent : TEffectData;
     rSoundSpecial : TEffectData;
     rSoundStart : TEFfectData;
     rSoundDie : TEffectData;
     rSStep : array [0..3 - 1] of String [20];
     rEStep : array [0..3 - 1] of String [20];
     rGuardX : array [0..20 - 1] of ShortInt;
     rGuardY : array [0..20 - 1] of ShortInt;
     rEventItem : TCheckItem;
     rEventDropItem : TCheckItem;
     rEventSay : String [64];
     rEventAnswer : String [64];
     rboRemove : Boolean;
     rOpennedInterval : Integer;
     rRegenInterval : Integer;
     rKeepInterval : Integer;
     rboRandom : Boolean;
     rDamage : Integer;
     rEffectColor : Integer;
     rEventType : Integer;
     rShowInterval : Integer;
     rhideInterval : Integer;
     rboBlock : Boolean;
     rboMinimapShow : Boolean;
     rboOnlyUseLongMagic : Boolean;
   end;
   PTDynamicObjectData = ^TDynamicObjectData;

   TCreateDynamicObjectData = packed record
      rBasicData : TDynamicObjectData;
      {
      rState : Integer;
      rRegenInterval : Integer;
      rLife : Integer;
      }
      rNeedAge : Integer;
      rNeedSkill : array[0..5 - 1] of TCheckSkill;
      rNeedItem : array[0..5 - 1] of TCheckItem;
      rGiveItem : array[0..5 - 1] of TCheckItem;
      rDropItem : array[0..5 - 1] of TCheckItem;
      rDropMop : array[0..5 - 1] of TCheckItem;
      rCallNpc : array[0..5 - 1] of TCheckItem;

      rServerId : integer;
      rX, rY: array[0..5] of Integer;
      rDropX, rDropY : Word;
      rScript : Integer;
      rWidth : Integer;
      rEventType : Integer;
      rboDelay : Boolean;
   end;
   PTCreateDynamicObjectData = ^TCreateDynamicObjectData;

   TCreateVirtualObjectData = packed record
      rName : TNameString;
      rX : Integer;
      rY : Integer;
      rWidth : Integer;
      rHeight : Integer;
      rKind : Integer;
      rLife : Integer;
   end;
   PTCreateVirtualObjectData = ^TCreateVirtualObjectData;

  // add by Orber at 2004-12-06 10:42:31
   TCreateArenaObjData = packed record
      rName : TNameString;
      rX : Integer;
      rY : Integer;
      rWidth : Integer;
      rHeight : Integer;
      rKind : Integer;
      rLife : Integer;
   end;
   PTCreateArenaObjData = ^TCreateArenaObjData;


   TMineObjectData = packed record
      rName : TNameString;
      rViewName : TNameString;
      rPickConst : Integer;                        // ä����
      rDeposits : array [0..5 - 1] of Word;        // ���差
      rAvailItems : array [0..10 - 1] of TCheckItem;
      rSoundData : TEffectData;
      rRegenIntervals : array [0..3 - 1] of Integer;
      rDropMop : array [0..5 - 1] of TCheckItem;
   end;
   PTMineObjectData = ^TMineObjectData;

   TMineObjectShapeData = packed record
      rShape : Word;
      rSStep : byte;
      rEStep : byte;
      rGuardX : array [0..10 - 1] of ShortInt;
      rGuardY : array [0..10 - 1] of ShortInt;
   end;
   PTMineObjectShapeData = ^TMineObjectShapeData;
   
   TMineObjectAvailData = packed record
      rName : TNameString;
      rGroupName : TNameString;
      rMapID : Word;
      rPositionCount : Word;
      rSettingCount : Word;
      rAvailMines : array [0..5 - 1] of TNameString;
      rMineSFreq : array [0..5 - 1] of Word;
      rMineEFreq : array [0..5 - 1] of Word;
      rUsedList : TStringList;
      rUnUsedList : TStringList;
   end;
   PTMineObjectAvailData = ^TMineObjectAvailData;

   TToolRateData = packed record
      Name : String [32];
      rSFreq : array [0..10 - 1] of Word;
      rEFreq : array [0..10 - 1] of Word;
   end;
   PTToolRateData = ^TToolRateData;

   TCreateMineObjectData = packed record
      rName : TNameString;
      rGroupName : TNameString;
      rX, rY : Word;
      rShape : Word;
   end;
   PTCreateMineObjectData = ^TCreateMineObjectData;

   TItemDrugData = packed record
     rName : TNameString;
     rType : Byte;
     rUseInterval : Integer;
     rUseCount : Integer;
     rStillInterval : Integer;
     
     rEventEnergy : integer;        // �����ų� �°ų� ����� �̺�Ʈ�� �Һ�Ǵ¾�.
     rEventInPower: integer;
     rEventOutPower: integer;
     rEventMagic : integer;
     rEventLife : integer;
     rEventHeadLife : integer;
     rEventArmLife : integer;
     rEventLegLife : integer;

     rDamageBody : Integer;
     rDamageHead : Integer;
     rDamageArm : Integer;
     rDamageLeg : Integer;
     rArmorBody : Integer;
     rArmorHead : Integer;
     rArmorArm : Integer;
     rArmorLeg : Integer;
     rAttackSpeed : Integer;
     rAvoid : Integer;
     rRecovery : Integer;
     rAccuracy : Integer;
     rKeepRecovery : Integer;
     rLightDark : Integer;

     rUsedCount : Integer;
     rUsedTick : Integer;
   end;
   PTItemDrugdata = ^TItemDrugData;

   TStatusPoint = packed record
      rDamageBody : word;
      rDamageHead : word;
      rDamageArm : word;
      rDamageLeg : word;
      rDamageEnergy : word;
      rArmorBody : word;
      rArmorHead : word;
      rArmorArm : word;
      rArmorLeg : word;
      rArmorEnergy : word;
   end;
   PTStatusPoint = ^TStatusPoint;

   TMagicData = packed record
     rname : TNameString;
     rViewName : TNameString;
     rKind : byte;
     rGuildMagictype : byte;
     rBowImage : integer;
     rBowSpeed : integer;
     rBowType : Byte;

     rShape : integer;
     rMagicType : integer;
     rMagicClass : Integer;      // 0 : �⺻����  1 : ��¹���  2 : ���  3 : ��������
     rMagicRelation : Integer;   // �⺻������ ��¹��� �������� (??)
     rFunction: byte;
     rEffectColor : byte;        // effect������ �߰�

     //2003-10
     rPatternType : byte;        // 0: passive, 1: ������, 2:��ȸ��
     rRelationMagic : byte;      // 0: X, 1:�⺻����, 2:��¹���, 3:����, 4:��������
     rNeedMagic : TNameString;   // ������̾�ߵ� ������
     rRangeType : byte;          // 0 : �ٷξ�, 1: 4����, 2: 8����
     rAttackCount : byte;        // 0 : ���, x :   x��
     rPushLength : byte;         // Ÿ�ݽ� ������ �̴� ȿ�� ����
     rLockDown : byte;           // LockDown ȿ���ð� (1���� = 1��)
     rMinRange    : Integer;     // ���� �ּ� ��ȿ�Ÿ�
     rMaxRange    : Integer;     // ���� �ִ� ��ȿ�Ÿ�
     rShotDelay : Integer;       // ������ �ߵ� �ð� ( 1���� = 1 Tick)
     rUseableDelay : integer;    // �ʻ�⸦ �ٽ� ����� �� �ִ� �ð� (1���� = 1 tick)
     rSuccessRate : byte;        // ���� ������ Ư���� �ش��ϴ� ����Ȯ��
     rPassDamagePer : byte;      // ���̽� �ǵ����� Damage Percentage
     rGetDamagePer : Byte;       // ���̽� �� ���� ���ϰ� �ǵ��� ����
     rMotionType : Byte;         // 0: �⺻, 1: �������, 2: ��������
     r3Attrib : Byte;            // ���� �����Ҹ�
     rboNotRecovery : Boolean;   // ������ �ڼ������� ���� ��� X
     rLifeSteal : Word;          // ���� Ȱ�� ���
     rEnergySteal : Word;        // ���� Energy ���
     rAddDamageEnergy : Word;    // ������ݷ��� �߰����ݰ�
     rStun : Byte;               // ������ Ÿ���� Ǯ�������?
     rMoveSpeed : Byte;          // �̵��ӵ�����ġ
     rScreenEffectNum : Byte;    // Screen Effect
     rScreenEffectDelay : Integer;
     rSkillExp : integer;
     rcSkillLevel : integer;

     rEnergyPoint : Integer;

     rGoodChar : integer;
     rBadChar : integer;

     rLifeData : TLifeData;
     rcLifeData : TLifeData;

     rEventDecEnergy : integer;        // �����ų� �°ų� ����� �̺�Ʈ�� �Һ�Ǵ¾�.
     rEventDecInPower: integer;
     rEventDecOutPower: integer;
     rEventDecMagic : integer;
     rEventDecLife : integer;
     rEventDecDamageHead : Integer;
     rEventDecDamageArm : Integer;
     rEventDecDamageLeg : Integer;

     r5SecDecEnergy : integer;         // �����Ҷ� 5�ʸ��� �ִ� ��
     r5SecDecInPower: integer;
     r5SecDecOutPower: integer;
     r5SecDecMagic : integer;
     r5SecDecLife : integer;
     r5SecDecDamageHead : Integer;
     r5SecDecDamageArm : Integer;
     r5SecDecDamageLeg : Integer;

     rEventBreathngEnergy : integer;
     rEventBreathngInPower : integer;
     rEventBreathngOutPower : integer;
     rEventBreathngMagic : integer;
     rEventBreathngLife : integer;
     rEventBreathngDamageHead : Integer;
     rEventBreathngDamageArm : Integer;
     rEventBreathngDamageLeg : Integer;

     rKeepEnergy : integer;            // ���� ���� ���� �ּҾ�.
     rKeepInPower: integer;
     rKeepOutPower: integer;
     rKeepMagic : integer;
     rKeepLife : integer;
     rKeepDamageHead : Integer;
     rKeepDamageArm : Integer;
     rKeepDamageLeg : Integer;

     rMagicProcessTick : integer;

     rSoundStrike : TEffectData;
     rSoundSwing : TEffectData;
     rSoundStart : TEffectData;
     rSoundEvent : TEffectData;
     rSoundEnd : TEffectData;

     rSEffectNumber : Word;
     rSEffectNumber2 : Word;
     rCEffectNumber : Word; //2003-10 �������� Effect�� ����
     rEEffectNumber : Word;
     rEffectDelay : Integer;
     rGrade : byte;

     rStatus : TStatusPoint;
     rRelationProtect : TNameString;
     rSameSection : TNameString;
   end;
   PTMagicData = ^TMagicData;

   TBestMagicData = packed record
      rLifeData : TLifeData;
      rEnergyPoint : Integer;
            
      rKeepEnergy : Integer;
      rSuccessRate : byte;    //0-100
      rPassDamagePer : byte;  //0-100
      rGetDamagePer : Byte;       // ���̽� �� ���� ���ϰ� �ǵ��� ����
      rShotDelay : Integer;
      rUseableDelay : Integer;
      rLockDown : byte;       //1 = 1��
      r3Attib : byte;         //���� ��,��,���� �Ҹ� Percentage
      rLifeSteal : word;
      rEnergySteal : word;
      rAddDamageEnergy : word;
      rMoveSpeed : byte;

      r1SecDecLife : integer;

      rSoundStart : TEffectData;
      rSoundEnd : TEffectData;
      rSoundStrike : TEffectData;
      rSoundSwing : TEffectData;
      rSoundEvent : TEffectData;

      rSEffectNumber : Word;
      rSEffectNumber2 : Word;
      rCEffectNumber : Word; //2003-10 �������� Effect�� ����
      rEEffectNumber : Word;
   end;
   PTBestMagicData = ^TBestMagicData;

   TMagicParamData = packed record
      ObjectName : String [20];
      MagicName : String [20];
      NameParam : array [0..5 - 1] of String [20];
      NumberParam : array [0..5 - 1] of Integer;
   end;
   PTMagicParamData = ^TMagicParamData;

   TMonsterData = packed record
     rName : TNameString;
     rViewName : TNameString;
     rKind : Integer;     
     rSoundStart : TEffectData;
     rSoundNormal : TEffectData;
     rSoundAttack : TEffectData;
     rSoundDie : TEffectData;
     rSoundStructed : TEffectData;

     rAttackName: TNameString;
     rIdleName: TNameString;

     rAnimate : integer;
     rWalkSpeed : integer;
     rdamage : integer;
     rDamageHead : Integer;
     rDamageArm : Integer;
     rDamageLeg : Integer;
     rAttackSpeed : integer;
     ravoid : integer;
     raccuracy : integer;
     rrecovery : integer;
     rspendlife : integer;
     rarmor : integer;
     rHitArmor : Integer;
     rLife : integer;
     rShape: integer;

     rboViewHuman : Boolean;
     rboAutoAttack : Boolean;
     rboGoodHeart : Boolean;
     rboAttack : Boolean;
     rEscapeLife : integer;
     rViewWidth : integer;
     rboChangeTarget: Boolean;
     rboBoss: Boolean;
     rboVassal: Boolean;
     rVassalCount: integer;
     rActionWidth : Integer;
     rFallItem : array [0..5 - 1] of TAtomItem;
     rHaveItem : array [0..10 - 1] of TCheckItem;
     rQuestHaveItem : array [0..3-1] of TAtomItem;     
     rAttackType : Byte;
     rAttackMagic : TMagicData;
     rHaveMagic : String [64];
     rSpellResistRate : Integer;    // ���׷�
     rVirtue : Integer;             // ȣ������
     rVirtueLevel : Integer;
     rRegenInterval : Integer;
     rboSeller: Boolean;            // ���͵� ���α����...
     rboHit : Boolean;
     rboNotBowHit : Boolean;
     rboIce : Boolean;
     rboControl : Boolean;
     rboRightRemove : Boolean;
     rXControl, rYControl : Integer;
     rboRandom : Boolean;
     rboPK : Boolean;
     rQuestNum : Integer;

     //���ο� ����ġ�� ����
     rShortExp, rRiseShortExp, rLongExp, rRiseLongExp, rHandExp, rBestShortExp
      ,rBestShortExp2, rBestShortExp3, rExtraExp, r3HitExp, rLimitSkill : Integer;
     rArmorWHPercent : Integer;
     //rboSpecialExp : Boolean;
     rEffectStart : Integer;
     rEffectStructed : Integer;
     rEffectEnd : Integer;
     rFallItemRandCount : Integer;
     rFirstDir : Byte;
     rMonType : Integer;
     rFeature : TFeature;
     rGuild : TNameString;
     rGroupKey : Integer;
     rTotalCount : Integer;     
   end;
   PTMonsterData = ^TMonsterData;

   TNpcData = packed record
     rName : TNameString;
     rViewName : TNameString;
     rAnimate : integer;
     rShape: integer;
     rdamage : integer;
     rAttackSpeed : integer;
     ravoid : integer;
     rrecovery : integer;
     rspendlife : integer;
     rarmor : integer;
     rArmorHead : Integer;
     rArmorArm : Integer;
     rArmorLeg : Integer;
     rHitArmor : Integer;
     rLife : integer;
     rboMinimapShow : Boolean;
     rboSale : Boolean;
     rboSeller: Boolean;
     rboProtecter: Boolean;
     rboObserver : Boolean;
     rboAutoAttack : Boolean;
     rActionWidth : integer;
     rHaveItem : array[0..5] of TCheckItem;
     rHaveMagic : String [64];
     rAttackMagic : String [64];
     rAttackSkill : Integer;     
     rVirtue : Integer;            // ȣ������
     rVirtueLevel : Integer;
     rRegenInterval : Integer;

     rSoundStart : TEffectData;     
     rSoundNormal : TEffectData;
     rSoundAttack : TEffectData;
     rSoundDie : TEffectData;
     rSoundStructed : TEffectData;
     rboHit : Boolean;     

     rEffectStart : Integer;
     rEffectStructed : Integer;
     rEffectEnd : Integer;
     rboBattle : Boolean;
     rboRightRemove : Boolean;

     rNpcText: array [0..64] of byte;
   end;
   PTNpcData = ^TNpcData;

   TSmeltItemData = packed record
      rName : TNameString;
      rNeedItem : TNameString;
      rNeedCount : Integer;
      rPrice : Integer;
   end;
   PTSmeltItemData = ^TSmeltItemData;

   {
   TNpcData = packed record
     rname : TNameString;
     rdamage : integer;
     rAttackSpeed : integer;
     ravoid : integer;
     rrecovery : integer;
     rspendlife : integer;
     rarmor : integer;
     rLife : integer;
     rboMan : Boolean;
     rboSeller: Boolean;
     rboProtecter: Boolean;
     rActionWidth : integer;
     rNpcText: TNameString;
     rItemDataArr : array [0..10] of TItemData;
   end;
   PTNpcData = ^TNpcData;
   }
   
   TLifeObjectState = (los_init, los_exit, los_none, los_die, los_escape,
                       los_Attack, los_moveattack, los_deadattack,
                       los_follow, los_stop, los_rest, los_movework,
                       los_eat, los_move, los_kill, los_control, los_pick,
                       los_dieandbreak, los_break, los_spellcasting );

   TExpData = packed record
      Exp : integer;
      ExpType : integer;
   end;

   TSubData = packed record
     TargetId : integer;
     VassalCount: integer; // �ڽ��� ����ϰԵǸ� �پ��...
     ServerId : integer;
     tx, ty: integer;
     ItemData : TItemData;
     HitData : THitData;
     ExpData : TExpData;
     motion : integer;
     MagicState : Byte;    // ����Effect
     MagicKind : Byte;     //
     MagicColor : Byte;    //
     percent : byte;
     sysopscope: integer;
     attacker : integer;
     BowImage : integer;
     BowSpeed : integer;
     BowType : Byte;
     SubName: TNameString;
     GuildName : TNameString;
     SayString : TWordString;
     ShoutColor : integer;
     SpellType : Byte;    // ����
     SpellDamage : Word;
     EffectNumber : Word;
     EffectNumber2 : word;     
     EffectKind : TLightEffectKind;
     boMarketing : Boolean;
     MinRange : Integer;
     MaxRange : Integer;
     Delay : Integer;
     PowerLevel : Integer;
     PushLength : byte;
     LockDown : byte;
     RangeType : byte;
     _3Attib : byte;
     SuccessRate : byte;
     LifeStealValue : integer;
     EnergyStealValue : integer;
     ScreenEffectNum : Byte;
     ScreenEffectDelay : Integer;
     LockDownDecLife : Integer;
   end;

   TCurAttribData = packed record
     CurEnergy : integer;        // ����
     CurInPower : integer;       // ����
     CurOutPower: integer;       // �ܰ�
     CurMagic : integer;         // ����
     CurLife : integer;          // Ȱ��

     CurHealth : integer;
     CurSatiety : integer;
     CurPoisoning : integer;
     CurHeadSeak : integer;
     CurArmSeak : integer;
     CurLegSeak : integer;
     CurExtJobExp: Integer; 
   end;

   TAttribData = packed record
      Age, cAge : integer;
      Light, cLight : integer;
      Dark, cDark : integer;
      Energy, cEnergy : integer;
      InPower, cInPower: integer;
      OutPower, cOutPower: integer;
      Magic, cMagic: integer;

      Life, cLife: integer;

      cHeadSeak: integer;
      cArmSeak: integer;
      cLegSeak: integer;

      cHealth: integer;
      cSatiety: integer;
      cPoisoning: integer;

      Talent, cTalent : integer;
      GoodChar, cGoodChar : integer;
      BadChar, cBadChar  : integer;
      lucky, clucky    : integer;
      adaptive, cadaptive : integer;      // ����
      Revival, cRevival : integer;
      immunity, cimmunity : integer;
      virtue, cvirtue   : integer;      // ȣ������
      ExtraExp : integer;              //Extra ����ġ
      AddableStatePoint : integer;     //Extra ����ġ�� ��ȯ�� ��밡���� StatePoint
      TotalStatePoint : integer;       //�� ���� StatePoint . �����߻��� �����Ҽ� �ִ� �κ�
      //Author:Steven Date: 2005-02-02 18:24:09
      //Note:�ɼ�����
      ExtJobKind: Byte;
      //=======================================
   end;

   TExChangeItem = packed record
      rIcon: word;
      rItemName : string[64];
      rItemViewName : String [64];
      rItemCount : integer;
      rColor : integer;
      rUpgrade : Integer;
      rAddtype : Byte;      
      rCurDurability : Integer;
      rDurability : Integer;
      rCode : String [22];
      rkey : word;
   end;
   PTExchangeItem = ^TExchangeItem;

   TExChangeData = packed record
      rExChangeId : LongInt;
      rExChangeName : string [32];
      rboCheck : boolean;
      rItems : array [0..3] of TExChangeItem;
   end;
   PTExChangeData = ^TExChangeData;

   TMaterialItem = packed record
      rItemName : String [64];
      rItemCount : Integer;
      rShape : Word;                     
   end;
   PTMaterialItem = ^TMaterialItem;

   TPosByDieData = packed record
      rServerID : Integer;
      rDestServerID : Integer;
      rDestX, rDestY : Word;
   end;
   PTPosByDieData = ^TPosByDieData;

   // ���Ĵ��� ����
   {
   TCreateMonsterData = packed record
      Name : string[64];
      x, y  : Integer;
      Width : Integer;
      Count : integer;
      Member : String;
      Interval : integer;
      DurationLifeTick : integer;
   end;
   PTCreateMonsterData = ^TCreateMonsterData;

   TCreateNpcData = packed record
      Name : String [20];
      MapID : Integer;
      X, Y  : Integer;
      Width : Integer;
      RegenInterval : Integer;
      FuncNo : Integer;
      BookName : String [64];
   end;
   PTCreateNpcData = ^TCreateNpcData;
   }

   // 2001.5.31 ����
   TCreateMonsterData = packed record
      mName : string[64];
      Index : integer;
      x, y  : integer;
      Width, CurCount, Count : integer;
      Member : String[64];
      Interval : integer;
      DurationLifeTick : integer;
      Script : Integer;
   end;
   PTCreateMonsterData = ^TCreateMonsterData;

   TCreateNpcData = packed record
      mName : string[64];
      Index : integer;
      x, y  : integer;
      Width, CurCount, Count : integer;
      Notice : Integer;
      Interval : Integer;
      DurationLifeTick : integer;
      BookName : String[64];
   end;
   PTCreateNpcData = ^TCreateNpcData;

   TAreaClassData = packed record
      Name : String [32];
      Index : Byte;
      Func : String [64];
      Desc : String [128];
   end;
   PTAreaClassData = ^TAreaClassData;

   TCreateZoneEffectData = packed record
      Name : String [64];
      MapID : Integer;
      X, Y : Integer;
      Width : Integer;
      Kind : Byte;                  // 1 : Ȱ�±��̴°� 
      Value : Integer;
   end;
   PTCreateZoneEffectData = ^TCreateZoneEffectData;

   TClockData = packed record
      rDay, rHour, rMinute : integer;
   end;
   PTClockData = ^TClockData;
   PClockData = array [0..0] of TClockData;
   
   TCreateGateData = packed record
      Name : string [64];
      ViewName : String [20];
      boShow : Boolean;          // ������ ����Ʈǥ�����ٰ���...
      MapID : Integer;
      X, Y : integer;
      TargetX, TargetY: integer;
      EjectX, EjectY : integer;
      targetserverid : integer;
      Kind : Byte;
      shape : integer;
      Interval : integer;
      DurationLifeTick : integer;
      Width : Integer;
      LimitAge : Integer;
      OverAge : Integer;
      LimitPowerLevel : Integer;
      NeedAge : Integer;
      BelowEnergy : Integer;
      OverEnergy : Integer;
      AgeNeedItem : Integer;
      NeedItem : array [0..5 - 1] of TCheckItem;
      DelItem : array [0..5 - 1] of TCheckItem;
      AddItem : array [0..5 - 1] of TCheckItem;      
      boRemainItem : Boolean;
      Quest : Integer;
      QuestNotice : String[128];
      RegenInterval : Integer;
      ActiveInterval : Integer;
      EjectNotice : String[128];
      RandomPosCount : Byte;
      RandomX : array [0..10 - 1] of Word;
      RandomY : array [0..10 - 1] of Word;
      OpenClock : array [0..10 - 1] of TDateTime;
      boAlarmRemainTime : Boolean;
      AlarmNotice : String;
      OpenTime : array [0..10 - 1] of Byte;
      GuildName : String [20];
      MaxUser : Integer;
      Script : Integer;    
   end;
   PTCreateGateData = ^TCreateGateData;

   TCreateGroupMoveData = packed record
      Name : String [64];
      ViewName : String [20];
      X, Y : Integer;
      TargetX, TargetY: word;
      AddWidth : integer;
      MapID : Integer;
      TargetMapID : integer;
      Shape : Word;
      SStep, EStep : byte;
      AddItem : TCheckItem;
      MoveNum : Integer;
      Member : array [0..8-1] of TNameString;
   end;
   PTCreateGroupMoveData = ^TCreateGroupMoveData;

   TTargetDataEx = packed record
      ServerID : Integer;
      X, Y : Integer;
   end;

   TCreateGateDataEx = packed record
      Name : string [64];
      ViewName : String [20];
      Kind : Byte;
      Shape : integer;
      X, Y : integer;
      TargetX, TargetY: integer;
      EjectX, EjectY : integer;
      MapID : Integer;
      TargetData : array [0..11] of TTargetDataEx;
      boRandom : Boolean;
      RandomCount : Integer;
      RandomTotal : Integer;
      boCondition : Boolean;
      Condition : String [20];
      Width : Integer;
      NeedAge : Integer;
      AgeNeedItem : Integer;
      NeedItem : array[0..5] of TCheckItem;
      Quest : Integer;
      QuestNotice : String[128];
      RegenInterval : Integer;
      ActiveInterval : Integer;
      EjectNotice : String[128];
   end;
   PTCreateGateDataEx = ^TCreateGateDataEx;

   TCreateMirrorData = packed record
      Name : String [32];
      X, Y, MapID : Integer;
      boActive : Boolean;
   end;
   PTCreateMirrorData = ^TCreateMirrorData;

   TCreateDoorData = packed record
      Name : String [20];
      DoorName : String [20];
      Shape : Integer;
      MapID, X, Y : Word;
      TMapID, TX, TY : Word;
      Width : Integer;
      NeedAge : Integer;
      NeedItem : String [64];
      NeedQuest : Integer;
      NeedGuild : String [64];
      RegenInterval : Integer;
      ActiveInterval : Integer;
   end;
   PTCreateDoorData = ^TCreateDoorData;

   TGuildNpcData = packed record
     rName: string [20];
     rX, rY : Integer;
     rSex : Byte;
   end;
   PTGuildNpcData = ^TGuildNpcData;

   TCreateGuildData = packed record
     Name : string [20];
     Title : String [80];
     MapID : Integer;
     x, y  : integer;
     Durability : Integer;
     MaxDurability : Integer;
     GuildMagic : string [20];
     MagicExp : integer;
     MakeDate : string [20];
     Sysop : string [20];
     SubSysop : array [0..3 - 1] of string [20];
     GuildNpc : array [0..5 - 1] of TGuildNpcData;
     GuildWear : array [0..2 - 1] of TAtomItem;
     BasicPoint, AwardPoint : Integer;
     BattleRejectCount : Word;
     ChallengeGuild : String [20];
     ChallengeGuildUser : String [20];
     ChallengeDate : String [20];
   end;
   PTCreateGuildData = ^TCreateGuildData;

   TMakeGuildData = packed record
      GuildName : String [20];
      Sysop : String [20];
      AgreeChar : array [0..9 - 1] of String [20];
      boAgree : array [0..9 - 1] of Boolean;
   end;
   PTMakeGuildData = ^TMakeGuildData;

   TSpecialWindowSt = packed record
      rWindow : Byte;
      rAgreeType : Byte;
      rSenderID : Integer;
   end;
   PTSpecialWindowSt = ^TSpecialWindowSt;

   TNpcFunctionData = packed record
      Index : Integer;
      FuncType : Byte;
      Text : String [32];
      FileName : String [64];
      StartQuest, NextQuest : Integer;
   end;
   PTNpcFunctionData = ^TNpcFunctionData;

   {
   TCreateGateData = packed record
      mName : string[64];
      index : integer;
      x, y : integer;
      targetx, targety: integer;
      EjectX, EjectY : integer;
      targetserverid : integer;
      shape : integer;
      Interval : integer;
      DurationLifeTick : integer;
      Width : Integer;
      NeedAge : Integer;
      AgeNeedItem : Integer;
      NeedItem : array[0..5] of TCheckItem;
      Quest : Integer;
      QuestNotice : String [128];
      RegenInterval : Integer;
      ActiveInterval : Integer;
      EjectNotice : String [128];
   end;
   PTCreateGateData = ^TCreateGateData;
   }

   TCreateAreaData = packed record
      mName : string[64];
      ServerID : Integer;
      X, Y : integer;
      TargetServerID : Integer;
      TargetX, TargetY : Integer;
      Width : Integer;
   end;
   PTCreateAreaData = ^TCreateAreaData;

   TItemGenData = packed record
      Name : String [20];
      
      ItemName : String [20];
      ItemCount : Integer;

      CreateInterval : Integer;
      RegenInterval : Integer;

      ItemCreateX, ItemCreateY, ItemCreateW : Word;
      ItemRegenX, ItemRegenY, ItemRegenW : Word;
   end;
   PTItemGenData = ^TItemGenData;

   TCreateSoundObjData = packed record
      Name : String [20];
      SoundName : String [20];
      MapID : Integer;
      X, Y : Word;
      PlayInterval : Integer;
   end;
   PTCreateSoundObjData = ^TCreateSoundObjData;

   //2002-08-06 giltae
   TQuestSummaryData = packed record
      rQuestNumber : integer;
      rQuestMainTitle : String [30];
      rQuestSubTitle : String [30];
      rRequest : String[40];
      rDesc : TWordString;
   end;
   PTQuestSummaryData = ^TQuestSummaryData;
   //-----------------

   TCreateHelpData = packed record
      rHelpFileName : string[64 + 1];
      rHelpDesc     : TWordString;
   end;
   PTCreateHelpData = ^TCreateHelpData;

   TWindOfHandData = packed record
      rMagicType : Integer;
      rMagicRelation : Integer;
      rConsumeEnergy : Integer;
      rGroupKey : Integer;
      rAttacker : Integer;
      rRace : Integer;
      rHitType : Integer;
      rSayString : TNameString;
      rEffectNumber : Integer;

      rDamageBody : Integer;
      rDamageArm : Integer;
      rDamageLeg : Integer;
      rDamageHead : Integer;
      rDamageExp : Integer;
   end;

   TAttackedMagic = packed record
      rProcessTick : Integer;
      rDelay : Integer;
      rData : TWindofHandData;
   end;
   PTAttackedMagic = ^TAttackedMagic;

   {
   TGuildNpcData = packed record
     rName: string [64];
     rIndex : Integer;
     rX, rY : Integer;
   end;
   PTGuildNpcData = ^TGuildNpcData;

   TCreateGuildData = packed record
     mName : string [64];
     index : integer;
     x, y  : integer;
     Sysop : string [64];
     SubSysop0, SubSysop1, SubSysop2: string [64];
     Durability : integer;
     GuildMagic : string [64];
     MakeDate : string [64];
     MagicExp : integer;
     GuildNpcDataArr : array [0..5-1] of TGuildNpcData;
   end;
   PTCreateGuildData = ^TCreateGuildData;
   }

///////////////////////////////////
//        Server Structure       //
///////////////////////////////////
   TSExChange = packed record
      rmsg : byte;
      rIcons : Array [0..8-1] of word;
      rColors : Array [0..8-1] of byte;
      rCheckLeft, rCheckRight: Boolean;
      rWordString: TWordString;   // left name, right name, item name ,,,,
   end;
   PTSExChange = ^TSExChange;

   TSShowInputString = packed record
      rmsg : byte;
      rInputStringid : LongInt;
      rWordString: TWordString;    // CaptionString, ListString,,,,
   end;
   PTSShowInputString = ^TSShowInputString;

   TSShowSpecialWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
      rKind : Byte;
      rCaption : TNameString;
      rWordString: TWordString;
   end;
   PTSShowSpecialWindow = ^TSShowSpecialWindow;

   // saset
   TSHideSpecialWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
   end;
   PTSHideSpecialWindow = ^TSHideSpecialWindow;

   TSShowMakeGuildWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
      rSysopName : String [20];
   end;
   PTSShowMakeGuildWindow = ^TSShowMakeGuildWindow;

   TSShowGuildInfoWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
      rboEdit : Byte; // if 1 for sysop else for others 
      rGuildName : String [20];
      rGuildX, rGuildY : Word;
      rCreateDate : String [20];
      rSysop : String [20];
      rSubSysop : array [0..3 - 1] of String [20];
      rGuildNpc : array [0..5 - 1] of String [20];
      rGuildNpcX, rGuildNpcY : array [0..5 - 1] of Word;
      rGuildTitle : String [80];
      rGuildMagic : String [20];
      rGuildAward : String [20];
      rGuildDura : Integer;
   end;
   PTSShowGuildInfoWindow = ^TSShowGuildInfoWindow;

   TSShowGuildWarWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
   end;
   PTSShowGuildWarWindow = ^TSShowGuildWarWindow;

   TSShowGuildMagicWindow = packed record
      rMsg : Byte;
      rWindow : Byte;
      rSpeed, rDamageBody : Word;                              // 100
      rRecovery, rAvoid : Word;                                // 100
      rDamageHead, rDamageArm, rDamageLeg : Word;
      rArmorBody, rArmorHead, rArmorArm, rArmorLeg : Word;     // 228
      rOutPower, rInPower, rMagicPower, rLife : Word;          // 80
   end;
   PTSShowGuildMagicWindow = ^TSShowGuildMagicWindow;

   TSShowBattleBar = packed record
      rMsg : Byte;
      rWinType : Byte;   // 1 : ����1�� (1��) 2 : 2�� (3��) 3 : 3�� (5��)
      rLeftName : array [0..60 - 1] of Char;
      rLeftWin : Byte;
      rLeftPercent : Byte;
      rRightName : array [0..60 - 1] of Char;
      rRightWin : Byte;
      rRightPercent : Byte;
   end;
   PTSShowBattleBar = ^TSShowBattleBar;

   TSShowCenterMsg = packed record
      rMsg : Byte;
      rColor : Word;
      rText : TWordString;
   end;
   PTSShowCenterMsg = ^TSShowCenterMsg;

   TSCount = packed record
      rmsg : byte;
      rCountid  : LongInt;
      rsourkey : word;
      rdestkey : word;
      rCountCur : LongInt;
      rCountMax : LongInt;
      rCountName: TWordString;
   end;
   PTSCount = ^TSCount;

   TSMarketCount = packed record
      rmsg : byte;
      rsourkey : word;
      rdestkey : word;
      rCountMax : LongInt;
   end;
   PTSMarketCount = ^TSMarketCount;

   TSShowMarketWindow = packed record
      rMsg : Byte;
      rMarketCount : Byte;        // ȣ�����⿡ ���� count�� ���������.
   end;
   PTSShowMarketWindow = ^TSShowMarketWindow;

   TSStartHelpWindow = packed record
      rMsg : Byte;
      rFileName : TNameString;
      rHelpText : TWordString;
   end;
   PTSStartHelpWindow = ^TSStartHelpWindow;

   TSStartGuildInputWindow = packed record
      rMsg : Byte;
      rSenderID : LongInt;
      rFileName : TNameString;
      rHelpText : TWordString;
   end;
   PTSStartGuildInputWindow = ^TSStartGuildInputWindow;

   TSItemWindow = packed record
      rMsg : Byte;
      rName : TNameString;
      rColor: byte;
   end;
   PTSItemWindow = ^TSItemWindow;

   TSItemWindow2 = packed record
      rMsg : Byte;
      rViewName : array [0..30 - 1] of byte;
      rGrade : Byte;
      rShape : Word;
      rColor: byte;
      rPrice : Integer;
      // add by Orber at 2004-09-07 14:04
      rLockState : Byte;
      runLockTime : Word;
      rWordString : TWordString;
   end;
   PTSItemWindow2 = ^TSItemWindow2;

   TSItemWindow3 = packed record
      rMsg : Byte;
      rViewName : TNameString;
      rShape : Word;
      rColor: byte;
      rKey : Byte;
      rButton : TNameString;
      rWordString : TWordString;
   end;
   PTSItemWindow3 = ^TSItemWindow3;

   TSBestAttackMagicWindow = packed record
      rMsg : Byte;
      rKey : Byte;
      rViewName : TNameString;
      rShape         : Word;
      rGrade         : word;
      rDamageBody    : word;
      rDamageHead    : word;
      rDamageArm     : word;
      rDamageLeg     : word;
      rDamageEnergy  : word;
      rContents      : TWordString;
   end;
   PTSBestAttackMagicWindow = ^TSBestAttackMagicWindow;

   TSBestProtectMagicWindow = packed record
      rMsg : Byte;
      rKey : Byte;
      rViewName : TNameString;
      rShape        : Word;
      rGrade        : word;
      rArmorBody    : word;
      rArmorHead    : word;
      rArmorArm     : word;
      rArmorLeg     : word;
      rArmorEnergy  : word;
      rContents     : TWordString;
   end;
   PTSBestProtectMagicWindow = ^TSBestProtectMagicWindow;

   TSBestSpecialMagicWindow = packed record
      rMsg : byte;
      rKey : Byte;
      rViewName : TNameString;
      rShape : Word;
      rNeedStatePoint : integer;
      rContents : TWordString;
   end;
   PTSBestSpecialMagicWindow = ^TSBestSpecialMagicWindow;

   TSShowTradeWindow = packed record
      rMsg : Byte;               // SM_SHOWTRADEWINDOW
      rTradeType : Byte;         // �Ǹ�â(0), ����â(1) <- �ָ�����   �Ǹ�â(3), ����â(4) <- ����npc����
      rTitle : TNameString;      // ����
      rImageName : TNameString;  // �׸������̸�
      rImageValue : Integer;     // �׸�������ġ
      rWordString : TWordString; // ����
   end;
   PTSShowTradeWindow = ^TSShowTradeWindow;

   TSShowIndividualMarketWindow = packed record
      rMsg : Byte;               // SM_SHOWINDIVIDUALMARKETWINDOW
      rMarketTargetId : Integer; // �Ǹ�â�� ������ �׸������ֱ����� ����id�� ����
      rCaption : TWordString;    // ����
   end;
   PTSShowIndividualMarketWindow = ^TSShowIndividualMarketWindow;

   TSSetTradeItem = packed record
      rMsg : Byte;               // SM_SETTRADEITEM
      rTotalPrice : Integer;     // �հ�ݾ� 
      rWordString : TWordString; // ������ ����Ʈ ���
      // Item1 (Name:Shape:Color:Price:Count), Item2 (Name:Shape:Color:Price:Count), ...
   end;
   PTSSetTradeItem = ^TSSetTradeItem;

   TSReConnect = packed record
      rmsg : byte;
      rId : TNameString;
      rPass : TNameString;
      rCharName : TNameString;    // LendName
      rIpAddr : TNameString;      // addr
      rPort : integer;            // port
   end;
   PTSReConnect = ^TSReConnect;

   TSConnectThru = packed record
      rMsg : Byte;
      rIpAddr : TNameString;
      rPort : Integer;
   end;
   PTSConnectThru = ^TSConnectThru;

   TSRainning = packed record
      rmsg : byte;
      rspeed: integer;
      rCount: integer;
      rOverray: integer;
      rTick: integer;
      rRainType : byte;
   end;
   PTSRainning = ^TSRainning;

   TSMessage = packed record
      rmsg : byte;
      rkey : word;
      rWordString : TWordString;
   end;
   PTSMessage = ^TSMessage;

   TSWindow = packed record
      rmsg : byte;
      rwindow : byte;
      rboShow : Boolean;
   end;
   PTSWindow = ^TSWindow;

   TSNewMap = packed record
      rmsg : byte;
      rMapName : TNameString;
      rCharName : TNameString;
      rId : LongInt;
      rx, ry: word;
      rObjName : TNameString;
      rTilName : TNameString;
      rRofName : TNameString;
      rboDark : boolean;//} byte;
      rboRain : boolean;//} byte;
   end;
   PTSNewMap = ^TSNewMap;

// rNameString�� �ִ� ��������,���ĸ��� rWordString���� �̵�
   TSShow = packed record
      rmsg : byte;
      rId : LongInt;
//      rNameString: array [0..60 - 1] of byte;
      rdir, rx, ry: word;
      rFeature: TFeature;
      rWordString : TWordString;
   end;
   PTSShow = ^TSShow;

   // AniItem 010102 ankudo
   TDynamicObjectState = (dos_Closed, dos_Openning, dos_Openned, dos_Scroll);
   TSShowDynamicObject = packed record
      rmsg : byte;
      rId : LongInt;
      rNameString: TNameString;
      rx, ry: word;
      rShape : word;
      rState : Byte;
      rFrameStart, rFrameEnd : Word;
      rGuardX : array [0..20 - 1] of ShortInt;
      rGuardY : array [0..20 - 1] of ShortInt;
   end;
   PTSShowDynamicObject = ^TSShowDynamicObject;

   TSShowItem = packed record
      rmsg : byte;
      rId : LongInt;
      rNameString: TNameString;
      rx, ry: word;
      rshape : word;
      rcolor: byte;
      rRace : byte;
      rEffectNumber : Word;
      rEffectKind : TLightEffectKind;
   end;
   PTSShowItem = ^TSShowItem;

   TSShowMonster = packed record
      rmsg : byte;
      rId : LongInt;
      rNameString: TNameString;
      rdir, rx, ry: word;
      rshape : word;
      rcolor: byte;
   end;
   PTSShowMonster = ^TSShowMonster;

   TSHide = packed record
      rmsg : byte;
      rId : LongInt;
   end;
   PTSHide = ^TSHide;

   TSTurn = packed record
      rmsg : byte;
      rId : LongInt;
      rdir, rx, ry: word;
   end;
   PTSTurn = ^TSTurn;

   TSMove = packed record
      rmsg : byte;
      rId : LongInt;
      rdir, rx, ry: word;
   end;
   PTSMove = ^TSMove;

   TSSay = packed record
      rmsg : byte;
      rId : LongInt;
      rkind : byte;
      rWordString: TWordString;
   end;
   PTSSay = ^TSSay;

   TSChatMessage = packed record
      rmsg : byte;
      rFColor: word;
      rBColor: word;
      rWordString : TWordString;
   end;
   PTSChatMessage = ^TSChatMessage;

   TSMessenger = packed record
      rmsg : byte;
      rTime : TNameString;
      rWordString : TWordString;
   end;
   PTSMessenger = ^TSMessenger;

   TSChangeFeature = packed record
      rmsg : byte;
      rId : LongInt;
      rFeature: TFeature;
//      rWordString : TWordString;  // �����Ǹ�â��..
   end;
   PTSChangeFeature = ^TSChangeFeature;

   TSChangeState = packed record
      rmsg : byte;
      rId : LongInt;
      rState : byte;
      rFrameStart, rFrameEnd : Word;
   end;
   PTSChangeState = ^TSChangeState;

   TSChangeProperty = packed record
      rmsg : byte;
      rId : LongInt;
      rNameString: TNameString;
   end;
   PTSChangeProperty = ^TSChangeProperty;

   TSHaveItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rCount : Integer;
      rColor: byte;
      rShape: word;
   end;
   PTSHaveItem = ^TSHaveItem;

   TSHaveItemNew = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rCount : Integer;
      rColor: byte;
      rShape: word;
      rViewColor : integer;

      //add by Orber at 2004-09-07 10:18
      rLockState : Byte;
      runLockTime : Word;
   end;
   PTSHaveItemNew = ^TSHaveItemNew;

   TSHaveMarketItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rCount : Integer;
      rColor: byte;
      rShape: word;
      rPrice : Integer;
   end;
   PTSHaveMarketItem = ^TSHaveMarketItem;

   TSWearItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rColor: byte;
      rShape: word;
   end;
   PTSWearItem = ^TSWearItem;

   TSHaveMagic = packed record
      rmsg : byte;
      rkey : byte;
      rShape: word;
      rName : TNameString;
      rSkillLevel : word;
      rpercent : byte;
   end;
   PTSHaveMagic = ^TSHaveMagic;

   TSHaveRiseMagic = packed record
      rMsg : byte;
      rKey : byte;
      rShape: word;
      rName : TNameString;
      rSkillLevel : word;
      rPercent : byte;
   end;
   PTSHaveRiseMagic = ^TSHaveRiseMagic;

   //2002-11-06 giltae
   TSHaveMystery = packed record
      rMsg : byte;
      rKey : byte;
      rShape : word;
      rName : TNameString;
      rSkillLevel : word;
      rPercent : byte;
   end;
   PTSHaveMystery = ^TSHaveMystery;

   //2003-09-19 giltae
   TSHaveBestMagic = packed record
      rMsg : byte;
      rKey : byte;
      rShape : word;
      rName : TNameString;
      rSkillLevel : word;
      rPercent : byte;
   end;
   PTSHaveBestMagic = ^TSHaveBestMagic;
   
   TSAttribBase = packed record
      rmsg    : byte;
      rAge    : word;
      rCurEnergy, rEnergy : Integer;
      rCurInPower, rInPower : word;
      rCurOutPower, rOutPower : word;
      rCurMagic, rMagic : word;
      rCurLife, rLife   : word;
      rLover  : TNameString;
   end;
   PTSAttribBase = ^TSAttribBase;

   TSAttribValues = packed record
      rmsg      : byte;
      rLight    : word;
      rDark     : word;
      rMagic    : word;
      rtalent   : word;
      rGoodChar : word;
      rBadChar  : word;
      rlucky    : word;
      radaptive : word;      // ����
      rRevival  : word;      // ���
      rimmunity : word;
      rvirtue   : word;      // ȣ������

      rhealth    : word;
      rsatiety   : word;
      rpoisoning : word;
      rheadseak  : word;
      rarmseak   : word;
      rlegseak   : word;
   end;
   PTSAttribValues = ^TSAttribValues;

   //2003-10-01
   TSExtraAttribValues = packed record
      rmsg      : Byte;
      ExtraExp  : Integer;
      AddableStatePoint : Integer;
   end;
   PTSExtraAttribValues = ^TSExtraAttribValues;
   
   TSAttribFightBasic = packed record
      rmsg      : byte;
      rWordString : TWordString;
   end;
   PTSAttribFightBasic = ^TSAttribFightBasic;

   TSAttribLife = packed record
      rmsg : byte;
      rcurLife : word;
   end;
   PTSAttribLife = ^TSAttribLife;

   TSEventString = packed record
      rmsg : byte;
      rWordString: TWordString;
   end;
   PTSEventString = ^TSEventString;

   TSStructed = packed record
      rmsg : byte;
      rId : LongInt;
      rRace : Byte;
      rpercent : Byte;
   end;
   PTSStructed = ^TSStructed;

   TSMovingMagic = packed record
      rmsg : byte;
      rsid, reid : LongInt;            // ����   , �������
      rtx, rty : word;                 // ������ (��������� �������)
      rMoveingStyle: byte;             // ���󰡴� ���
      rsf, rmf, ref: byte;             // ���� ���� ������ ���
      rspeed : byte;                   // �ӵ�
      rafterimage : byte;              // �ܻ�
      rafterover : byte;               // �ܻ� ��������
      rtype : byte;                    // 0 : default, 1 : ��;����
      rsEffectNumber : word;
      rsEffectKind : TLightEffectKind;
      reEffectNumber : word;
      reEffectKind : TLightEffectKind;
    end;
   PTSMovingMagic = ^TSMovingMagic;

   TSSoundString = packed record
      rmsg : byte;
      rHiByte, rLoByte : byte;
      rSoundName : array[0..12] of byte;
      rX, rY : Word;
   end;
   PTSSoundString = ^TSSoundString;

   TSSoundBaseString = packed record
      rmsg : byte;
      rRoopCount : word;
      rWordString: TWordString;
   end;
   PTSSoundBaseString = ^TSSoundBaseString;

   TSHaveWearItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rColor: byte;
      rShape: word;
   end;
   PTSHaveWearItem = ^TSHaveWearItem;

   TSAttribHeader = packed record
      rmsg : byte;
      rTrade : TNameString;
      rlevel : byte;
      rexperience : LongInt;
      rnextexperience : LongInt;
      rMoney : Longint;
   end;
   PTSAttribHeader = ^TSAttribHeader;

   TSAttribTail = packed record
      rmsg : byte;
      rWordString: TWordString;
   end;
   PTSAttribTail = ^TSAttribTail;

   TSAttribMana = packed record
      rmsg : byte;
      rcurMana : word;
   end;
   PTSAttribMana = ^TSAttribMana;

   TSAttribMoney = packed record
      rmsg : byte;
      rMoney : LongInt;
   end;
   PTSAttribMoney = ^TSAttribMoney;

   TSAttribExperience = packed record
      rmsg : byte;
      rExperience : LongInt;
   end;
   PTSAttribExperience = ^TSAttribExperience;

   TSAttribStem = packed record
      rmsg : byte;
      rcurStem : word;
   end;
   PTSAttribStem = ^TSAttribStem;

   TSSetTilAndObj = packed record
      rmsg : byte;
      rWordString : TWordString;
   end;
   PTSSetTilAndObj = ^TSSetTilAndObj;

   TSHaveItemInfo = packed record
      rmsg : byte;
      rkey : byte;
      rShape : word;
      rkind : byte;
      rWordString : TWordString;
   end;
   PTSHaveItemInfo = ^TSHaveItemInfo;

   TSHaveMagicInfo = packed record
      rmsg : byte;
      rkey : byte;
      rtype : byte;
      rLevel : byte;
      rShape : integer;
      rWordString : TWordString;
   end;
   PTSHaveMagicInfo = ^TSHaveMagicInfo;

   TSMotion = packed record
      rmsg : byte;
      rId : LongInt;
      rmotion : word;
      rMagicState : byte;      // ����                1:�⺻���� 2 : ��¹���
      rMagicKind : byte;       // ��������            1:��  2:��  3:��  4:â  5:��
      rEffectColor : byte;     // ������effect����    1 - 7������
   end;
   PTSMotion = ^TSMotion;

   TSEffect = packed record
      rmsg : byte;
      rId : LongInt;
      reffect : byte;
   end;
   PTSEffect = ^TSEffect;

   TSHit = packed record
      rmsg : byte;
      rid : LongInt;
      rdir : word;
   end;
   PTSHit = ^TSHit;

   TSMagic = packed record
      rmsg : byte;
      rid : LongInt;
      rdir : word;
   end;
   PTSMagic = ^TSMagic;

   TSMenu = packed record
      rmsg : byte;
      rid  : LongInt;
      rn : byte;
      rtitlecolor: word;
      rselectcolor :word;
      rdisplaytime : word;
      rIcons : array [0..32-1] of word;
      rMenuTitle : TNameString;
      rWordString: TWordString;
   end;
   PTSMenu = ^TSMenu;

   TSSetPosition = packed record
      rmsg : byte;
      rid : LongInt;
      rdir : word;
      rx : word;
      ry : word;
   end;
   PTSSetPosition = ^TSSetPosition;

   TSSendDelay = packed record
      rmsg : byte;
      rsenddelay: word;
   end;
   PTSSendDelay = ^TSSendDelay;

   TSScrollText = packed record
      rmsg : byte;
      rWordString: TWordString;
   end;
   PTSScrollText = ^TSScrollText;

   TSReEnterAddress = packed record
      rmsg : byte;
      rWordString: TWordString;
   end;
   PTSReEnterAddress = ^TSReEnterAddress;

   // add by Orber at 2004-09-08 16:55

   TSLogItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rCount : word;
      rColor: byte;
      rShape: word;

      rLockState : word;
      runLockTime :word;
   end;
   PTSLogItem = ^TSLogItem;

   {TSLogItem = packed record
      rmsg : byte;
      rkey : byte;
      rName : TNameString;
      rCount : word;
      rColor: byte;
      rShape: word;
   end;
   PTSLogItem = ^TSLogItem;}

   TSCheck = packed record
      rMsg : Byte;
      rCheck : Byte; // 1�̸� ������ üũ, 2�� Ŭ���̾�Ʈ Tick üũ
   end;
   PTSCheck = ^TSCheck;

   TSMiniMap = packed record
      rMsg : Byte;
      rWordString: TWordString;
   end;
   PTSMiniMap = ^TSMiniMap;

   TSSetShortCut = packed record
      rMsg : Byte;
      rPosition : array [0..8 - 1] of Byte;
   end;
   PTSSetShortCut = ^TSSetShortCut;

   TSPasswordWindow = packed record
      rMsg : Byte;
      rOption : Byte;    //  0:None  1:�����������  2:�����������  3:�����ۺ������  4:�����ۺ������
   end;
   PTSPasswordWindow = ^TSPasswordWindow;

   TSSetPowerLevel = packed record
      rMsg : Byte;
      rName : TNameString;
      rLevel : Word;
   end;
   PTSSetPowerLevel = ^TSSetPowerLevel;

   TSShowJobWindow = packed record
      rMsg : Byte;
      rShape : Byte;
      rJobKind : TNameString;
      rJobGrade : TNameString;
      rJobTool : TNameString;
      rExtJobGrade: TNameString;
      rExtJobLevel: Integer;
   end;
   PTSShowJobWindow = ^TSShowJobWindow;       // ���â

   TSJobResult = packed record
      rMsg : Byte;
      rboSuccess : Boolean;
      rWorkSound : TNameString;
      rResultSound : TNameString;
      rWordString : TWordString;
   end;
   PTSJobResult = ^TSJobResult;

   TSMaterialData = packed record
      rMsg : Byte;
      rWordString : TWordString;      // ItemName:Shape:Count
   end;
   PTSMaterialData = ^TSMaterialData;

   //2003-10
   TSSetEffect = packed record
      rMsg : Byte;
      rId : LongInt;
      rEffectNumber : Word;
      rEffectKind : TLightEffectKind;
      rDelay : integer;
   end;
   PTSSetEffect = ^TSSetEffect;

   TSScreenEffect = packed record
      rMsg : Byte;
      rScreenEffectNum : Byte;
      rDelay : integer;
   end;
   PTSScreenEffect = ^TSScreenEffect;

   TSSetActionState = packed record
      rMsg : Byte;
      rId : LongInt;
      rActionState : TActionState;
   end;
   PTSSetActionState = ^TSSetActionState;
   
   TSEventMessage = packed record
      rMsg : Byte;
      rName : TNameString;     // Ȯ��, ���
      rMsg1 : string[60];
      rMsg2 : string[60];
   end;
   PTSEventMessage = ^TSEventMessage;
   
   TWordInfoString = packed record
      rmsg : byte;
      rWordString: TWordString;
   end;
   PTWordInfoString = ^TWordInfoString;


///////////////////////////////////
//        Client Structure       //
///////////////////////////////////

   TCKey = packed record
      rmsg : byte;
      rkey : word;
   end;
   PTCKey = ^TCKey;

   TCVer = packed record
      rmsg : byte;
      rVer : word;
      rNation : word;
   end;
   PTCVer = ^TCVer;

   TCIdPass = packed record
      rmsg : byte;
      rId : TNameString;
      rPass : TNameString;
      rCompany : TNameString; 
   end;
   PTCIdPass = ^TCIdPass;

   TCIdPassAzacom = packed record
      rmsg : byte;
      rId : TNameString;
      rPass : TNameString;
      rAzaComid : TNameString;
   end;
   PTCIdPassAzaCom = ^TCIdPassAzaCom;

   TCCreateIdPass = packed record
      rmsg : byte;
      rid : TNameString;
      rPass : TNameString;
      rName : TNameString;
      rTelephone : TNameString;
      rBirth : TNameString;
   end;
   PTCCreateIdPass = ^TCCreateIdPass;

   TCCreateIdPass2 = packed record
      rmsg : byte;
      rid : TNameString;
      rPass : TNameString;
      rName : TNameString;
      rMasterKey : TNameString;
      rNativeNumber : TNameString;
   end;
   PTCCreateIdPass2 = ^TCCreateIdPass2;

   TCCreateIdPass3 = packed record
      rMsg : Byte;
      rID : String [12];
      rPass : String [12];
      rName : String [12];
      rNativeNumber : String [15];
      rMasterKey : String [12];
      rEmail : String [32];
      rPhone : String [15];
      rParentName : String [12];
      rParentNativeNumber : String [15];
   end;
   PTCCreateIDPass3 = ^TCCreateIDPass3;

   TCChangePassWord = packed record
      rmsg : byte;
      rNewPass : TNameString;
   end;
   PTCChangePassWord = ^TCChangePassWord;

   TCCreateChar = packed record
      rmsg : byte;
      rchar : TNameString;
      rSex : byte;
      rVillage : TNameString;
      rServer : TNameString;
   end;
   PTCCreateChar = ^TCCreateChar;

   TCDeleteChar = packed record
      rmsg : byte;
      rchar : TNameString;
   end;
   PTCDeleteChar = ^TCDeleteChar;

   TCSelectChar = packed record
      rmsg : byte;
      rchar : TNameString;
   end;
   PTCSelectChar = ^TCSelectChar;

  // add by Orber at 2004-10-21 13:23:22
   TCSelectChar1 = packed record
      rmsg : byte;
      rchar : array [0..27-1] of byte;
   end;
   PTCSelectChar1 = ^TCSelectChar1;


   TCSay = packed record
      rmsg : byte;
      rWordString : TWordString;
   end;
   PTCSay = ^TCSay;

   TCMove = packed record
      rmsg : byte;
      rdir : word;
      rx, ry : word;
      rTick : Integer;      
   end;
   PTCMove = ^TCMove;

   TCClick = packed record
      rmsg : byte;
      rwindow : byte;
      rShift : TShiftState;
      rclickedId : LongInt;
      rkey : word;
      rX, rY : Word;
   end;
   PTCClick = ^TCClick;

   TCDragDrop = packed record
      rmsg : byte;
      rsourwindow : byte;
      rdestwindow : byte;
      rsourId : LongInt;
      rdestId : LongInt;
      rsx, rsy : word;
      rdx, rdy : word;
      rsourkey : word;
      rdestkey : word;
   end;
   PTCDragDrop = ^TCDragDrop;

   TCHit = packed record
      rmsg : byte;
      rkey : word;
      rtid : integer;
      rtx, rty: word;
   end;
   PTCHit = ^TCHit;

   TCWindowConfirm = packed record
      rMsg : Byte;
      rWindow : Byte;
      rType : Byte;
      rboCheck : Boolean;
      rButton : Byte;
      rText : String [30];
   end;
   PTCWindowConfirm = ^TCWindowConfirm;

   TCMarketConfirm = packed record
      rMsg : Byte;
      rConfirmType : Byte;       // 0 : ����  1 : �ǸŰ��� (����)  2 : �ǸŰ��� (����)
      rTitle : TWordString;
   end;
   PTCMarketConfirm = ^TCMarketConfirm;

   TCGiveItem = packed record
      rmsg: byte;
      rkey : word;
      rid : LongInt;
   end;
   PTCGiveItem = ^TCGiveItem;

   TCChangeItem = packed record
      rmsg : byte;
      rfir, rsec : word;
   end;
   PTCChangeItem = ^TCChangeItem;

   TCChangeMagic = packed record
      rmsg : byte;
      rfir, rsec : word;
   end;
   PTCChangeMagic = ^TCChangeMagic;

   TCMouseEvent = packed record
     rmsg : byte;
     revent: array [0..10-1] of integer;
   end;
   PTCMouseEvent = ^TCMouseEvent;

   TCCheck = packed record
      rMsg : Byte;
      rCheck : Byte;
      rTick : Integer;
      // rCheck�� 1�̸� rTick = 0 (�����Ͼ���) or 1 (����������)
      // rCheck�� 2�̸� rTick = timeGetTime();
   end;
   PTCCheck = ^TCCheck;

   TCMakeGuildData = packed record
      rMsg : Byte;
      rGuildName : String [20];
      rSubSysop : array [0..3 - 1] of String [20];
      rAgreeChar : array [0..6 - 1] of String [20];
   end;
   PTCMakeGuildData = ^TCMakeGuildData;

   TCGuildInfoData = packed record
      rMsg : Byte;
      rGuildName : String [20];
      rGuildX, rGuildY : Word;
      rCreateDate : String [20];
      rSysop : String [20];
      rSubSysop : array [0..3 - 1] of String [20];
      rGuildNpc : array [0..5 - 1] of String [20];
      rGuildNpcX, rGuildNpcY : array [0..5 - 1] of Word;
      rGuildTitle : String [80];
      rGuildMagic : String [20];
      rGuildAward : String [20];
      rGuildDura : Integer;
      rGuildWear1 : String [40];
      rGuildWear2 : String [40];
   end;
   PTCGuildInfoData = ^TCGuildInfoData;

   TCGuildWarData = packed record
      rMsg : Byte;
      rWGName : String [20];
      rWGSysop : String [20];
      rTime : Byte;
   end;
   PTCGuildWarData = ^TCGuildWarData;

   TSNetState = packed record
      rMsg : Byte;
      rID : Integer;
      rMadeTick : Integer;
      rQuestion : array[0..15] of byte;
   end;
   PTSNetState = ^TSNetState;

   TCNetState = packed record
      rMsg : Byte;
      rID : Integer;
      rMadeTick : Integer;
      rCurTick : Integer;
      rAnswer1 : cardinal;
      rAnswer2 : cardinal;
   end;
   PTCNetState = ^TCNetState;

   // add by minds 040323
   TCEncNetState = packed record
      rMsg : Byte;
      rEncData: array[0..16-1] of byte;
   end;

   TCSetShortCut = packed record
      rMsg : Byte;
      rButton : Byte; // F5 - F12 (0 - 7)
      rPosition : Byte;
   end;
   PTCSetShortCut = ^TCSetShortCut;

   TCPassWord = packed record
      rmsg : byte;
      rNewPass : array [0..9 - 1] of byte;
      rOption : Byte;         //  0:None  1:�����������  2:�����������  3:�����ۺ������  4:�����ۺ������
   end;
   PTCPassWord = ^TCPassWord;

   TCGuildMagicData = packed record
      rMsg : Byte;
      rWindow : Byte;
      rMagicName : String [20];
      rMagicType : Byte;   // MAGICTYPE_WRESTLING, MAGICTYPE_FENCING, MAGICTYPE_SWORDSHIP,
                           // MAGICTYPE_HAMMERING, MAGICTYPE_SPEARING
      rSpeed, rDamageBody : Word;                              // 100
      rRecovery, rAvoid, rAccuracy, rKeepRecovery : Word;                                // 100
      rDamageHead, rDamageArm, rDamageLeg : Word;
      rArmorBody, rArmorHead, rArmorArm, rArmorLeg : Word;     // 228
      rOutPower, rInPower, rMagicPower, rLife : Word;          // 80
   end;
   PTCGuildMagicData = ^TCGuildMagicData;

   TCSelectHelpWindow = packed record
      rMsg : Byte;
      rSelectKey : TWordString;
   end;
   PTCSelectHelpWindow = ^TCSelectHelpWindow;

   TCInputGuildWindow = packed record
      rMsg : Byte;
      rSenderID : LongInt;
      rSelectKey : TWordString;
   end;
   PTCInputGuildWindow = ^TCInputGuildWindow;

   TCSelectCount = packed record
      rmsg : byte;
      rboOk : Boolean;
      rsourkey : word;
      rdestkey : word;
      rCountid  : LongInt;
      rCount : LongInt;
   end;
   PTCSelectCount = ^TCSelectCount;

   TCSelectMarketCount = packed record
      rmsg : byte;
      rboOk : Boolean;
      rsourkey : word;
      rdestkey : word;
      rCount : LongInt;
      rCost : Longint;
   end;
   PTCSelectMarketCount = ^TCSelectMarketCount;

   TCSystemInfoData = packed record
      rMsg : Byte;
      rCPUSpeed : Integer;
      rRAMSize : Integer;
      rVGA : TWordString;
   end;
   PTCSystemInfoData = ^TCSystemInfoData;

   TCInputString = packed record
      rmsg : byte;
      rInputStringId : LongInt;
      rSelectedList : TNameString;
      rInputString : TWordString;
   end;
   PTCInputString = ^TCInputString;

   //2003-10
   TCAddStatePoint = packed record
      rmsg : byte;
      rkey : byte;
      ridx : byte;
   end;
   PTCAddStatePoint = ^TCAddStatePoint;
   
   TCEventInput = packed record
      rMsg : Byte;
      rboCheck : Boolean;     // Ȯ��, ���
      rMsg1 : string[60];
      rMsg2 : string[60];
   end;
   PTCEventInput = ^TCEventInput;

   TCSetMaterial = packed record     // �������â upgrade     // CM_SETMATERIAL
      rMsg : Byte;
      rIdx : array[0..3] of Word;
      rCount : array[0..3] of Word;
   end;
   PTCSetMaterial = ^TCSetMaterial;


/////////    FSSockM SocketFunction    //////////////

   TSocketSendFunction = procedure (cnt:integer; pb:pbyte) of object;


   // LoginDb Type
   TGMGuildData = packed record
      rmsg : byte;
      rGuildId: integer;
      rboAllow : Boolean;
      rGuildName: string[20];
      rSysopName: string [20];
   end;
   PTGMGuildData = ^TGMGuildData;

   TGMData = packed record
      rmsg : byte;
      rLogInId: string[20];
      rLogInPass: string[20];
      rCharName: string[20];
      rWordString : TWordString;
   end;
   PTGMData = ^TGMData;

   TLeaveData = packed record
      reventTick : integer;
      rboSendSaveAndClose : Boolean;
      GMD : TGMData;
   end;
   PTLeaveData = ^TLeaveData;

///////////////    udp type   ////////////////

  TStringData = packed record
    rmsg : byte;
    rWordString : TWordString;
  end;
  PTStringData = ^TStringData;

const
   PM_NONE         = 0;
   PM_CHECKPAID    = 1;
   PM_CHECKRESULT  = 2;
   PM_CHECKPAID2    = 3;

type
  TPDData = packed record
    rmsg : byte;
    rConId : integer;
    rLoginId : string[20];
    rIpaddr : string[20];
    rRemainDay : integer;
    rboTimePay : Boolean;
    rSenderPort : integer;
  end;
  PTPDData = ^TPDData;

  TPDData2 = packed record
    rmsg : byte;
    rConId : integer;
    rLoginId : string[20];
    rIpaddr : string[20];
    rRemainDay : integer;
    rboTimePay : Boolean;
    rSenderPort : integer;
    rMakeDate : string[20];
  end;
  PTPDData2 = ^TPDData2;


////////////////////////////////////
// Game Server and Notice Server
////////////////////////////////////
const
   GNM_NONE             = 0;
   GNM_INUSER           = 1;
   GNM_OUTUSER          = 2;
   GNM_ALLCLEAR         = 3;

   NGM_NONE             = 0;
   NGM_REQUESTCLOSE     = 1;
   NGM_REQUESTALLUSER   = 2;

   // Login Server Message
   LG_INSERT            =   0;
   LG_SELECT            =   1;
   LG_DELETE            =   2;
   LG_UPDATE            =   3;

   // DB Server Message
   DB_INSERT            =   0;
   DB_SELECT            =   1;
   DB_DELETE            =   2;
   DB_UPDATE            =   3;
   DB_LOCK              =   4;
   DB_UNLOCK            =   5;
   DB_CONNECTTYPE       =   6;
   DB_ITEMSELECT        =   7;
   DB_ITEMUPDATE        =   8;
  // add by Orber at 2004-11-04 20:08:45
   DB_UPDATE_END        =   9;
  // add by Orber at 2005-03-21 12:13:55
   DB_CREATENEW         =  10;

   // Game Server Message
   GM_CONNECT           =   0;
   GM_DISCONNECT        =   1;
   GM_SENDUSERDATA      =   2;
   GM_SENDGAMEDATA      =   3;
   GM_DUPLICATE         =   4;
   GM_SENDALL           =   5;
   GM_UNIQUEVALUE       =   6;

   // Balance Server Message
   BM_GATEINFO          =   0;

   DB_OK                =   0;
   DB_ERR               =   1;
   DB_ERR_NOTFOUND      =   2;
   DB_ERR_DUPLICATE     =   3;
   DB_ERR_IO            =   4;
   DB_ERR_INVALIDDATA   =   5;
   DB_ERR_NOTENOUGHSPACE =  6;
   DB_ERR_DATAEND       =   7;
   DB_ERR_EMPTY         =   8;

type
   TConnectInfo = packed record
      RemoteIP : String;
      RemotePort : Integer;
      LocalPort : Integer;
   end;

   TPaidType = ( pt_none, pt_invalidate, pt_validate, pt_test, pt_timepay, pt_namemoney, pt_nametime, pt_ipmoney, pt_iptime );
   {
   TPaidData = packed record
      rLoginId : String [20];
      rIpAddr : String [20];
      rRemainDay : Integer;
      rMakeDate : String [20];
      rPaidType : TPaidType;
      rCode : Byte;
   end;
   PTPaidData = ^TPaidData;
   }
   TPaidData2 = packed record
      rLoginId : String [20];
      rIpAddr : String [20];
      rEndDate : TDateTime;
      rPayMode : String [5];
      rPayNo : Integer;
      rPaidType : TPaidType;
   end;
   PTPaidData2 = ^TPaidData2;
   
   TNoticeData = packed record
      rMsg : Byte;
      rLoginID : String [20];
      rCharName : String [20];
      rIpAddr : String [20];
      rPaidType : TPaidType;
      rCode : Byte;
   end;
   PTNoticeData = ^TNoticeData;

   TBalanceData = packed record
      rMsg : Byte;
      rIpAddr : array [0..20 - 1] of char;
      rPort : Integer;
      rUserCount : Integer;
   end;
   PTBalanceData = ^TBalanceData;

   TComData = packed record
      Size : Integer;
      Data : array [0..4096 - 1] of Byte;
   end;
   PTComData = ^TComData;

   TWordComData = packed record
      Size : Word;
      Data : array [0..4096 - 1] of Byte;
   end;
   PTWordComData = ^TWordComData;
   // add by Orber at 2004-09-07 16:18
    TLockItem = packed record
      rmsg: Byte;
      rkey: Byte;
    end;
    PTLockItem = ^TLockItem;

  //Author:Steven Date: 2004-12-09 12:02:44
  //Note:

  TSShowInviteConfirm = packed record
    rMsg: Byte;
    rWindow: Byte;
    rKind: Byte;
    rInvitedSender: TNameString;
    rKey: array[0..37] of Char;
    rCaption: TNameString;
    rWordString: TWordString;
  end;
  PTSShowInviteConfirm = ^TSShowInviteConfirm;

  TSInvitation = packed record
    rMsg: Byte;
    rReturn: Byte;
    rUser: TNameString;
    rKey: array[0..37] of Char;
  end;
  PTSInvitation = ^TSInvitation;

  TSTeamMemberList = packed record
    rMsg: Byte;
    rWindow: Byte;
    rMember: array[0..MAX_TEAM_MEMBER] of TNameString;
  end;
  PTSTeamMemberList = ^TSTeamMemberList;

  //=======================================

  // add by Orber at 2005-01-12 03:31:18
  TSGuildListInfo = packed record
    rMsg: Byte;
    rGuildName: array[0..10-1] of TNameString;
    rGuildID: array[0..10-1] of Byte;
  end;
  PTSGuildListInfo = ^TSGuildListInfo;

  // add by Orber at 2005-01-12 03:31:18
  TSGuildInfo = packed record
    rMsg: Byte;
    rGuildID: Byte;
    rGuildName: String[10];
    rSysopName: String[12];
    rSubSysop0: String[12];
    rSubSysop1: String[12];
    rSubSysop2: String[12];
    rGuildEnergy : Integer;
    rGuildMember : Integer;
  end;
  PTSGuildInfo = ^TSGuildInfo;

  // add by Orber at 2005-01-12 03:31:18
  TMarry = packed record
    Girl : String[12];
    Boy : String[12];
    Party : Boolean;
    BoyClothes : Boolean;
    GirlClothes : Boolean;
    MarryDate : TDateTime;
    UnMarry : Boolean;
    UnMarryDate : TDateTime;
    BoyUnMarry : Boolean;
    GirlUnMarry : Boolean;
  end;
  PTMarry = ^TMarry;

implementation

end.
