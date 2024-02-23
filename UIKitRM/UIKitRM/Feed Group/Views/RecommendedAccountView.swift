// RecommendedAccountView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Вью для рекомендованных аккаунтов
final class RecommendedAccountView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let subscribeButtonTitle = "Подписаться"
        static let verdanaFontName = "Verdana"
        static let verdanaBoldFontName = "Verdana-Bold"
        static let xmarkImageName = "xmark"
    }

    // MARK: - Visual Components

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.profile
        imageView.layer.cornerRadius = 57
        imageView.clipsToBounds = true
        // TODO: разобраться с тем, что это такое
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaFontName, size: 10)
        label.textAlignment = .center
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

    private let closeRecommendationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.xmarkImageName), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .white
        addSubview(storyImageView)
        addSubview(userNameLabel)
        addSubview(subscribeButton)
        addSubview(closeRecommendationButton)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 3
    }

    private func setupConstraints() {
        storyImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        storyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        storyImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        storyImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true

        closeRecommendationButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        closeRecommendationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        closeRecommendationButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
        closeRecommendationButton.widthAnchor.constraint(equalToConstant: 7).isActive = true

        userNameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 10).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        subscribeButton.centerXAnchor.constraint(equalTo: storyImageView.centerXAnchor).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
