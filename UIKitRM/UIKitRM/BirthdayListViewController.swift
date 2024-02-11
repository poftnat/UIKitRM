// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Основной экран приложения
class BirthdayListViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 108, y: 59, width: 209, height: 20)
        label.text = "Birthday Reminder"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    private lazy var addBirthdayButton: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .skyBlue
        button.addTarget(self, action: #selector(openAddScreen), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: button)
        return rightBarButtonItem
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(BirthdayNoteModel.birthdayNotes.count) willappear")
        var yPoint = 105

        for element in BirthdayNoteModel.birthdayNotes.sorted(by: { $0.daysLeft < $1.daysLeft }) {
            let avatarImageView = UIImageView()
            avatarImageView.frame = CGRect(x: 20, y: yPoint, width: 75, height: 75)
            avatarImageView.image = UIImage(named: element.image)
            view.addSubview(avatarImageView)

            let nameLabel = UILabel()
            nameLabel.frame = CGRect(x: 110, y: yPoint + 10, width: 209, height: 20)
            nameLabel.text = element.name
            nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
            view.addSubview(nameLabel)

            let dateLabel = UILabel()
            dateLabel.frame = CGRect(x: 110, y: yPoint + 40, width: 209, height: 20)
            dateLabel.text = "\(element.dateOfBirth) - turns \(element.currentAge + 1)"
            dateLabel.font = UIFont(name: "Verdana", size: 14)
            view.addSubview(dateLabel)

            if element.daysLeft == 0 {
                let imageView = UIImageView()
                imageView.frame = CGRect(x: 314, y: yPoint + 10, width: 44, height: 44)
                imageView.image = UIImage(named: "image-2")
                dateLabel.text? += "!"
                view.addSubview(imageView)
            } else {
                let label = UILabel()
                label.frame = CGRect(x: 314, y: yPoint + 10, width: 42, height: 44)
                label.text = "\(element.daysLeft)\ndays"
                label.font = UIFont(name: "Verdana-Bold", size: 16)
                label.textAlignment = .center
                label.numberOfLines = 2
                label.adjustsFontSizeToFitWidth = true
                label.textColor = .violetAccent
                view.addSubview(label)
            }
            yPoint += 95
        }
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addBirthdayButton
        [pageTitleLabel].forEach { view.addSubview($0) }
    }

    @objc private func openAddScreen() {
        let controllerToMove = AddBirthdayViewController()
        present(controllerToMove, animated: true)
    }
}
