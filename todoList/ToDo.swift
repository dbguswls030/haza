//
//  ToDo.swift
//  todoList
//
//  Created by 유현진 on 2021/11/23.
//

import Foundation

struct Todo{
    var title: String
    var isDone: Bool
    
    mutating func update( todo: Todo){
        self.title = todo.title
        self.isDone = todo.isDone
    }
}


class TodoManager{
    static let shared = TodoManager()
    
    var todos = [Todo]()
    
    func creatTask(_ title: String){
        todos.append(Todo(title: title, isDone: false))
    }
    
    func todoCount() -> Int{
        return todos.count
    }
    
}


class TodoViewModel{ //Model이 변경되면 데이터를 가공하여 update한다.
    
}
