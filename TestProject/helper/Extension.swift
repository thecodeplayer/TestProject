//
//  Extension.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/10/22.
//

import Foundation

extension String {
    func isValidEmailAddress() -> Bool {
        let regex = try? NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                                             options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
    }

    func isValidPassword() -> Bool {
        return self.count >= 8
    }

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
