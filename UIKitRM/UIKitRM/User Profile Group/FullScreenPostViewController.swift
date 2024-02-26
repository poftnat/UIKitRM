// FullScreenPostViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран представления поста из коллекции по тапу по ячейке
final class FullScreenPostViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let defaultImageName = "cosmo1"
    }

    // MARK: - Visual Components

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    func setFullScreenImage(image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(imageView)
        setImageViewConstraints()
    }

    private func setImageViewConstraints() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
}
