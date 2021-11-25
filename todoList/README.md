#  1일차
---------------------------
UITableView보다 UICollectionView가 todolist를 구현하기에 적합한 것 같다. -> 스타일/디자인 설정 용이

+ 초기 UI 작성
    + TodoListHeader
        + headerTitle
    + TodoListCell
        + checkButton
        + taskName
        + deleteButton

---------------------------
# 2일차

+ CollectionViewDataSource
    + Cell
        + numberOfSection - 섹션의 갯수
        + numberOfItemInSection - 섹션 내 아이템 갯수
        + cellForItemAt > dequeueReusableCell - 보여줄 UICollectionViewCell 
    + Header
        + viewForSupplementaryElementOfKind > dequeueReusableSupplementaryView - 보여줄 헤더 
        
        
