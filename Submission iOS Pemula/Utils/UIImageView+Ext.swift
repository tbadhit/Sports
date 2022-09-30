//
//  UIImageView+Ext.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 20/08/22.
//

import UIKit

extension UIImageView {
    func load(url: URL, completion: @escaping () -> ()) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion()
                    }
                }
            }
        }
    }
}
