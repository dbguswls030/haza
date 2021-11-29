//
//  ToDo.swift
//  todoList
//
//  Created by 유현진 on 2021/11/23.
//

import Foundation
import UIKit

struct Todo: Equatable{
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
    func updateTodo(_ todo: Todo){
        if let index = todos.firstIndex(of: todo){ //*************여기 안 들어가짐;*************//
            print("g")
            todos[index].update(todo: todo)
            
        }
    }
    func deleteTodo(_ todo: Todo){
        if let index = todos.firstIndex(of: todo){
            todos.remove(at: index)
        }
    }
    
}


class TodoViewModel{ //Model이 변경되면 데이터를 가공하여 update한다.
    
}
