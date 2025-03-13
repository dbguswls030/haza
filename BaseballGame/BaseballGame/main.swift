//
//  main.swift
//  BaseballGame
//
//  Created by 유현진 on 3/10/25.
//

import Foundation

enum ErrorType: String, Error{
    case InvalidInput = "올바르지 않은 입력입니다."
}

final class BaseballGame{
    private var answer = [Int]()
    
    func start(){
        print("< 게임을 시작합니다 >")
        setAnswer()
        gameStart()
    }
    
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
    
    private func checkInput(input: [String]) throws -> [Int]{
        let inputNums = input.compactMap({Int($0)})
        
        if input.count != 3 || inputNums.count != 3{
            throw ErrorType.InvalidInput
        }
        return inputNums
    }
    
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
}

let game = BaseballGame()
game.start()
