//
//  BookResponseDTO.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

struct BookResponseDTO: Decodable{
    let data: [BookAttributeDTO]
}

struct BookAttributeDTO: Decodable{
    let attributes: BookDTO
}

struct BookDTO: Decodable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [ChaptersResponse]
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case pages
        case releaseDate = "release_date"
        case dedication
        case summary
        case wiki
        case chapters
    }
}

struct ChaptersResponse: Decodable{
    let title: String
}

extension BookDTO{
    
    func toEntity(offset: Int) -> Book{
        return Book(seriesNumber: offset,
                    title: title,
                    author: author,
                    pages: pages,
                    releaseDate: convertReleaseDateString(releasDate: releaseDate),
                    dedication: dedication,
                    summary: summary,
                    wiki: URL(string: wiki),
                    chapters: chapters.map{$0.title})
    }
    
    private func convertReleaseDateString(releasDate: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = releasDate
        
        guard let date = dateFormatter.date(from: releasDate) else {
            return ""
        }
        
        let entityDateFormatter = DateFormatter()
        entityDateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return entityDateFormatter.string(from: date)
    }
}
