// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class ViewController: UIViewController {
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 30)
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 37, width: view.frame.width, height: 82)
        label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupUI() {
        view.b
        view.addSubview(greetingLabel)


    }
}
