//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews() {
        if let photo = photo {
            self.navigationController?.title = photo.title
        } else {
            self.navigationController?.title = "Create Photo"
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
