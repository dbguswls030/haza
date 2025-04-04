//
//  Book.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

struct Book{
    let seriesNumber: Int
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: URL?
    let chapters: [String]
}
