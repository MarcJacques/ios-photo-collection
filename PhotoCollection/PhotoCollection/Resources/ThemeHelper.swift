//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Marc Jacques on 11/17/20.
//

import Foundation

class ThemeHelper {
    
    let themePreferenceKey: String = ""
    
    let userDefaults = UserDefaults.standard
    
    var themePreference: String? {
        return userDefaults.string(forKey: ThemeHelper.themePreferenceKey)
     }
    
    
    init() {
        if themePreference == nil {
            setThemePreferenceDark()
        }
    }
    
    
    func setThemePreferenceDark() {

        userDefaults.set("Dark", forKey: ThemeHelper.themePreferenceKey)
    }
    
    func setThemePreferenceToRed() {
       
        
        userDefaults.set("Red", forKey: ThemeHelper.themePreferenceKey)
    }
    
   
}
extension String {
    static var dark = "Dark"
    static var red = "Red"
}
