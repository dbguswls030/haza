# Case
- 증가, 감소, 리셋 3가지 유형으로 구분
```
enum Counter{
    case up
    case down
    case reset
}
```
# step
## 1. 버튼 이벤트
```
increaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
@objc private func increase(){
    updateNumber(flag: .up)
    checkLimitNumber() // 버튼 활성화 유무
    showNumber()
}
```
- 숫자 업데이트
- 버튼 활성화 유무 체크
- 숫자 표시

## 2. 숫자 업데이트
```
private var number = 0
private let maxNumber = 10 // 최댓값
private let minNumber = -5 // 최솟값

private func updateNumber(flag: Counter){ // 최대/최소값 설정
    switch flag{
    case .down:
        number = number - 1 < minNumber ? number : number - 1
    case .up:
        number = number + 1 > maxNumber ? number : number + 1
    case .reset:
        number = 0
    }
}
```
- 최대/최솟값에 한해서 숫자 변경

## 3. 버튼 활성화 유무 체크
```
private func checkLimitNumber(){ // 버튼 활성화/비활성화 설정
    decreaseButton.isEnabled = number == minNumber ? false : true
    increaseButton.isEnabled = number == maxNumber ? false : true
}
```
## 4. 숫자 보이기
```
private func showNumber(){
    numberLabel.text = "\(number)"
}
```

