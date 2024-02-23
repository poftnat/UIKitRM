// PostsCollectionTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Пятая ячейка профиля пользователя. Содержит коллекцию постов пользователя.
class PostsCollectionTableViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let collectionCellIdentifier = "SinglePostCollectionViewCell"
        //    static let
        //    static let
        //    static let
    }

    // MARK: - Visual Components

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // MARK: - Private Properties

    private var images: [String] = []

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

    func transferImagesForCollection(images: [String]) {
        self.images = images
    }

    // MARK: - Private Methods

    private func setupCell() {
        setupCollection()
    }

    private func setupCollection() {
        let layout = setupCollectionFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.isScrollEnabled = true

        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)

        contentView.heightAnchor.constraint(equalToConstant: 370).isActive = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

        collectionView.register(
            SinglePostCollectionViewCell.self,
            forCellWithReuseIdentifier: Constants.collectionCellIdentifier
        )
    }

    private func setupCollectionFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        return layout
    }
}

/// Расширение PostsCollectionTableViewCell методами UICollectionViewDataSource
extension PostsCollectionTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.collectionCellIdentifier,
            for: indexPath
        ) as? SinglePostCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(imageName: images[indexPath.item])
        return cell
    }
}

/// Подписание PostsCollectionTableViewCell на UICollectionViewDelegate (без него не работает .didSelectItemAt ())
extension PostsCollectionTableViewCell: UICollectionViewDelegate {}

/// Подписание PostsCollectionTableViewCell на UICollectionViewFlowLayoutDelegate.
extension PostsCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(images[indexPath.item])
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width / 3 - 1
        return CGSize(width: width, height: width)
    }
}
