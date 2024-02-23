// ProfileButtonsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Третья ячейка профиля пользователя. Содержит: кнопки "Изменить профиль", "Поделиться профилем", "Показать
/// рекомендованных пользователей".
final class ProfileButtonsTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let editProfileButtonText = "Изменить"
        static let shareProfileButtonText = "Поделиться профилем"
        static let verdanaBoldFontName = "Verdana-Bold"

        //    static let
        //    static let
        //    static let
    }

    // MARK: - Visual Components

    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.buttonLightGray.cgColor
        button.layer.cornerRadius = 8
        button.setTitle(Constants.editProfileButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.buttonLightGray.cgColor
        button.layer.cornerRadius = 8
        button.setTitle(Constants.shareProfileButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let showRecomendationsButton: UIButton = {
        let button = UIButton()
        button.layer.backgroundColor = UIColor.buttonLightGray.cgColor
        button.layer.cornerRadius = 8
        button.setImage(UIImage.showAccounts, for: .normal)
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

    // MARK: - Private Methods

    private func setupCell() {
        addSubview(editProfileButton)
        addSubview(shareProfileButton)
        addSubview(showRecomendationsButton)
        selectionStyle = .none

        contentView.heightAnchor.constraint(equalToConstant: 42).isActive = true

        editProfileButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        editProfileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        editProfileButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 153).isActive = true
        editProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        shareProfileButton.centerYAnchor.constraint(equalTo: editProfileButton.centerYAnchor).isActive = true
        shareProfileButton.leadingAnchor.constraint(equalTo: editProfileButton.trailingAnchor, constant: 4)
            .isActive = true
        shareProfileButton.widthAnchor.constraint(equalTo: editProfileButton.widthAnchor, multiplier: 1)
            .isActive = true
        shareProfileButton.heightAnchor.constraint(equalTo: editProfileButton.heightAnchor).isActive = true

        showRecomendationsButton.centerYAnchor.constraint(equalTo: editProfileButton.centerYAnchor).isActive = true
        showRecomendationsButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 4)
            .isActive = true
        showRecomendationsButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        showRecomendationsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        showRecomendationsButton.heightAnchor.constraint(equalTo: editProfileButton.heightAnchor).isActive = true
    }
}
