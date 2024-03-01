// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол для передачи информации между контроллерами
protocol TransferDataDelegate: AnyObject {
    func transfer(note: BirthdayNoteModel)
}

/// Основной экран приложения, отображает ячейки с данными о сохраненных пользователях и днях рождения
class BirthdayListViewController: UIViewController {
    // MARK: - Private Properties

    /// Массив записей о днях рождения
    private var birthdayNotes: [BirthdayNoteModel] = [
        BirthdayNoteModel(
            name: "Helena Link",
            dateOfBirth: "10.03",
            currentAge: 24,
            image: "photo_1",
            daysLeft: 0
        ),
        BirthdayNoteModel(
            name: "Verona Tusk",
            dateOfBirth: "20.03",
            currentAge: 38,
            image: "photo_4",
            daysLeft: 10
        ),
        BirthdayNoteModel(
            name: "Alex Smith",
            dateOfBirth: "21.04",
            currentAge: 38,
            image: "photo_3",
            daysLeft: 42
        ),
        BirthdayNoteModel(
            name: "Tom Johnson",
            dateOfBirth: "05.06",
            currentAge: 17,
            image: "photo_2",
            daysLeft: 87
        )
    ] {
        didSet {
            setupLabels()
        }
    }

    // MARK: - Visual Components

    /// Заголовок экрана
    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 108, y: 59, width: 209, height: 20)
        label.text = "Birthday Reminder"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        return label
    }()

    /// Кнопка "добавить запись о дне рождения"
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
        setupLabels()
    }

    // MARK: - Private Methods

    /// Конфигурация UI
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = addBirthdayButton
        [pageTitleLabel].forEach { view.addSubview($0) }
    }

    /// Конфигурация представления ячеек
    private func setupLabels() {
        var yPoint = 105

        for element in birthdayNotes.sorted(by: { $0.daysLeft < $1.daysLeft }) {
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

    /// Открытие экрана для добавления записи в массив
    @objc private func openAddScreen() {
        let controllerToMove = AddBirthdayViewController()
        controllerToMove.delegate = self
        present(controllerToMove, animated: true)
    }
}

/// Подписание класса на протокол
extension BirthdayListViewController: TransferDataDelegate {
    func transfer(note: BirthdayNoteModel) {
        birthdayNotes.append(note)
    }
}
