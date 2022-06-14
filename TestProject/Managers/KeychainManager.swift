//
//  KeychainManager.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/14/22.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {
    
    static let shared = KeychainManager()
    
    func saveToken(token: String) {
        KeychainWrapper.standard.set(token, forKey: "userToken")
    }
    
    func getToken() -> String {
        return KeychainWrapper.standard.string(forKey: "userToken")!
    }
}
