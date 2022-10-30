//
//  DetailViewController.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 19/08/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var sportThumbnail: UIImageView!
    @IBOutlet weak var sportFormat: UILabel!
    @IBOutlet weak var sportDescription: UILabel!
    var sport: Sport?
    
    private var spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.setLoadingScreen(parentView: sportThumbnail)
        
        if let result = sport {
            navigationItem.title = result.title
            sportThumbnail.image = UIImage(named: "noImage")
            guard let url = URL(string: result.thumbnail) else {
                return
            }
            sportThumbnail.load(url: url) { [weak self] in
                self?.spinner.removeLoadingScreen()
            }
            if sportThumbnail.image == UIImage(named: "noImage") {
                self.spinner.removeLoadingScreen()
            }
            sportFormat.text = result.format
            sportDescription.text = result.description
        }
    }
    
}
