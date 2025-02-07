//
//  main.swift
//  ARCInAction
//
//  Created by 유현진 on 2/6/25.
//

import Foundation

//class Person{
//    let name: String
//    var apartment: Apartment?
//    init(name: String){
//        self.name = name
//    }
//    deinit{
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment{
//    let address: String
//    weak var tenant: Person?
//    init(address: String) {
//        self.address = address
//    }
//    deinit{
//        print("Apartment \(address) is being deinitialized")
//    }
//}
//
//var hyeonjin: Person?
//var unit9: Apartment?
//
//hyeonjin = Person(name: "hyeonjin")
//unit9 = Apartment(address: "109")
//
//hyeonjin?.apartment = unit9
//unit9?.tenant = hyeonjin
//
//hyeonjin = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var hj: Customer?

hj = Customer(name: "hyeonjin")
hj?.card = CreditCard(number: 1234_1234_1234_1234, customer: hj!)

hj = nil

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
