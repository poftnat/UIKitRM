// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран новостной ленты
final class FeedViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let leftImage = UIImage.logo
        static let rightImage = UIImage.messages
        static let PostTableViewCellIdentifier = "PostTableViewCell"
        static let StoriesTableViewCellIdentifier = "StoriesTableViewCell"
        static let RecommendationsTableViewCellIdentifier = "RecommendationsTableViewCell"
    }

    // MARK: - Visual Components

    private let leftBarButtonItem: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(Constants.leftImage, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }()

    private let rightBarButtonItem: UIBarButtonItem = {
        let button = UIButton()
        button.setImage(Constants.rightImage, for: .normal)
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }()

    private let tableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Private Properties

    private let stories = [
        StoriesData(userName: "Ваша история", avatarImageName: UserInfo.shared.imageName),
        StoriesData(userName: "user2", avatarImageName: "post5"),
        StoriesData(userName: "user3", avatarImageName: "post2"),
        StoriesData(userName: "user4", avatarImageName: "post4"),
        StoriesData(userName: "user5", avatarImageName: "post3"),
        StoriesData(userName: "user2", avatarImageName: "post1"),
        StoriesData(userName: "user8", avatarImageName: "post6")
    ]

    private let myPosts = [UserPostsData(
        userName: "bloggalini",
        avatarImageName: "userGalina",
        contentImageName: ["post1", "post2", "post3"],
        postText: "не знаешь, что посмотреть? Посмотри, во что ты превратился",
        liked: 999,
        publishingTime: "10 минут назад"
    )]

    private let posts = [
        UserPostsData(
            userName: "lalala",
            avatarImageName: "post1",
            contentImageName: ["post2"],
            postText: "thats first post hello", liked: 10,
            publishingTime: "10 mins ago"
        ),
        UserPostsData(
            userName: "lalala",
            avatarImageName: "post1",
            contentImageName: ["post3"],
            postText: "hello there", liked: 20,
            publishingTime: "5 mins ago"
        ),
        UserPostsData(
            userName: "alisa",
            avatarImageName: "post4",
            contentImageName: ["post3"],
            postText: "hehe", liked: 30,
            publishingTime: "20 mins ago"
        ), UserPostsData(
            userName: "minnie",
            avatarImageName: "post1",
            contentImageName: ["animal2"],
            postText: "hehe", liked: 30,
            publishingTime: "20 mins ago"
        ), UserPostsData(
            userName: "minnie",
            avatarImageName: "post1",
            contentImageName: ["animal"],
            postText: "hehe", liked: 30,
            publishingTime: "20 mins ago"
        )
    ]

    private lazy var content: [ContentType] = [.story, .firstPost, .recommended, .otherPosts]

    private let recommendedAccounts = [
        StoriesData(userName: "user", avatarImageName: "post3"),
        StoriesData(userName: "user2", avatarImageName: "post4"),
        StoriesData(userName: "user", avatarImageName: "post3"),
        StoriesData(userName: "user2", avatarImageName: "post4")
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        setupNavigationControllerItems()
        setupTableView()
    }

    private func setupNavigationControllerItems() {
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
//        tableView.estimatedRowHeight = 90
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.PostTableViewCellIdentifier)
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: Constants.StoriesTableViewCellIdentifier)
        tableView.register(
            RecommendationsTableViewCell.self,
            forCellReuseIdentifier: Constants.RecommendationsTableViewCellIdentifier
        )
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            .isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            .isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

/// Расширение методами протокола UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch content[section] {
        case .story, .recommended, .firstPost:
            return 1
        case .otherPosts:
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch content[indexPath.section] {
        case .story:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.StoriesTableViewCellIdentifier,
                    for: indexPath
                ) as? StoriesTableViewCell
            else { return UITableViewCell() }
            cell.configure(stories: stories)
            return cell
        case .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.PostTableViewCellIdentifier,
                    for: indexPath
                ) as? PostTableViewCell
            else { return UITableViewCell() }
            cell.prepareForReuse()
            cell.configure(data: myPosts[indexPath.row])
            return cell
        case .recommended:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.RecommendationsTableViewCellIdentifier,
                    for: indexPath
                ) as? RecommendationsTableViewCell
            else { return UITableViewCell() }
            cell.configure(stories: recommendedAccounts)
            return cell
        case .otherPosts:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: Constants.PostTableViewCellIdentifier,
                    for: indexPath
                ) as? PostTableViewCell
            else { return UITableViewCell() }
            cell.prepareForReuse()
            cell.configure(data: posts[indexPath.row])
            return cell
        }
    }
}

/// Расширение методами протокола UITableViewDelegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch content[indexPath.section] {
        case .story:
            return 100
        case .firstPost, .otherPosts:
            return 500
        case .recommended:
            return 300
        }
    }
}
