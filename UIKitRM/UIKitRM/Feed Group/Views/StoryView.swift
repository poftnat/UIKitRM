// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка для историй
final class StoryView: UIView {
    // MARK: - Constants

    enum Constants {
        static let verdanaFontName = "Verdana"
    }

    // MARK: - Visual Components

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.profile
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        // TODO: разобраться с тем, что это такое
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let addStoryButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 47, width: 15, height: 15))
        button.backgroundColor = .raspberry
        button.layer.cornerRadius = 7
        button.setImage(
            UIImage(systemName: "plus"),
            for: .normal
        )
        button.tintColor = .white
        button.isHidden = true
        return button
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaFontName, size: 8)
        label.textAlignment = .center
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Public Methods

    func setUserName(userName: String) {
        userNameLabel.text = userName
    }

    func setAvatar(imageName: String) {
        storyImageView.image = UIImage(named: imageName)
    }

    func showAddStoryButton() {
        addStoryButton.isHidden = false
    }

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .white
        addSubview(storyImageView)
        addSubview(userNameLabel)
        addSubview(addStoryButton)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    private func setupConstraints() {
        storyImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        storyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        storyImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        storyImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true

        userNameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 3).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
}
