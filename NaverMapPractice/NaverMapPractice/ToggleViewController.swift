//
//  ToggleViewController.swift
//  NaverMapPractice
//
//  Created by 정채은 on 2/4/24.
//

import UIKit

import SnapKit
import Then

final class ToggleViewController: UIViewController {
    
    lazy var toggleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: toggleCollectionViewFlowLayout)
    let toggleCollectionViewFlowLayout = UICollectionViewFlowLayout()
    let collectionViewCell = UICollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        toggleCollectionView.do {
            $0.dataSource = self
            $0.delegate = self
            $0.register(ToggleCollectionViewCell.self, forCellWithReuseIdentifier: ToggleCollectionViewCell.identifier)
        }
        
        toggleCollectionViewFlowLayout.do {
            $0.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 100)
        }
        
        self.view.addSubview(toggleCollectionView)
        
        toggleCollectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(50)
        }
    }
}

extension ToggleViewController: UICollectionViewDelegate {}
extension ToggleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToggleCollectionViewCell.identifier, for: indexPath) as? ToggleCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
}
