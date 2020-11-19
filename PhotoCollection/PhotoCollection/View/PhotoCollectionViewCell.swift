//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews() {
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        photoLabel.textColor = .blue
        
    }
}
