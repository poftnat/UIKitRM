// RecommendationsTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендациями
final class RecommendationsTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let recomendationTitleLabelText = "Рекомендуем вам"
        static let verdanaBoldFontName = "Verdana-Bold"
        static let allRecommendationsButtonText = "Все"
        static let width: CGFloat = 175
        static let gap: CGFloat = 20
    }

    // MARK: - Visual Components

    private let storiesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recomendationTitleLabelText
        label.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let allRecommendationsButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.allRecommendationsButtonText, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.buttonBlue, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.contentHorizontalAlignment = .trailing
        return button
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

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
        storiesScrollView.contentSize = CGSize(width: 1000, height: 270)
        storiesScrollView.backgroundColor = .skyBlue
        contentView.addSubview(storiesScrollView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(allRecommendationsButton)

        storiesScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        storiesScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        storiesScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        storiesScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        allRecommendationsButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        allRecommendationsButton.trailingAnchor.constraint(equalTo: storiesScrollView.trailingAnchor, constant: -10)
            .isActive = true
        allRecommendationsButton.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allRecommendationsButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }

    func configure(stories: [StoriesData]) {
        contentView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        for (index, element) in stories.enumerated() {
            let view = RecommendedAccountView()
            view.setUserName(userName: element.userName)
            view.setAvatar(imageName: element.avatarImageName)
            storiesScrollView.addSubview(view)
            view.centerYAnchor.constraint(equalTo: storiesScrollView.centerYAnchor, constant: 4).isActive = true
            view.widthAnchor.constraint(equalToConstant: 185).isActive = true
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            view.leadingAnchor.constraint(
                equalTo: storiesScrollView.leadingAnchor,
                constant: Constants.gap + (Constants.width + Constants.gap * 2) * CGFloat(index)
            )
            .isActive = true
            if index == stories.count - 1 {
                view.trailingAnchor.constraint(equalTo: storiesScrollView.trailingAnchor, constant: -4).isActive = true
            }
        }
    }
}
