// SubscriptionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для уведомлений о возможных подписчиках
final class SubscriptionTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let subscribeButtonTitle = "Подписаться"
        static let verdanaFontName = "Verdana"
        static let verdanaBoldFontName = "Verdana-Bold"
    }

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

    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .buttonBlue
        button.setTitle(Constants.subscribeButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

    func configure(action: Subscription) {
        userImageView.image = UIImage(named: action.userImageName)
        notificationTextLabel.text = action.userName + " " + action.description
    }

    // MARK: - Private Methods

    private func setupCell() {
        addSubview(userImageView)
        addSubview(notificationTextLabel)
        addSubview(subscribeButton)
        selectionStyle = .none

        heightAnchor.constraint(equalToConstant: 55).isActive = true
        userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        notificationTextLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10)
            .isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        notificationTextLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true

        subscribeButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
