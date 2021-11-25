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
---------------------------
### 초기 UI 나타내기
+ CollectionViewDataSource
    + Cell
        + numberOfSection - 섹션의 갯수
        + numberOfItemInSection - 섹션 내 아이템 갯수
        + cellForItemAt > dequeueReusableCell - 보여줄 UICollectionViewCell 
    + Header
        + viewForSupplementaryElementOfKind > dequeueReusableSupplementaryView - 보여줄 헤더 
+ UICollectionViewFlowLayout
    + sizeForItemAt - 셀마다 크기 지정

### 키보드 위치에 따라 뷰 동적으로 움직이기

UITextField 클릭 시 키보드가 올라옴, 이 때 키보드의 높이를 구해서 뷰가 아래쪽(키보드가 올라오는 방향)에서 얼마나 떨어질지 설정하면 된다.

+ 키보드가 올라오는 것을 감지하는 옵저버
    + UIResponser.keyboardWillShowNotification
    + 이를 NotificationCenter.defalut.addObserver()의 매개변수로 넣어준다.

+ 키보드가 끝까지 올라올 때 그 높이를 구해야함
    + UIResponder.keyboradFrameEndUserInfoKey.height
    + 노치 값 만큼 빼줘야함
            + UIResponder.keyboradFrameEndUserInfoKey.height - view.safeAreaInsets.bottom
+ 키보드 영역 밖 터치하면 키보드 내리기
    + UITextField를 클릭하면 포커스가 잡혀서 키보드가 올라오는 거라 이 포커스를 끊어주면 됨
        + UITextField.resignFirstResponder()
    
    

