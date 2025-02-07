//
//  main.swift
//  OOPSubject
//
//  Created by 유현진 on 2/7/25.
//

import Foundation

class Animal{
    let name: String
    func makeSound() -> String{
        return "Some Sound..."
    }
    init(name: String) {
        self.name = name
    }
}

class Dog: Animal{
    override func makeSound() -> String {
        return "Bark!"
    }
}

class Cat: Animal{
    override func makeSound() -> String {
        return "Meow!"
    }
}

let dog = Dog(name: "big dog")
let cat = Cat(name: "big cat")
print(dog.makeSound())
print(cat.makeSound())


var animals: [Animal] = [dog, cat]
animals.forEach{ print($0.makeSound()) }
