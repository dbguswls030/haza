//
//  Book.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

struct Book{
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: URL?
    let chapters: [String]
}

// Date 타입 형식 바꾸고
// Book Entity에 이미지도 삽입되도록
