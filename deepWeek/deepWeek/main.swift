//
//  main.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

let toString = Problem1()
print(toString.sum(1,2))
toString.calculate(num1: 3, num2: 4, closure: toString.sum)



let toForEach = Problem2()

toForEach.toForEach()
print(toForEach.numbers)

let result = toForEach.myMap([1,2,3,4,5])
print(result)
