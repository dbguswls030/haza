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
}


class TodoManager{
    var todos = [Todo]()
}
