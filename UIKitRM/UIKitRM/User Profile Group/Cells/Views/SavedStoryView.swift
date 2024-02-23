// SavedStoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SavedStoryView: UIView {
    // MARK: - Constants

    enum Constants {
        static let verdanaFontName = "Verdana"
    }

    // MARK: - Visual Components

    private let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.profile
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaFontName, size: 10)
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

    func setTitle(_ title: String) {
        titleLabel.text = title
    }

    func setCoverImage(imageName: String) {
        coverImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private Methods

    private func setupView() {
        backgroundColor = .white
        addSubview(coverImageView)
        addSubview(titleLabel)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    private func setupConstraints() {
        coverImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        coverImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        coverImageView.heightAnchor.constraint(equalToConstant: 49).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 49).isActive = true

        titleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 3).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}
