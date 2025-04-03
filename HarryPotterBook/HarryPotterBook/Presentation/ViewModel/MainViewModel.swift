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
            // summary 더보기 toggle 버튼 State가 업데이트 될 때마다 UserDefaults에 저장
            dataService.uploadSummaryToggleState(states: summaryToggleButtonStates)
        }
    }
    
    private var selectedSeriesNumber: Int = 0
    
    var jsonParseErrorListenr: ((String) -> Void)?
    var successedLoad: (() -> Void)?
    var tapSummaryToggleButton: (() -> Void)?
    
    init(){
        // ViewModel init 시 summary 더보기 버튼 상태 값 불러오기
        dataService.loadSummaryToggleState { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let states):
                self.summaryToggleButtonStates = states
            case .failure(_):
                // UserDefaults에서 찾을 수 없는 값이라면(앱 최초 실행 시) 디폴트 값
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
    
    func getNumberOfSeries() -> Int{
        return books.count
    }
}
