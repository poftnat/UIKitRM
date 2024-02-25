// StoryboardsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class StoryboardsViewController: UIViewController {
    @IBOutlet var greenView: UIView!

    @IBOutlet var yellowView: UIView!
    @IBOutlet var redView: UIView!

    override func viewDidLayoutSubviews() {
        redView.layer.cornerRadius = greenView.frame.size.height / 2
        yellowView.layer.cornerRadius = greenView.frame.size.height / 2
        greenView.layer.cornerRadius = greenView.frame.size.height / 2
    }
}
