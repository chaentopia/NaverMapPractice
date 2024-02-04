//
//  ToggleCollectionViewCell.swift
//  NaverMapPractice
//
//  Created by 정채은 on 2/4/24.
//

import UIKit

import SnapKit
import Then

final class ToggleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ToggleCollectionViewCell"
    let titleLabel = UILabel()
    let expandButton = UIButton()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        titleLabel.do {
            $0.text = "저를 펼쳐보세요.."
            $0.textColor = .black
            $0.font = .boldSystemFont(ofSize: 20)
        }
        
        expandButton.do {
            $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
            $0.tintColor = .black
        }

        descriptionLabel.do {
            $0.text = "하이염"
            $0.font = .systemFont(ofSize: 15)
            $0.textColor = .systemPink
        }
        
        self.addSubview(titleLabel)
        self.addSubview(expandButton)
        self.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        
        expandButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalTo(titleLabel)
            $0.size.equalTo(15)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(10)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
