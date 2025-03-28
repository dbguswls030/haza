//
//  MainViewModel.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

final class MainViewModel{
    private let dataService = DataService()
    
    private var books: [Book] = []
    
    var jsonParseErrorListenr: ((String) -> Void)?
    var successedLoad: (() -> Void)?

    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                self.books = books
                self.successedLoad?()
            case .failure(let error):
                self.jsonParseErrorListenr?(error.localizedDescription)
            }
        }
    }
    
    func getBookTitle(index: Int) -> String {
        return books[index].title
    }
    
    func getBook(index: Int) -> Book{
        return books[index]
    }
    
    func getSeriesNumber(index: Int) -> Int{
        return books[index].seriesNumber
    }
    
}
