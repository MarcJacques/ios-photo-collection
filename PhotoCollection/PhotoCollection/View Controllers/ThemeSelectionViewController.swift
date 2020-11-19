//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func darkModeSelected(_ sender: UIButton) {
        themeHelper?.setThemePreferenceDark()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func redModeSelected(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToRed()
        dismiss(animated: true, completion: nil)
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
