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
    
    func loadBooks() {
        dataService.loadBooks { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let books):
                self.books = books
                
            case .failure(let error):
                break
                
            }
        }
    }
    
    func getBookTitle(index: Int) -> String {
        return books[index].title
    }
}
