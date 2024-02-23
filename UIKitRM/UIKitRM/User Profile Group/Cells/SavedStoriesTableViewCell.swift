// SavedStoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Четвертая ячейка профиля пользователя. Содержит: скроллвью с сохраненными историями пользователя.
final class SavedStoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let storyViewsGap: CGFloat = 70
        //    static let
        //    static let
        //    static let
    }

    // MARK: - Visual Components

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

    // MARK: - Public Methods

    func configure(savedStories: [SavedStory]) {
        for (index, story) in savedStories.enumerated() {
            let view = SavedStoryView()
            view.setCoverImage(imageName: story.coverImageName)
            view.setTitle(story.title)
            storiesScrollView.addSubview(view)
            view.centerYAnchor.constraint(equalTo: storiesScrollView.centerYAnchor).isActive = true
            view.widthAnchor.constraint(equalToConstant: 65).isActive = true
            view.heightAnchor.constraint(equalToConstant: 75).isActive = true
            view.leadingAnchor.constraint(
                equalTo: storiesScrollView.leadingAnchor, constant: Constants.storyViewsGap * CGFloat(index)
            ).isActive = true
            if index == savedStories.count - 1 {
                view.trailingAnchor.constraint(equalTo: storiesScrollView.trailingAnchor, constant: -2).isActive = true
            }
        }
    }

    // MARK: - Private Methods

    private func setupCell() {
        contentView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        selectionStyle = .none

        storiesScrollView.contentSize = CGSize(width: 1000, height: 71)
        contentView.addSubview(storiesScrollView)

        storiesScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        storiesScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        storiesScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        storiesScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
