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
    static func == (lhs: Self, rhs: Self) -> Bool {
        // [x]TODO: 동등 조건 추가
        return lhs.title == rhs.title
        
    }
}


class TodoManager{
    enum Section: Int, CaseIterable {
        case todo
        case finished
        
        var title: String {
            switch self {
            case .todo: return "To Do List"
            default: return "Finished List"
            }
        }
    }
    static let shared = TodoManager()
    
    var todos = [Todo]()
    
    var todoList: [Todo]{
        return todos.filter{$0.isDone == false}
    }
    
    var finishedList: [Todo]{
        return todos.filter{$0.isDone == true}
    }
    
    var numOfSection: Int{
        return Section.allCases.count
    }
    
    
    
    func creatTask(_ title: String){
        todos.append(Todo(title: title, isDone: false))
    }
    
    func todoCount() -> Int{
        return todos.count
    }
    func updateTodo(_ todo: Todo){
        if let index = todos.firstIndex(of: todo){
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
