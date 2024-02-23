// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let subtitleLabelText = "Запросы на подписку"
        static let verdanaBoldFontName = "Verdana-Bold"
        static let verdanaFontName = "Verdana"
        static let navigationItemTitle = "Уведомления"
        static let subscriptionTableViewCellIdentifier = "SubscriptionTableViewCell"
        static let actionsTableViewCellIdentifier = "ActionsTableViewCell"
        static let todaySectionHeader = "Сегодня"
        static let lastWeekSectionHeader = "На этой неделе"
    }

    // MARK: - Visual Components

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subtitleLabelText
        label.font = UIFont(name: Constants.verdanaBoldFontName, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Private Properties

    private let notificationSections: [NotificationTime] = [.today, .lastWeek]

    private let todayActions: [Notification] = [
        Action(
            type: .action, userImageName: "post1",
            userName: "ququ",
            description: "Понравился ваш комментарий",
            time: "12 ч",
            timeInterval: .lastWeek,
            postPreviewImageName: "post4"
        ),
        Action(
            type: .action,
            userImageName: "post1",
            userName: "ququ",
            description: "Упомянул вас в комментарии @rmttt Носишь кандибобер?",
            time: "12 ч",
            timeInterval: .lastWeek,
            postPreviewImageName: "post3"
        ),
    ]

    private let lastWeekActions: [Notification] = [
        Action(
            type: .action, userImageName: "post1",
            userName: "ququ",
            description: "Likes",
            time: "12 ч",
            timeInterval: .lastWeek,
            postPreviewImageName: "post4"
        ),
        Subscription(
            type: .subscription, userImageName: "post3",
            userName: "minnieM",
            description: "12miho появился(-ась) в RMLink. Вы можете быть знакомы",
            timeInterval: .today,
            time: "12ч"
        ),
        Subscription(
            type: .subscription, userImageName: "post3",
            userName: "flflff",
            description: "подписался(-ась) на ваши новости 5д.",
            timeInterval: .today,
            time: "12ч"
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = Constants.navigationItemTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(subtitleLabel)
        view.addSubview(tableView)
        setupConstraints()
        setupTableView()
    }

    private func setupConstraints() {
        subtitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        subtitleLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true

        tableView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 4).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 4)
            .isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(
            SubscriptionTableViewCell.self,
            forCellReuseIdentifier: Constants.subscriptionTableViewCellIdentifier
        )
        tableView.register(ActionTableViewCell.self, forCellReuseIdentifier: Constants.actionsTableViewCellIdentifier)
    }
}

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch notificationSections[section] {
        case .today:
            return Constants.todaySectionHeader
        case .lastWeek:
            return Constants.lastWeekSectionHeader
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch notificationSections[section] {
        case .today:
            return todayActions.count
        case .lastWeek:
            return lastWeekActions.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch notificationSections[indexPath.section] {
        case .today:
            if let item = todayActions[indexPath.row] as? Action {
                guard let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: Constants.actionsTableViewCellIdentifier,
                        for: indexPath
                    ) as? ActionTableViewCell else { return UITableViewCell() }
                cell.configure(action: item)
                return cell
            } else if let item = todayActions[indexPath.row] as? Subscription {
                guard let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: Constants.subscriptionTableViewCellIdentifier,
                        for: indexPath
                    ) as? SubscriptionTableViewCell else { return UITableViewCell() }
                cell.configure(action: item)
                return cell
            }
        case .lastWeek:
            if let item = lastWeekActions[indexPath.row] as? Action {
                guard let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: Constants.actionsTableViewCellIdentifier,
                        for: indexPath
                    ) as? ActionTableViewCell else { return UITableViewCell() }
                cell.configure(action: item)
                return cell
            } else if let item = lastWeekActions[indexPath.row] as? Subscription {
                guard let cell = tableView
                    .dequeueReusableCell(
                        withIdentifier: Constants.subscriptionTableViewCellIdentifier,
                        for: indexPath
                    ) as? SubscriptionTableViewCell else { return UITableViewCell() }
                cell.configure(action: item)
                return cell
            }
        }
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        notificationSections.count
    }
}
