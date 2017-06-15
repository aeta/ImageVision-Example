//
//  ImageViewerDrawerViewController.swift
//  Vision+VoiceOver
//
//  Created by Alan Chu on 6/12/17.
//  Copyright © 2017 Alan Chu. All rights reserved.
//

import UIKit
import ImageVision

public protocol ImageViewerDrawerTableViewDataSource: class {
    func numberOfItems(in tableView: UITableView) -> Int
    func item(forIndex indexPath: IndexPath) -> ImageVisionObservationResults
}

fileprivate let ImageViewerDrawerTableViewCellIdentifier = "ImageViewerDrawerTableViewCellIdentifier"
public class ImageViewerDrawerViewController: UIViewController, UITableViewDataSource {
    public var dataSource: ImageViewerDrawerTableViewDataSource?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var titleLabel: UILabel!

    public init() {
        super.init(nibName: "ImageViewerDrawer", bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = dataSource else { fatalError("Must set data source") }
        return dataSource.numberOfItems(in: tableView)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = dataSource else { fatalError("Must set data source") }
        let item = dataSource.item(forIndex: indexPath)

        let cell = UITableViewCell(style: .value2, reuseIdentifier: nil)
        cell.textLabel?.text = "\(item.1)"
        cell.detailTextLabel?.text = item.0

        return cell
    }
}
