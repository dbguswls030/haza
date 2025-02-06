//
//  main.swift
//  ARCSubject
//
//  Created by 유현진 on 2/6/25.
//

import Foundation

class Person{
    let name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
}

class Pet{
    var owner: Person?
    
    init(owner: Person? = nil) {
        self.owner = owner
    }
    
    deinit{
        print("Pet is being deinitialized")
    }
}

var hj: Person? = Person(name: "hyeonjin")
var p: Pet? = Pet()

hj?.pet = p
p?.owner = hj

hj = nil
p = nil
