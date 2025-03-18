//
//  2.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

class Problem1{
    let sum: (Int, Int) -> String = {
        return "두 수의 합계는 \($0 + $1) 입니다."
    }

    func calculate(num1: Int, num2: Int, closure: (Int, Int) -> (String)){
        print(closure(num1, num2))
    }
}
