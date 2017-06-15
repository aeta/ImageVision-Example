//
//  ImageViewContentViewController.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/12/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit

public class ImageViewContentViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            self.imageView.image = image
        }
    }
    @IBOutlet weak var overlay: UIVisualEffectView!

    private let image: UIImage

    public init(withImage image: UIImage) {
        self.image = image
        super.init(nibName: "ImageViewerContent", bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
