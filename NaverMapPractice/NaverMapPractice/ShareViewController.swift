//
//  ShareViewController.swift
//  NaverMapPractice
//
//  Created by 정채은 on 2/4/24.
//

import UIKit

import SnapKit
import Then

final class ShareViewController: UIViewController {
    
    let copyLabel = UILabel()
    let copyButton = UIButton()
    let shareButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        copyLabel.do {
            $0.text = "chaentopia"
            $0.textColor = .black
        }
        
        copyButton.do {
            $0.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
            $0.tintColor = .black
            $0.addTarget(self, action: #selector(copyButtonTapped), for: .touchUpInside)
        }
        
        shareButton.do {
            $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
            $0.tintColor = .black
            $0.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        }
        
        self.view.addSubview(copyLabel)
        self.view.addSubview(copyButton)
        self.view.addSubview(shareButton)
        
        copyLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        copyButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(copyLabel.snp.bottom).offset(20)
            $0.size.equalTo(20)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(copyButton.snp.bottom).offset(20)
            $0.size.equalTo(20)
        }
    }
    
    @objc func copyButtonTapped() {
        UIPasteboard.general.string = copyLabel.text
        view.showToast(message: "아이디가 복사되었습니다", at: 50)
    }
    
    @objc func shareButtonTapped() {
        
    }
}
