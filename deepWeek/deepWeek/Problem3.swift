//
//  Problem3.swift
//  deepWeek
//
//  Created by 유현진 on 3/19/25.
//

import Foundation

final class Problem3{
    // Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a
    func a(array: [Int]) -> [Int]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    // String 배열의 짝수번째 요소를 제거해서 반환하는 함수 b
    func b(array: [String]) -> [String]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    // 위 두 함수를 하나의 함수로 대체할 수 있는 함수 c
    func c<T>(array: [T]) -> [T]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    // 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 함수 d
    func d<T: Numeric>(array: [T]) -> [T] {
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
}
