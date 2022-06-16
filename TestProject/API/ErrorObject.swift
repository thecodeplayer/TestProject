//
//  AlertMessage.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import SwiftUI

struct ErrorObject: Error, Decodable {
    
    var error: String
    
    enum CodingKeys: String, CodingKey {
        case error = "error"
    }
    
}
