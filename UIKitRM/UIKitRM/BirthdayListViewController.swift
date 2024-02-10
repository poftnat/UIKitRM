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
