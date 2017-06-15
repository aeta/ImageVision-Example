//
//  ImageSelectorViewController+DocumentPicker.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/11/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit

extension ImageSelectorViewController: UIDocumentPickerDelegate {
    @IBAction func documentSelectorButtonDidPress(_ sender: UIButton) {
        let menu = UIDocumentPickerViewController(documentTypes: ["public.png", "public.jpeg", "public.tiff"], in: .open)
        menu.delegate = self
        self.present(menu, animated: true, completion: nil)
    }

    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        print(urls)
        if urls[0].startAccessingSecurityScopedResource() {
            if let url = urls.first,
                let image = UIImage(data: try! Data(contentsOf: url)) {
                processImage(image)
            }
        } else {
            let alert = UIAlertController(title: "Sandbox", message: "You cannot view this image because this file is outside of your App Sandbox", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            controller.dismiss(animated: true, completion: nil)
            present(alert, animated: true, completion: nil)
        }
        urls[0].stopAccessingSecurityScopedResource()
        controller.dismiss(animated: true, completion: nil)
    }

    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

