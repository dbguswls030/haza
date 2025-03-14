# Objective - 야구 게임(Lv 1 ~ Lv 3)

- 1부터 9까지의 서로 다른 3개의 숫자를 맞추는 게임

# Key Result

## 정답 만들기
Lv 3
- 0 ~ 9까지의 서로 다른 3자리 수 생성
- 단, 첫 번째 자리는 0 불가
- 중복 방지를 위해 Set 사용
```
var answer = [Int]()

private func setAnswer(){
    var temp = Set<Int>()
    
    while temp.count != 3{
        if temp.count == 0{ // 맨 앞자리
            let randomNum = Int.random(in: 1...9) // 맨 앞자리는 0이 불가능
            temp.insert(randomNum)
            answer.append(randomNum)
        }else{ // 그 외 자릿수
            let randomNum = Int.random(in: 0...9) // 1부터 9까지의 랜덤 수
            if !temp.contains(randomNum){ // 중복 숫자 필터
                temp.insert(randomNum)
                answer.append(randomNum)
            }
        }
    }
}
```
## 정답 맞추기
### Step
1. 3자리 수 입력 받기
```
private func gameStart(){
    var isContinuous = true
    
    while isContinuous {
        print("숫자를 입력하세요")
        let input = readLine()!.map{String($0)}
    
        do{
            let inputNums = try checkInput(input: input)
            if isAnswer(userInput: inputNums){
                isContinuous = false
            }
        }catch let error{
            guard let myError = error as? ErrorType else {
                print("unknown error")
                return
            }
            print(myError.rawValue)
        }
    }
}
```
3. 올바르지 않은 입력 예외 처리
```
enum ErrorType: String, Error{
    case InvalidInput = "올바르지 않은 입력입니다."
}

private func checkInput(input: [String]) throws -> [Int]{
    let inputNums = input.compactMap({Int($0)})
    
    if input.count != 3 || inputNums.count != 3{
        throw ErrorType.InvalidInput
    }
    return inputNums
}
```
   
5. 입력 값과 정답을 대조하여 결과 출력하기
```
private func isAnswer(userInput: [Int]) -> Bool{
    var strike = 0
    var ball = 0
    
    for i in 0..<3{
        for j in 0..<3{
            if i == j, answer[i] == userInput[j]{
                strike += 1
            }else if i != j, answer[i] == userInput[j]{
                ball += 1
            }
        }
    }
    return showResult(strike: strike, ball: ball)
}

private func showResult(strike: Int, ball: Int) -> Bool{
    if strike == 3{
        print("정답입니다!")
        return true
    }else if strike == 0, ball == 0{
        print("Nothing")
        return false
    }else{
        let strikeToString = strike != 0 ? "\(strike) 스트라이크 " : ""
        let ballToString = ball != 0 ? "\(ball) 볼" : ""
        print(strikeToString + ballToString)
        return false
    }
}

```


#TIL
- 올바르지 않은 입력 값에 대해 예외처리가 필요한 요구사항이 있다.
- 올바른 입력 값일 경우에만 로직이 계속 실행되게끔 동작하고 그렇지 않을 경우에는 오류 문구 출력 후 중단되어 새로운 입력 값을 입력 받는 흐름을 목적으로 코드를 작성해 보았다.

다음은 초기의 작성한 코드이다.
```
private func gameStart(){
    var isContinuous = true
    while isContinuous {
        print("숫자를 입력하세요")
        let input = readLine()!.map{String($0)}
        
        checkValidInput(input: input){ inputNums in
            if self.isAnswer(userInput: inputNums){
                isContinuous = false
            }
        }
    }
}

// 초기에 작성한 checkValidInput
private func checkValidInput(input: [String], completion: @escaping ([Int]) -> Void){
    let inputNums = input.compactMap({Int($0)})
    if input.count != 3 || inputNums.count != 3{
        print("올바르지 않은 입력값입니다.")
    }else{
        completion(inputNums)
    }
}
```
탈출 클로저로 작성하여 올바른 입력일 떄 completion()으로 isAnswer()이 실행되고 올바르지 않은 입력의 경우 오류 문구를 출력하여 생각하였던 흐름에 맞게 동작하고 있다.

그러나 흐름은 맞게 동작하나 내가 파악한 요구사항은 "오류를 예외 처리하기" 인점을 생각하면 보다 더 적합한 코드가 있을 것 같았다. 코드리뷰 시간에 팀원 중 미처 생각하지 못 했던 try-catch문을 사용한 코드를 보고 이를 응용하여 Error 타입을 enum으로 작성하고 try-catch문을 이용하여 기존에 작성한 코드보다 적합한 코드로 리팩토링을 하였다.



