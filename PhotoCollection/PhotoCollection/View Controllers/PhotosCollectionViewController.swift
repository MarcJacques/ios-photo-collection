//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    var indexPath = IndexPath()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
        
        setTheme()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            collectionView.backgroundColor = .black
        } else {
            collectionView.backgroundColor = .red
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectThemeModalSegue" {
            if let themeSelectionVC = segue.destination as? ThemeSelectionViewController {
                themeSelectionVC.themeHelper = themeHelper
            }
//            from + button
            else if segue.identifier == "AddPhotoShowSegue" {
                guard let photoDVC = segue.destination as? PhotoDetailViewController  else { return }
                photoDVC.themeHelper = themeHelper
                photoDVC.photoController = photoController
//                photoDVC.delegate = self
            }
//            from the cell
            else if segue.identifier == "PictureDetailShowSegue" {
                guard let photoDVC = segue.destination as? PhotoDetailViewController,
                      let indexpath = collectionView.indexPathsForSelectedItems?.first else { return }
                
                photoDVC.photo = photoController.photos[indexpath.item]
                photoDVC.themeHelper = themeHelper
                photoDVC.photoController = photoController
                
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {fatalError("Cell is not a PhotoCollectionViewCell") }
        
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//extension PhotosCollectionViewController: AddPhotoDelegate {
//    
//    func photoWasAdded(photo: Photo) {
//        photoController.create(title: photo.title, image: photo.imageData)
//        dismiss(animated: true, completion: nil)
//        collectionView.reloadData()
//    }
//    
//    
//}
