//
//  AlertMessage.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import SwiftUI

class AlertMessage: Error {
    
    var title = ""
    var body = ""
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
