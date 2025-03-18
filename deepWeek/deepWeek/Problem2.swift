//
//  ToForEach.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

class Problem2{
    let numbers = [1,2,3,4,5]
    
    var result = [String]()
    
    func toForEach(){
//        for number in numbers {
//          result.append(number)
//        }
        
        numbers.forEach{
            result.append(String($0))
        }
    }
    
    func chaining(input: [Int]) -> [String]{
        return input.filter{$0 % 2 == 0}.map{String($0)}
    }
    
    let myMap: ([Int]) -> ([String]) = {
        var result: [String] = []
        for num in $0 {
            result.append(String(num))
        }
        return result
    }
}
