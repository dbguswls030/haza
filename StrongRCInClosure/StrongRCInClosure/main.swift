//
//  main.swift
//  StrongRCInClosure
//
//  Created by 유현진 on 2/7/25.
//

import Foundation
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

//var heading = HTMLElement(name: "h1")
//let defaultText = "some default text"
//print(heading.asHTML())
//
//heading.asHTML = {
//    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
//}
//print(heading.asHTML())



var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph?.asHTML())
paragraph = nil
