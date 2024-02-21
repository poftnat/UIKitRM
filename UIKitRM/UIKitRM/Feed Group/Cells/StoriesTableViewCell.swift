// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для историй
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let gap: CGFloat = 70
    }

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private let storiesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        storiesScrollView.contentSize = CGSize(width: 1000, height: 85)
        storiesScrollView.backgroundColor = .lightGray.withAlphaComponent(0.1)
        contentView.addSubview(storiesScrollView)
        storiesScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        storiesScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        storiesScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        storiesScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        selectionStyle = .none
    }

    func configure(stories: [StoriesData]) {
        contentView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        for (index, element) in stories.enumerated() {
            let view = StoryView()
            view.setUserName(userName: element.userName)
            view.setAvatar(imageName: element.avatarImageName)
            if index == 0 {
                view.showAddStoryButton()
            }
            storiesScrollView.addSubview(view)
            view.centerYAnchor.constraint(equalTo: storiesScrollView.centerYAnchor).isActive = true
            view.widthAnchor.constraint(equalToConstant: Constants.gap).isActive = true
            view.heightAnchor.constraint(equalToConstant: 80).isActive = true
            view.leadingAnchor.constraint(
                equalTo: storiesScrollView.leadingAnchor,
                constant: Constants.gap * CGFloat(index)
            )
            .isActive = true
            if index == stories.count - 1 {
                view.trailingAnchor.constraint(equalTo: storiesScrollView.trailingAnchor, constant: -2).isActive = true
            }
        }
    }
}
