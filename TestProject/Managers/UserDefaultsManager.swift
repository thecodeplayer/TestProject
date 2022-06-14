//
//  KeychainManager.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/14/22.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults(suiteName: "com.testproject.saved.data")!
    
    func saveEmail(email: String?) {
        defaults.set(email, forKey: "userEmail")
    }
    
    func getEmail() -> String {
        guard let value = defaults.value(forKey: "userEmail") as? String else {
            return "No email saved"
        }
        return value
    }
}
