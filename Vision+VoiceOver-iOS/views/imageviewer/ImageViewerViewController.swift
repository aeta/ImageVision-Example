//
//  ImageViewerViewController.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/11/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit
import ImageVision

public class ImageViewerViewController: PulleyViewController {
    let image: UIImage
    let vision: ImageVision

    var objectResults: [ImageVisionObservationResults] = []
    var faces = 0

    var contentVC: ImageViewContentViewController {
        return self.primaryContentViewController as! ImageViewContentViewController
    }

    var drawerVC: ImageViewerDrawerViewController {
        return self.drawerContentViewController as! ImageViewerDrawerViewController
    }

    public init(fromImage image: UIImage) {
        self.image = image
        self.vision = ImageVision(withImage: image)

        super.init(contentViewController: ImageViewContentViewController(withImage: image), drawerViewController: ImageViewerDrawerViewController())
        drawerVC.dataSource = self

        title = "Results"

        self.vision.delegate = self
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        processImage()
    }

    required public init(contentViewController: UIViewController, drawerViewController: UIViewController) {
        fatalError("init(contentViewController:drawerViewController:) has not been implemented")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func processImage() {
        processObjectResult()
    }

    func processObjectResult() {
        performOn(.background) {
            self.vision.runModel(withMLModels: [VGG16().model])

            performOn(.main) {
                self.processResults()
            }
        }
    }

    func processResults() {
        self.faces = self.vision.findFaces()

        // Find most confident value
        let mostConfidentObject = findMostConfidentValue(inObservationResults: objectResults)!

        // sort!
        objectResults.sort {
            return $0.1 > $1.1
        }

        drawerVC.titleLabel.text = ImageVision.constructVoiceoverString(fromObservationObjectResult: mostConfidentObject, withFaces: faces)
        UIView.animate(withDuration: 0.25, animations: {
            self.contentVC.overlay.alpha = 0.0
        }) { _ in self.contentVC.overlay.isHidden = true }
        
        contentVC.overlay.isHidden = true
        contentVC.imageView.accessibilityLabel = "\(drawerVC.titleLabel.text ?? "I'm not sure what's") in this"
        
        drawerVC.tableView.reloadData()
    }

    fileprivate func findMostConfidentValue(inObservationResults results: [ImageVisionObservationResults]) -> ImageVisionObservationResults? {
        if results.isEmpty { return nil }

        var mostConfidentResult = results[0]
        for result in results {
            if result.1 > mostConfidentResult.1 {
                mostConfidentResult = result
            }
        }
        return mostConfidentResult
    }
}

extension ImageViewerViewController: ImageViewerDrawerTableViewDataSource {
    public func numberOfItems(in tableView: UITableView) -> Int {
        return objectResults.count
    }

    public func item(forIndex indexPath: IndexPath) -> ImageVisionObservationResults {
        return objectResults[indexPath.row]
    }
}

extension ImageViewerViewController: ImageVisionProtocol {
    public func handleNewClassification(_ observationResult: ImageVisionObservationResults) {
        objectResults.append(observationResult)
    }
}
