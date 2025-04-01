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
    
    private var summaryToggleButtonStates: [Bool] = [] {
        didSet{
            dataService.uploadSummaryToggleState(states: summaryToggleButtonStates)
        }
    }
    
    private var selectedSeriesNumber: Int = 0
    
    var jsonParseErrorListenr: ((String) -> Void)?
    var successedLoad: (() -> Void)?
    var tapSummaryToggleButton: (() -> Void)?
    
    init(){
        dataService.loadSummaryToggleState { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let states):
                self.summaryToggleButtonStates = states
            case .failure(_):
                let defaultStates = Array(repeating: false, count: 7)
                self.summaryToggleButtonStates = defaultStates
            }
        }
    }
    
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
    
    func getSummaryButtonToggleStates(index: Int) -> Bool{
        return summaryToggleButtonStates[index]
    }
    
    func toggleSummaryStates(index: Int){
        summaryToggleButtonStates[index].toggle()
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
    
    func getSummary(index: Int) -> String{
        return books[index].summary
    }
    
    func setSelectedSeriesNumber(number: Int){
        selectedSeriesNumber = number
    }
    
    func getSeletedSeriesNumber() -> Int{
        return selectedSeriesNumber
    }
}
