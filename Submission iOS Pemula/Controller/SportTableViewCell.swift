//
//  SportTableViewCell.swift
//  Submission iOS Pemula
//
//  Created by Tubagus Adhitya Permana on 14/08/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSport: UIImageView!
    @IBOutlet weak var titleSport: UILabel!
    @IBOutlet weak var descriptionSport: UILabel!
    
    private var urlString: String = ""
    
    func setCellWithValueOf(_ sport: Sport) {
        updateUI(title: sport.title, thumbnail: sport.thumbnail, description: sport.description)
    }
    
    private func updateUI(title: String?, thumbnail: String?, description: String?) {
        self.titleSport.text = title
        self.descriptionSport.text = description
        
        guard let thumbnailString = thumbnail else {return}
        urlString = thumbnailString
        
        guard let thumbnailImgURL = URL(string: urlString) else {
            return
        }
        
        self.imageSport.image = UIImage(named: "noImage")
        self.imageSport.layer.cornerRadius = imageSport.frame.height / 2
        self.imageSport.clipsToBounds = true
        self.imageSport.load(url: thumbnailImgURL) {}
    }
    
}
