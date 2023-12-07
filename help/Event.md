## BattleMap˵��

�����Ӷ�ս��ÿ����ͼ��Ҫ����2�����ݡ�

## EventItem˵��

```pascal
// 2~8 ΪQuestNoticeĿ¼�е���Ʒ
Name := callfunc ('getrandomitem 0');
Name := callfunc ('getrandomitem 1');
```

- RandomEventItem0: ����������˸߼��һ�����|�߼�����|���
- RandomEventItem1: Ϭţ���˶һ�

��Դ�뿴��������RandomEventItem0��RandomEventItem3����4���ļ�(������Ч0��1)�����⣬���Item��kindֵΪ55��˫���ɵ���RandomEventItem0.sdb�е���Ʒ��

### ���Դ��

```pascal

procedure TRandomEventItemList.LoadFromFile;
var
   DB : TUserStringDB;
   iName, FileName : String;
   i, j : Integer;
   RandomEventItem : TRandomEventItem;
begin
   for j := 0 to 4 - 1 do begin
      FileName := format ('.\Event\RandomEventItem%d.sdb', [j]);
      if FileExists (FileName) then begin
         DB := TUserStringDb.Create;
         DB.LoadFromFile(FileName);

         for i := 0 to DB.Count - 1 do begin
            iName := DB.GetIndexName(i);
            if iName = '' then continue;

            RandomEventItem := TRandomEventItem.Create;
            RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
            RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
            RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
            RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
            RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

            DataList [j].Add (RandomEventItem);
         end;
         DB.Free;
      end;
   end;

   FileName := '.\QuestNotice\QuestItem_1stBeginnerPrize.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         BeginnerQuestList.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_1stPrize.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         QuestList1.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_2ndPrize.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         QuestList2.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_GoldCoin.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         GoldCoinList.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_PickAx.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         PickAxList.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_AttributePiece.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         AttributePieceList.Add (RandomEventItem);
      end;
      DB.Free;
   end;

   FileName := '.\QuestNotice\QuestItem_Weapon.sdb';
   if FileExists (FileName) then begin
      DB := TUserStringDb.Create;
      DB.LoadFromFile(FileName);

      for i := 0 to DB.Count - 1 do begin
         iName := DB.GetIndexName(i);
         if iName = '' then continue;

         RandomEventItem := TRandomEventItem.Create;
         RandomEventItem.ItemName := DB.GetFieldValueString(iName, 'ItemName');
         RandomEventItem.Kind := DB.GetFieldValueInteger(iName, 'Kind');
         RandomEventItem.ItemCount := DB.GetFieldValueInteger(iName, 'ItemCount');
         RandomEventITem.TotalRandomCount := DB.GetFieldValueInteger (iName, 'TotalRandom');
         RandomEventItem.MaxValue := DB.GetFieldValueInteger (iName, 'MaxValue');

         WeaponList.Add (RandomEventItem);
      end;
      DB.Free;
   end;
end;
```