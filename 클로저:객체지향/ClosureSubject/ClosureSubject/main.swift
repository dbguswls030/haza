//
//  main.swift
//  ClosureSubject
//
//  Created by 유현진 on 2/7/25.
//

import Foundation

let numbers = [1,2,3,4,5]
let doubled = numbers.map{$0*2}
print(doubled)
// [2, 4, 6, 8, 10]


var count = 0
let incrementCounter = { count += 1 }
incrementCounter()
incrementCounter()
print(count)
// 2
