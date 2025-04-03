//
//  MainViewModel.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import Foundation

protocol ViewModelProtocol{
    associatedtype Action
    associatedtype Mutation
    associatedtype State
    
    var action: ((Action) -> Void)? { get }
    func mutate(action: Action)
    func reduce(mutation: Mutation)
}

final class MainViewModel: ViewModelProtocol{
    
    private let dataService = DataService()

    // 이벤트
    enum Action{
        case loadBooks
        case loadSummaryStates
        case toggleButton(Int)
        case selectedSeriesNumber(Int)
    }
    
    // 이벤트에 대한 로직
    enum Mutation{
        case setBooks([Book])
        case setSummaryStates([Bool])
        case setError(Error)
        case toggleButton(Int)
        case setSelectedSeriesNumber(Int)
    }
    
    // 상태 값
    struct State {
        // fileprivate(set) 외부에서는 read만 허용
        fileprivate(set) var books: [Book] = []
        fileprivate(set) var summaryStates: [Bool] = []
        fileprivate(set) var selectedSeriesNumber: Int = 0
        
        var jsonParseErrorListenr: ((String) -> Void)?
        var successedLoadBooks: (() -> Void)?
        var successedLoadSummaryStates: (() -> Void)?
        var tapSummaryToggleButton: (() -> Void)?
    }
    
    var state: State = State()
    var action: ((Action) -> Void)?

    init(){
        action = { action in
            switch action{
            case .loadBooks:
                self.mutate(action: .loadBooks)
            case .loadSummaryStates:
                self.mutate(action: .loadSummaryStates)
            case .toggleButton(let seriesNumber):
                self.mutate(action: .toggleButton(seriesNumber))
            case .selectedSeriesNumber(let number):
                self.mutate(action: .selectedSeriesNumber(number))
            }
        }
    }
    
    func mutate(action: Action) {
        switch action{
        case .loadBooks:
            dataService.loadBooks { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let books):
                    reduce(mutation: .setBooks(books))
                case .failure(let error):
                    reduce(mutation: .setError(error))
                }
            }
        case .loadSummaryStates:
            dataService.loadSummaryToggleState { [weak self] result in
                guard let self = self else { return }
                switch result{
                case .success(let states):
                    reduce(mutation: .setSummaryStates(states))
                case .failure(_):
                    // UserDefaults에서 찾을 수 없는 값이라면(앱 최초 실행 시) 디폴트 값
                    let defaultStates = Array(repeating: false, count: 7)
                    reduce(mutation: .setSummaryStates(defaultStates))
                }
            }
        case .toggleButton(let seriseNumber):
            reduce(mutation: .toggleButton(seriseNumber))
        case .selectedSeriesNumber(let number):
            reduce(mutation: .setSelectedSeriesNumber(number))
        }
    }
    
    func reduce(mutation: Mutation) {
        switch mutation{
        case .setBooks(let books):
            state.books = books
            state.successedLoadBooks?()
        case .setSummaryStates(let states):
            state.summaryStates = states
            state.successedLoadSummaryStates?()
        case .setError(let error):
            state.jsonParseErrorListenr?(error.localizedDescription)
        case .toggleButton(let seriseNumber):
            state.summaryStates[seriseNumber].toggle()
            state.tapSummaryToggleButton?()
            dataService.uploadSummaryToggleState(states: state.summaryStates)
        case .setSelectedSeriesNumber(let number):
            state.selectedSeriesNumber = number
        }
    }
    
    func getSummaryButtonToggleStates(index: Int) -> Bool{
        return state.summaryStates[index]
    }
    
    func getBookTitle(index: Int) -> String {
        return state.books[index].title
    }
    
    func getBook(index: Int) -> Book{
        return state.books[index]
    }
    
    func getSeriesNumber(index: Int) -> Int{
        return state.books[index].seriesNumber
    }
    
    func getSummary(index: Int) -> String{
        return state.books[index].summary
    }
    
    func getSeletedSeriesNumber() -> Int{
        return state.selectedSeriesNumber
    }
    
    func getNumberOfSeries() -> Int{
        return state.books.count
    }
}
