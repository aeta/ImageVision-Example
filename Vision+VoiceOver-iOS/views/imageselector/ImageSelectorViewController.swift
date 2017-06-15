//
//  ImageSelectorViewController.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/11/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit

public class ImageSelectorViewController: UIViewController, UINavigationControllerDelegate {
    var dropInteraction: UIDropInteraction!

    public func processImage(_ image: UIImage) {
        let vc = ImageViewerViewController(fromImage: image)
        if let nc = navigationController {
            nc.pushViewController(vc, animated: true)
        } else {
            vc.present(vc, animated: true, completion: nil)
        }
    }
}

