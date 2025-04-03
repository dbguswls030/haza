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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // layout 변경 시(디바이스 회전) collectionView layout 업데이트
        self.harrayPotterView.seriesCollectionView.collectionViewLayout.invalidateLayout()
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
        harrayPotterView.setBookInfo(book: viewModel.getBook(index: index), summaryToggleState: viewModel.getSummaryButtonToggleStates(index: index))
        harrayPotterView.setBookThumnail(index: index)
    }
    
    private func bindViewModel(){
        viewModel.successedLoad = { [weak self] in
            guard let self = self else { return }
            self.setBookTitle(index: 0)
            self.setBookInfo(index: 0)
            self.configureSeriesCollectionView()
            self.setSummaryToggleButtonAction()
        }
        
        viewModel.jsonParseErrorListenr = { [weak self] error in
            guard let self = self else { return }
            self.showAlert(message: error)
        }
        
        viewModel.tapSummaryToggleButton = { [weak self] in
            guard let self = self else { return }
            // 1. 현재 시리즈의 더보기 toggle 상태 변경
            self.viewModel.toggleSummaryStates(index: self.viewModel.getSeletedSeriesNumber())
            // 2. 변경된 toggle 상태를 button.isSelected에 반영
            self.harrayPotterView.toggleSummaryState(isSelected: self.viewModel.getSummaryButtonToggleStates(index: self.viewModel.getSeletedSeriesNumber()))
            // 3. 버튼 isSelected 상태에 따른 text로 업데이트
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
        return viewModel.getNumberOfSeries()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as? SeriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        if indexPath.item == 0 { collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init()) } // 1번 시리즈 선택된 상태로 초기화
        cell.setSeriesNumber(number: viewModel.getSeriesNumber(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let cellWidth: Int = 32
        let totalCellWidth = cellWidth * collectionView.numberOfItems(inSection: section)
        let defaultCellSpacing = 10
        let totalSpacing = (collectionView.numberOfItems(inSection: section) - 1) * defaultCellSpacing
        
        let horizontalInset = (collectionView.frame.width - (CGFloat(totalCellWidth) + CGFloat(totalSpacing))) / 2 // 음수 방지
        return UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 시리즈 숫자 클릭 시 UI 업데이트
        viewModel.setSelectedSeriesNumber(number: indexPath.item)
        setBookTitle(index: indexPath.item)
        setBookInfo(index: indexPath.item)
    }
}
