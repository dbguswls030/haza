//
//  main.swift
//  GenericsSubject
//
//  Created by 유현진 on 2/10/25.
//

import Foundation

struct Stack<T>{
    var elements: [T] = []
    
    mutating func push(_ element: T){
        elements.append(element)
    }
    mutating func pop() -> T?{
        return elements.isEmpty ? nil : elements.removeLast()
    }
    func status() -> [T]{
        return elements
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.status())
print(intStack.pop())
print(intStack.status())
