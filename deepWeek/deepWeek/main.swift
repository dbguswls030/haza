//
//  main.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

print("필수 1")
let toString = Problem1()
print(toString.sum(1,2))
toString.calculate(num1: 3, num2: 4, closure: toString.sum)


print("필수 2")
let toForEach = Problem2()

toForEach.toForEach()
print(toForEach.numbers)

print(toForEach.chaining(input: [1,2,3,4,5,6,7,8,9,10]))

let result = toForEach.myMap([1,2,3,4,5])
print(result)
