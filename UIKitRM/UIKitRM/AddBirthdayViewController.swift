// AddBirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер добавления новой записи в дни рождения
class AddBirthdayViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 15, width: 50, height: 20)
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        return button
    }()

    private lazy var addNoteButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        button.addTarget(self, action: #selector(addBirthdayNote), for: .touchUpInside)
        return button
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        imageView.layer.cornerRadius = 24
        imageView.image = UIImage(named: "avatar_template")
        return imageView
    }()

    private lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.skyBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        return button
    }()

    private lazy var nameTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 239, width: 175, height: 19),
        text: "Name Surname",
        font: "Verdana-Bold",
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    private lazy var birthdayTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 314, width: 175, height: 19),
        text: "Birthday",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    private lazy var ageTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 389, width: 175, height: 19),
        text: "Age",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    private lazy var genderTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 462, width: 175, height: 19),
        text: "Gender",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    private lazy var telegramTitleLabel = UILabel(
        frame: CGRect(x: 20, y: 537, width: 175, height: 19),
        text: "Telegram",
        font: nil,
        fontSize: 16,
        textColor: nil,
        alignment: nil
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        [
            cancelButton, addNoteButton, avatarImageView,
            changePhotoButton,
            nameTitleLabel,
            birthdayTitleLabel,
            genderTitleLabel,
            ageTitleLabel,
            telegramTitleLabel
        ]
        .forEach { view.addSubview($0) }
        setupBorders()
    }

    private func setupBorders() {
        var yPoint = 293
        for _ in 1 ... 5 {
            let borderView = UIView()
            borderView.frame = CGRect(x: 20, y: yPoint, width: 335, height: 1)
            borderView.backgroundColor = .lightGrayBorder
            view.addSubview(borderView)
            yPoint += 74
        }
    }

    @objc func dismissScreen() {
        dismiss(animated: true)
    }

    @objc func addBirthdayNote() {
        print("added")
    }
}

extension UILabel {
    convenience init(
        frame: CGRect,
        text: String,
        font: String?,
        fontSize: CGFloat,
        textColor: UIColor?,
        alignment: NSTextAlignment?
    ) {
        self.init()
        self.text = text
        self.font = UIFont(name: font ?? "Verdana-Bold", size: fontSize)
        self.frame = frame
        self.textColor = textColor ?? .black
        textAlignment = alignment ?? .left
    }
}
