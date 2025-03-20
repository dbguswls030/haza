//
//  ToForEach.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

final class Problem2{
    let numbers = [1,2,3,4,5]
    
    var result = [String]()
    
    
    // 아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.
    // for number in numbers {
    //     result.append(number)
    // }
    func toForEach(){
        result = numbers.map{String($0)}
    }
    
    // 주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
    // - 입력: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - 타입: Array<Int>
    // - 출력: [”2”, “4”, “6”, “8”, “10”] - 타입: Array<String>
    func chaining(input: [Int]) -> [String]{
        return input.filter{$0 % 2 == 0}.map{String($0)}
    }
    
    // 체이닝 고차함수 직접 만들기
    func myMap(_ arr: [Int], completion: (Int) -> String) -> [String] {
        arr.map{completion($0)}
    }
}
