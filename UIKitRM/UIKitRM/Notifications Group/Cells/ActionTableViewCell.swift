// ActionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для остальных действий
final class ActionTableViewCell: UITableViewCell {
    // MARK: - Types

    // MARK: - Constants

    private enum Constants {
        static let subscribeButtonTitle = "Подписаться"
        static let verdanaFontName = "Verdana"
    }

    // MARK: - IBOutlets

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.profile
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let notificationTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaFontName, size: 10)
        return label
    }()

    private let postPreviewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.profile
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    // MARK: - Public Methods

    func configure(action: Action) {
        userImageView.image = UIImage(named: action.userImageName)
        notificationTextLabel.text = action.userName + " " + action.description + " " + action.time
        postPreviewImageView.image = UIImage(named: action.postPreviewImageName)
    }

    // MARK: - Private Methods

    private func setupCell() {
        addSubview(userImageView)
        addSubview(notificationTextLabel)
        addSubview(postPreviewImageView)
        selectionStyle = .none

        heightAnchor.constraint(equalToConstant: 55).isActive = true
        userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        notificationTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
            .isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        notificationTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        postPreviewImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true
        postPreviewImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        postPreviewImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        postPreviewImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
