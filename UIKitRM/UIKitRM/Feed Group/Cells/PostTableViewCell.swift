// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для постов пользователей
final class PostTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let optionsImage = UIImage.dotsAllFull
        static let likeImage = UIImage.like
        static let commentImage = UIImage.messageCircle
        static let directMessageImage = UIImage.directMessage
        static let bookmarkImage = UIImage.mark
        static let commentPlaceholder = "Комментировать..."
        static let likedLabelText = "Нравится: "
        static let padding: CGFloat = 350

        static let verdanaFontName = "Verdana"
        static let verdanaBoldFontName = "Verdana-Bold"
    }

    // MARK: - Visual Components

    private let userAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBoldFontName, size: 12)
        return label
    }()

    private let moreOptionsButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.optionsImage, for: .normal)
        return button
    }()

    private let scrollView = UIScrollView()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.hidesForSinglePage = true
        return pageControl
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.likeImage, for: .normal)
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.commentImage, for: .normal)
        return button
    }()

    private let messageButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.directMessageImage, for: .normal)
        return button
    }()

    private let addBookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.bookmarkImage, for: .normal)
        return button
    }()

    private let likesAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBoldFontName, size: 10)
        return label
    }()

    private let userPostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaFontName, size: 10)
        label.numberOfLines = 3
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private let mainUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.commentPlaceholder
        textField.font = UIFont(name: Constants.verdanaFontName, size: 10)
        return textField
    }()

    private let publicationTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaFontName, size: 10)
        label.textColor = .lightGray
        return label
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

    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in scrollView.subviews {
            subview.removeFromSuperview()
        }
    }

    func configure(data: UserPostsData) {
        pageControl.numberOfPages = data.contentImageName.count
        userAvatarImageView.image = UIImage(named: data.avatarImageName)
        userNameLabel.text = data.userName
        userPostLabel.setBoldAndRegularText(boldText: data.userName, regularText: data.postText)
        mainUserImageView.image = UIImage(named: UserInfo.shared.imageName)
        publicationTimeLabel.text = data.publishingTime
        likesAmountLabel.text = Constants.likedLabelText + String(data.liked)
        for (index, image) in data.contentImageName.enumerated() {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: image)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            scrollView.isScrollEnabled = data.contentImageName.count != 1
            imageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            imageView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor,
                constant: CGFloat(index) * Constants.padding
            ).isActive = true
            if index == data.contentImageName.count - 1 {
                imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
            }
        }
    }

    // MARK: - Private Methods

    private func setupCell() {
        addSubviewsWithoutAutoResizingMask(
            userAvatarImageView,
            userNameLabel,
            moreOptionsButton,
            likeButton,
            commentButton,
            messageButton,
            addBookmarkButton,
            likesAmountLabel,
            userPostLabel,
            mainUserImageView,
            commentTextField,
            publicationTimeLabel
        )
        selectionStyle = .none
        setupImageScroll()
        setupConstraints()
    }

    private func setupImageScroll() {
        contentView.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pageControl)
        scrollView.delegate = self
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }

    private func setupConstraints() {
        contentView.heightAnchor.constraint(equalToConstant: 440).isActive = true
        userAvatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userAvatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userAvatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        userAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true

        userNameLabel.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: 8)
            .isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        moreOptionsButton.centerYAnchor.constraint(equalTo: userAvatarImageView.centerYAnchor).isActive = true
        moreOptionsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9).isActive = true
        moreOptionsButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        moreOptionsButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        scrollView.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: 10).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true

        pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 4).isActive = true

        likeButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 12).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 15.97).isActive = true

        commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 6).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        messageButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        messageButton.leadingAnchor.constraint(equalTo: commentButton.trailingAnchor, constant: 6).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: 16.79).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 16.79).isActive = true

        addBookmarkButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        addBookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        addBookmarkButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        addBookmarkButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        likesAmountLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 8).isActive = true
        likesAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        likesAmountLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesAmountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        userPostLabel.topAnchor.constraint(equalTo: likesAmountLabel.bottomAnchor, constant: 4).isActive = true
        userPostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        userPostLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        userPostLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true

        mainUserImageView.topAnchor.constraint(equalTo: userPostLabel.bottomAnchor, constant: 8).isActive = true
        mainUserImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        mainUserImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        mainUserImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentTextField.centerYAnchor.constraint(equalTo: mainUserImageView.centerYAnchor).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: mainUserImageView.trailingAnchor, constant: 8)
            .isActive = true
        commentTextField.heightAnchor.constraint(equalToConstant: 17).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 120).isActive = true

        publicationTimeLabel.topAnchor.constraint(equalTo: mainUserImageView.bottomAnchor, constant: 4).isActive = true
        publicationTimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        publicationTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        publicationTimeLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        publicationTimeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
    }

    @objc private func pageControlTapped() {
        let offsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

/// Реализация методов делегата скролл вью в ячейке
extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x - 50 / UIScreen.main.bounds.width)
    }
}
