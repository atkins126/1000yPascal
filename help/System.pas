unit System;

interface

function  GetToken (aStr, aToken, aSep : String) : String;
function  CompareStr (aStr1, aStr2 : String) : Boolean;
function  callfunc (aText: string): string;
procedure print (aText: string);
function  Random (aScope: integer): integer;
function  Length (aText: string): integer;
procedure Inc (aInt: integer);
procedure Dec (aInt: integer);
function  StrToInt (astr: string): integer;
function  IntToStr (aInt: integer): string;
procedure exit;

procedure OnUserStart (aStr : String);
procedure OnUserEnd (aStr : String);

implementation

procedure OnUserStart (aStr : String);
var
   Str : String;
   FirstQuest : Integer;
begin
   // ��Ϊ1��ϵͳ�ű�ֱ����������ϵ���:
   // SetScript (1);
   // ����callfunc���ü�sender
   Str := callfunc ('getfirstquest');
   FirstQuest := StrToInt (Str);
   if FirstQuest < 1 then begin
      Str := callfunc ('getname');
      Str := 'sendsendertopmsg ��ӭ�����[' + Str;
      Str := Str + '],�����ƶ�ǧ�����������';
      print (str);
      Str := 'changefirstquest 1';
      print (str);
      exit;
   end;
end;

procedure OnUserEnd (aStr : String);
begin

end;

end.
