//
//  main.swift
//  StackSubject
//
//  Created by 유현진 on 2/6/25.
//

import Foundation

struct Stack<T>{
    private var stack: [T] = []
    
    mutating func push(_ element: T){
        stack.append(element)
    }
    
    mutating func pop() -> T?{
        stack.popLast()
    }
}

var stringStack: Stack<String> = Stack()
stringStack.push("안녕")
stringStack.push("하세요")

print(stringStack.pop()!)
