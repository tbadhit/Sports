//
//  UIActivityIndicatorView+Ext.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 26/08/22.
//

import UIKit

extension UIActivityIndicatorView {
    func setLoadingScreen(parentView: UIView) {
        self.style = UIActivityIndicatorView.Style.medium
        self.startAnimating()
        self.style = .large
        self.center = parentView.center
        
        parentView.addSubview(self)
        
    }
    
    func removeLoadingScreen() {
        self.stopAnimating()
        self.isHidden = true
    }
}
