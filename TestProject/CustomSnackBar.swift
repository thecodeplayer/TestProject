//
//  CustomSnackBar.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/14/22.
//

import Foundation
import TTGSnackbar
import UIKit

class CustomSnackBar {
    
    static let shared = CustomSnackBar()
    
    func showAlert(for alert: String) {
        let snackbar = TTGSnackbar(message: alert, duration: .long)
        snackbar.show()
    }
}
