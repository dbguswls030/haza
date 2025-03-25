//
//  BookResponse.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

struct BookResponse: Decodable{
    let data: [BookResponseData]
}

struct BookResponseData: Decodable{
    let attributes: BookResponseDTO
}

struct BookResponseDTO: Decodable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let wiki: String
    let chapters: [ChaptersResponse]
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
        case releaseDate = "release_date"
        case dedication
        case wiki
        case chapters
    }
    
    func toEntity() -> Book{
        return Book(title: title,
                    author: author,
                    pages: pages,
                    releaseDate: releaseDate,
                    dedication: dedication,
                    wiki: URL(string: wiki)!,
                    chapters: chapters.map{$0.title})
    }
}

struct ChaptersResponse: Decodable{
    let title: String
}
