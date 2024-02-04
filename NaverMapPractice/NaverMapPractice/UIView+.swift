//
//  UIView+.swift
//  NaverMapPractice
//
//  Created by 정채은 on 2/4/24.
//

import UIKit

extension UIView {
    func showToast(message: String, at: CGFloat = 25) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = .systemGray
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        
        let toastWidth = UIScreen.main.bounds.width - 40
        let toastHeight = 40
        toastLabel.frame = CGRect(x: self.frame.size.width / 2 - toastWidth / 2,
                                  y: self.frame.size.height - CGFloat(toastHeight) - at,
                                  width: toastWidth,
                                  height: CGFloat(toastHeight))
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(toastLabel)
        }
        
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
