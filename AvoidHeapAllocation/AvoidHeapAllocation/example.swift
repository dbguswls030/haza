//
//  example.swift
//  AvoidHeapAllocation
//
//  Created by 유현진 on 2/5/25.
//

import Foundation
import UIKit



enum Color { case blue, green, gray }
enum Shape { case circle, rectangle, triangle }

struct ColorImage: Hashable{
    var color: Color
    var shape: Shape
}

var cache = [ColorImage : UIImage]()

func makeColorImage(color: Color, shape: Shape) -> UIImage{
    let key = ColorImage(color: color, shape: shape)
    
    if let image = cache[key]{
        return image
    }
    ...
}
