//
//  PictureCollectionViewCell.swift
//  Authentication
//
//  Created by Ethan Scott on 4/22/21.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var picture: VerifyImage? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let picture = picture else {return}
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.image = picture.image
    }
}
