//
//  SeriesCollectionViewCell.swift
//  HarryPotterBook
//
//  Created by 유현진 on 3/25/25.
//

import UIKit
import SnapKit

final class SeriesCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SeriesCollectionViewCell"
        
    private lazy var seriesNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        backgroundColor = .systemBlue
        clipsToBounds = true
        layer.cornerRadius = 16
        
        addSubview(seriesNumberLabel)
        
        seriesNumberLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setSeriesNumber(number: Int){
        DispatchQueue.main.async{ [weak self] in
            self?.seriesNumberLabel.text = "\(number)"
        }
    }
}
