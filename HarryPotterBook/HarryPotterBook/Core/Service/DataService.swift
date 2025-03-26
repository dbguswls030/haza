//
//  DataService.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

final class DataService {
    
    enum DataError: Error {
        case fileNotFound
        case parsingFailed
    }
    
    func loadBooks(completion: @escaping (Result<[Book], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            completion(.failure(DataError.fileNotFound))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let bookResponse = try JSONDecoder().decode(BookResponseDTO.self, from: data)
            let books = bookResponse.data.enumerated().map { $0.element.attributes.toEntity(offset: $0.offset+1) }
            completion(.success(books))
        } catch {
            print("🚨 JSON 파싱 에러 : \(error)")
            completion(.failure(DataError.parsingFailed))
        }
    }
}
