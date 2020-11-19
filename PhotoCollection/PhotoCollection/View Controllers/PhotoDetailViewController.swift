//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import UIKit

//protocol AddPhotoDelegate {
//    func photoWasAdded(photo: Photo)
//}

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?
    var photoController: PhotoController?
    var themeHelper: ThemeHelper?
//    var delegate: AddPhotoDelegate?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var photoTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
        
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = photoTitleTextField.text,
              let image = imageView.image,
              let data = image.pngData() else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, image: data, title: title)
            
        } else {
            let newPhoto = Photo(imageData: data, title: title)
            photoController?.create(title: newPhoto.title, image: newPhoto.imageData)
            
        }
        navigationController?.popToRootViewController(animated: true)
    }
        
        func setTheme() {
            guard let themePreference = themeHelper?.themePreference else { return }
            
            if themePreference == "Dark" {
                self.view.backgroundColor = UIColor.black
                photoTitleTextField.textColor = .white
            } else {
                self.view.backgroundColor = UIColor.red
            }
        }
        
        func updateViews() {
            setTheme()
            
            guard let photo = photo else { return }
                self.navigationController?.title = photo.title
                imageView.image = UIImage(data: photo.imageData)
                photoTitleTextField.text = photo.title
//                photoTitleTextField.isHidden = true
//                addPhotoButton.isHidden = true
//            }
//            else {
//                self.navigationController?.title = "Create Photo"
//                photoTitleTextField.isHidden = false
//                addPhotoButton.isHidden = false
//            }
        }
    }

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}
