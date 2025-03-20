//
//  2.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

final class Problem1{
    // 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
    let sum: (Int, Int) -> String = {
        return "두 수의 합계는 \($0 + $1) 입니다."
    }

    // 위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
    func calculate(num1: Int, num2: Int, closure: (Int, Int) -> (String)){
        print(closure(num1, num2))
    }
}
