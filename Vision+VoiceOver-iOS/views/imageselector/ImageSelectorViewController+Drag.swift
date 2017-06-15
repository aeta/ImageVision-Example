//
//  ImageSelectorViewController+Drag.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/11/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit

extension ImageSelectorViewController: UIDropInteractionDelegate {
    override public func viewDidLoad() {
        super.viewDidLoad()
        dropInteraction = UIDropInteraction(delegate: self)
        view.addInteraction(dropInteraction)
    }

    public func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: UIImage.self)
    }

    public func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }

    public func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: UIImage.self) { imageItems in
            let images = imageItems as! [UIImage]
            guard let image = images.first else { return }
            self.processImage(image)
        }
    }
}
