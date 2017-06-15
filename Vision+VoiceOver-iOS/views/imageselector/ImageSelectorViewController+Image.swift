//
//  ImageSelectorViewController+Image.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/11/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit

extension ImageSelectorViewController: UIImagePickerControllerDelegate {
    @IBAction func imageGalleryButtonDidPress(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func imageCameraButtonDidPress(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            processImage(image)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
