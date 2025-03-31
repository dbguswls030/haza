//
//  MainViewController.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/24/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let viewModel: MainViewModel = MainViewModel()
    
    private lazy var harrayPotterView: HarrayPotterView = {
        return HarrayPotterView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        bindViewModel()
        viewModel.loadBooks()
    }
    
    private func configureLayout(){
        view.backgroundColor = .systemBackground
        view.addSubview(harrayPotterView)
        
        harrayPotterView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureSeriesCollectionView(){
        harrayPotterView.seriesCollectionView.delegate = self
        harrayPotterView.seriesCollectionView.dataSource = self
    }
    
    private func setBookTitle(index: Int){
        harrayPotterView.setBookTitle(title: viewModel.getBookTitle(index: index))
    }
    
    private func setBookInfo(index: Int){
        print(viewModel.getSummaryButtonToggleStates(index: index))
        harrayPotterView.setBookInfo(book: viewModel.getBook(index: index), summaryToggleState: viewModel.getSummaryButtonToggleStates(index: index))
        harrayPotterView.setBookThumnail(index: index)
    }
    
    private func bindViewModel(){
        viewModel.successedLoad = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async{
                self.setBookTitle(index: 0)
                self.setBookInfo(index: 0)
                self.configureSeriesCollectionView()
                self.setSummaryToggleButtonAction()
            }
        }
        
        viewModel.jsonParseErrorListenr = { [weak self] error in
            guard let self = self else { return }
            self.showAlert(message: error)
        }
        
        viewModel.tapSummaryToggleButton = { [weak self] in
            guard let self = self else { return }
            self.viewModel.toggleSummaryStates(index: self.viewModel.getSeletedSeriesNumber())
            self.harrayPotterView.toggleSummaryState(isSelected: self.viewModel.getSummaryButtonToggleStates(index: self.viewModel.getSeletedSeriesNumber()))
            self.harrayPotterView.updateSummary(summary: self.viewModel.getSummary(index: self.viewModel.getSeletedSeriesNumber()))
            
        }
    }
    
    private func showAlert(message: String){
        let alertVC = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alertVC, animated: true)
    }
    
    private func setSummaryToggleButtonAction(){
        harrayPotterView.summaryToggleButton.addTarget(self, action: #selector(toggleSummaryToggleButton), for: .touchUpInside)
    }
    
    @objc private func toggleSummaryToggleButton(){
        viewModel.tapSummaryToggleButton?()
    }
}
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setSeriesNumber(number: viewModel.getSeriesNumber(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth: Int = 32
        let totalCellWidth = cellWidth * collectionView.numberOfItems(inSection: section)
        let defaultCellSpacing = 10
        let totalSpacing = (collectionView.numberOfItems(inSection: section) - 1) * defaultCellSpacing
        let horizontalInset = max((collectionView.frame.width - CGFloat(totalCellWidth) - CGFloat(totalSpacing))  / 2, 0) // 음수 방지
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
}
