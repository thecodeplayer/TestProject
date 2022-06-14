//
//  CameraGalleryPhotoManager.swift
//  TestProject
//
//  Created by propelrr-mac-pro on 6/14/22.
//

import Foundation
import UIKit

class CameraGalleryPhotoManager: NSObject {
    static let shared = CameraGalleryPhotoManager()
    fileprivate var currentVC : UIViewController!
    var imagePickerBlock: ((UIImage) -> Void)?
    
    //Opens Camera
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            pickerController.allowsEditing = true
            currentVC.present(pickerController, animated: true, completion: nil)
        }
    }
    
    //Opens Gallery
    private func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            currentVC.present(pickerController, animated: true, completion: nil)
        }
    }
    
    //Opens Action Sheet
    func showActionSheet(vc: UIViewController) {
        currentVC = vc
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
            self?.openCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { [weak self] _ in
            self?.openGallery()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
}

extension CameraGalleryPhotoManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imagePickerBlock?(image)
        }
        
        currentVC.dismiss(animated: true, completion: nil)
    }
}
