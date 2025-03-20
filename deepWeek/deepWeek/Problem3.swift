//
//  Problem3.swift
//  deepWeek
//
//  Created by 유현진 on 3/19/25.
//

import Foundation

final class Problem3{
    func a(array: [Int]) -> [Int]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    func b(array: [String]) -> [String]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    func c<T>(array: [T]) -> [T]{
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
    
    func d<T: Numeric>(array: [T]) -> [T] {
        return array.enumerated().filter{$0.offset % 2 == 0}.map({$0.element})
    }
}
