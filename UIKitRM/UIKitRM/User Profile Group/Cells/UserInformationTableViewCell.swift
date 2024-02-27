// UserInformationTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вторая ячейка профиля пользователя. Содержит: полное имя пользователя, описание, ссылка???.
final class UserInformationTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let verdanaBoldFontName = "Verdana-Bold"
        static let verdanaFontName = "Verdana"
        static let gap: CGFloat = 80
        static let linkText = "🔗 www.spacex.com"
    }

    // MARK: - Visual Components

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = UserInfo.shared.fullName
        label.font = UIFont(name: Constants.verdanaBoldFontName, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = UserInfo.shared.profileDescription
        label.font = UIFont(name: Constants.verdanaFontName, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var linkButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.linkText, for: .normal)
        button.setTitleColor(.buttonBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: Constants.verdanaFontName, size: 14)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .leading
        button.contentVerticalAlignment = .top
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    var linkButtonHandler: (() -> ())?

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    // MARK: - Private Methods

    private func setupCell() {
        selectionStyle = .none
        contentView.heightAnchor.constraint(equalToConstant: 74).isActive = true

        addSubview(nameLabel)
        addSubview(descriptionLabel)
        contentView.addSubview(linkButton)

        setNameLabelConstraints()
        setDescriptionLabelConstraints()
        setLinkButtonConstraints()
    }

    private func setNameLabelConstraints() {
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setDescriptionLabelConstraints() {
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setLinkButtonConstraints() {
        linkButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 2).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        linkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        linkButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    @objc private func openLink() {
        linkButtonHandler?()
    }
}
