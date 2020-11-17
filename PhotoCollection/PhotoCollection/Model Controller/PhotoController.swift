//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(title: String, image: Data) {
        let newPhoto = Photo(imageData: image, title: title)
        
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, image: Data, title: String) {
        
        let updatePhoto = Photo(imageData: image, title: title)
        
        if let index = photos.firstIndex(of: photo) {
            photos.remove(at: index)
            photos.insert(updatePhoto, at: index)
        }
    }
}
