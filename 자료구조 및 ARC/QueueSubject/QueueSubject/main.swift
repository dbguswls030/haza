//
//  main.swift
//  QueueSubject
//
//  Created by 유현진 on 2/6/25.
//

import Foundation

struct Queue<T>{
    private var queue: [T] = []
    
    mutating func enqueue(_ element: T){
        queue.append(element)
    }

    mutating func dequeue() -> T?{
        return queue.isEmpty ? nil : queue.removeFirst()
    }
    
    func status() -> [T]{
        return queue
    }
}

var intQueue: Queue<Int> = Queue()
intQueue.enqueue(1)
print(intQueue.status())
intQueue.enqueue(2)
print(intQueue.status())
intQueue.dequeue()
print(intQueue.status())
intQueue.dequeue()
print(intQueue.status())
