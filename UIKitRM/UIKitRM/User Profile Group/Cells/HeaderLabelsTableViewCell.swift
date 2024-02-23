// HeaderLabelsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Верхняя ячейка профиля пользователя. Содержит: аватар, лейблы количества публикаций, подписчиков, подписок.
final class HeaderLabelsTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let labelsText = ["публикации", "подписчики", "подписки"]
        static let verdanaBoldFontName = "Verdana-Bold"
        static let verdanaFontName = "Verdana"
        static let gap: CGFloat = 80
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: UserInfo.shared.imageName)
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let addStoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .raspberry
        button.layer.cornerRadius = 13
        button.setImage(
            UIImage(systemName: "plus"),
            for: .normal
        )
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let labelsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
        configure()
    }

    // MARK: - Private Methods

    private func setupCell() {
        selectionStyle = .none
        contentView.heightAnchor.constraint(equalToConstant: 90).isActive = true

        addSubview(avatarImageView)
        addSubview(addStoryButton)
        addSubview(labelsView)

        setAvatarImageViewConstraints()
        setAddStoryButtonConstraints()
        setLabelsViewConstraints()
    }

    private func configure() {
        avatarImageView.image = UIImage(named: UserInfo.shared.imageName)

        let userStats = [UserInfo.shared.postsCount, UserInfo.shared.followsCount, UserInfo.shared.followersCount]

        for (index, item) in userStats.enumerated() {
            let numberLabel: UILabel = {
                let label = UILabel()
                label.text = "\(item)"
                label.font = UIFont(name: Constants.verdanaBoldFontName, size: 14)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()

            let titleLabel: UILabel = {
                let label = UILabel()
                label.text = "\(Constants.labelsText[index])"
                label.font = UIFont(name: Constants.verdanaFontName, size: 10)
                label.textAlignment = .center
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()
            labelsView.addSubview(numberLabel)
            labelsView.addSubview(titleLabel)

            numberLabel.topAnchor.constraint(equalTo: labelsView.topAnchor).isActive = true
            numberLabel.leadingAnchor.constraint(
                equalTo: labelsView.leadingAnchor,
                constant: Constants.gap * CGFloat(index)
            ).isActive = true
            numberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
            numberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

            titleLabel.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 22).isActive = true
            titleLabel.centerXAnchor.constraint(
                equalTo: numberLabel.centerXAnchor
            ).isActive = true
            titleLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
            titleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        }
    }

    private func setAvatarImageViewConstraints() {
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setLabelsViewConstraints() {
        labelsView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        labelsView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 45).isActive = true
        labelsView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        labelsView.heightAnchor.constraint(equalToConstant: 31).isActive = true
    }

    private func setAddStoryButtonConstraints() {
        addStoryButton.centerXAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: -8).isActive = true
        addStoryButton.centerYAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -8).isActive = true
        addStoryButton.widthAnchor.constraint(equalToConstant: 27).isActive = true
        addStoryButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
}
