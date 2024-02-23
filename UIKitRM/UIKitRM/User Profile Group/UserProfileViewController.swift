// UserProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер профиля пользователя
final class UserProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let leftBarButtonImage = UIImage.blocked
        static let leftBarButtonTitle = "Account_Name"
        static let verdanaBoldFontName = "Verdana-Bold"
        static let verdanaFontName = "Verdana"
        static let plusBarButtonImage = UIImage.plus
        static let menuBarButtonImage = UIImage.menu
        static let headerLabelsCellItentifier = "HeaderLabelsTableViewCell"
        static let userInfoCellItentifier = "UserInformationTableViewCell"
        static let profileButtonsCellIdentifier = "ProfileButtonsTableViewCell"
        static let savedStoriesCellIdentifier = "SavedStoriesTableViewCell"
        static let collectionCellIdentifier = "PostsCollectionTableViewCell"
        static let sections: [ProfileSections] = [.header, .description, .buttons, .stories, .postsCollection]
    }

    // MARK: - Visual Components

    private let leftBarButtonItem: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(Constants.leftBarButtonImage, for: .normal)
        button.configuration = .plain()
        button.configuration?.imagePadding = 10
        let attributedString = NSAttributedString(string: Constants.leftBarButtonTitle, attributes: [
            NSAttributedString.Key.font: UIFont(name: Constants.verdanaBoldFontName, size: 16) ?? UIFont
                .systemFont(ofSize: 18)
        ])
        button.setAttributedTitle(attributedString, for: .normal)
        let item = UIBarButtonItem(customView: button)
        return item
    }()

    private let plusBarButtonItem: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(Constants.plusBarButtonImage, for: .normal)
        let item = UIBarButtonItem(customView: button)
        return item
    }()

    private let menuBarButtonItem: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(Constants.menuBarButtonImage, for: .normal)
        let item = UIBarButtonItem(customView: button)
        return item
    }()

    private let tableView = UITableView()

    // MARK: - Private Properties

    private let images = [
        "cosmo1",
        "cosmo2",
        "cosmo3",
        "cosmo4",
        "cosmo1",
        "cosmo1",
        "cosmo2",
        "cosmo3",
        "cosmo4",
        "cosmo1",
        "cosmo1",
        "cosmo2",
        "cosmo3",
        "cosmo4",
        "cosmo1",
        "cosmo2",
        "cosmo3",
        "cosmo4"
    ]

    private let savedStories: [SavedStory] = [
        SavedStory(title: "Запуск", coverImageName: "cosmo1"),
        SavedStory(title: "Луна", coverImageName: "cosmo2"),
        SavedStory(title: "Космонавт", coverImageName: "cosmo1"),
        SavedStory(title: "Космос", coverImageName: "cosmo4"),
        SavedStory(title: "Voyagers", coverImageName: "cosmo1"),
        SavedStory(title: "Венера", coverImageName: "cosmo2")
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = [menuBarButtonItem, plusBarButtonItem]
        view.addSubview(tableView)
        setupTableView()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(HeaderLabelsTableViewCell.self, forCellReuseIdentifier: Constants.headerLabelsCellItentifier)
        tableView.register(
            UserInformationTableViewCell.self,
            forCellReuseIdentifier:
            Constants.userInfoCellItentifier
        )
        tableView.register(
            ProfileButtonsTableViewCell.self,
            forCellReuseIdentifier: Constants.profileButtonsCellIdentifier
        )
        tableView.register(
            SavedStoriesTableViewCell.self,
            forCellReuseIdentifier: Constants.savedStoriesCellIdentifier
        )
        tableView.register(
            PostsCollectionTableViewCell.self,
            forCellReuseIdentifier: Constants.collectionCellIdentifier
        )

        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            .isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            .isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

/// Расширение UserProfileViewController методами UITableViewDataSource
extension UserProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Constants.sections[indexPath.section] {
        case .header:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.headerLabelsCellItentifier,
                for: indexPath
            ) as? HeaderLabelsTableViewCell else { return UITableViewCell() }
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.userInfoCellItentifier,
                for: indexPath
            ) as? UserInformationTableViewCell else { return UITableViewCell() }
            cell.linkButtonHandler = { [weak self] in
                let controllerToMove = WebPresentViewController()
                self?.present(controllerToMove, animated: true)
            }
            return cell
        case .buttons:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileButtonsCellIdentifier,
                for: indexPath
            ) as? ProfileButtonsTableViewCell else { return UITableViewCell() }
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.savedStoriesCellIdentifier,
                for: indexPath
            ) as? SavedStoriesTableViewCell else { return UITableViewCell() }
            cell.configure(savedStories: savedStories)
            return cell
        case .postsCollection:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.collectionCellIdentifier,
                for: indexPath
            ) as? PostsCollectionTableViewCell else { return UITableViewCell() }
            cell.transferImagesForCollection(images: images)
            return cell
        }
    }
}

/// Расширение UserProfileViewController методами UITableViewDelegate
extension UserProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Constants.sections[indexPath.section] {
        case .header:
            return 120
        case .buttons, .description, .stories:
            return 100
        case .postsCollection:
            return 200
        }
    }
}
