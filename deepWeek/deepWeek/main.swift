//
//  main.swift
//  deepWeek
//
//  Created by 유현진 on 3/18/25.
//

import Foundation

print("필수 1")
let toString = Problem1()
print(toString.sum(1,2)) // 두 수의 합계는 3 입니다.
toString.calculate(num1: 3, num2: 4, closure: toString.sum) // 두 수의 합계는 7 입니다.


print("필수 2")
let toForEach = Problem2()

toForEach.toForEach()
print(toForEach.numbers) // [1, 2, 3, 4, 5]

print(toForEach.chaining(input: [1,2,3,4,5,6,7,8,9,10])) // ["2", "4", "6", "8", "10"]

let result = toForEach.myMap([1,2,3,4,5])
print(result) // ["1", "2", "3", "4", "5"]



print("필수 3")
let problem3 = Problem3()
print(problem3.a(array: [1,2,3,4,5])) // [1, 3, 5]

print(problem3.b(array: ["가", "나", "다", "라", "마"])) // ["가", "다", "마"]

print(problem3.c(array: [1,2,3,4,5])) // [1, 3, 5]
print(problem3.c(array: ["가", "나", "다", "라", "마"])) // ["가", "다", "마"]

print(problem3.d(array: [1,2,3,4,5])) // [1, 3, 5]
