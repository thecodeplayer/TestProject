//
//  UIViewController+Extensions.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/15/22.
//

import Foundation
import MBProgressHUD

func shouldHideLoader(isHidden: Bool, vc: UIView) {
    if isHidden {
        MBProgressHUD.hide(for: vc, animated: true)
    } else {
        MBProgressHUD.showAdded(to: vc, animated: true)
    }
}
