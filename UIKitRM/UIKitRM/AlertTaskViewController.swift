// AlertTaskViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class AlertTaskViewController: UIViewController {
    // MARK: Private properties

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        imageView.image = UIImage(named: "Background")
        imageView.backgroundColor = .white
        return imageView
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 30)
        label.text = "Приветствую, "
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 37, width: view.frame.width, height: 82)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1)
        label.layer.borderColor = CGColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        label.layer.borderWidth = 1
        label.isHidden = true
        return label
    }()

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 82, y: 301, width: 150, height: 150)
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.backgroundColor = UIColor(red: 155 / 255, green: 127 / 255, blue: 181 / 255, alpha: 1)
        button.layer.borderColor = CGColor(red: 76 / 255, green: 36 / 255, blue: 115 / 255, alpha: 1)
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        return button
    }()

    private lazy var calculatorButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.backgroundColor = UIColor(red: 100 / 255, green: 181 / 255, blue: 130 / 255, alpha: 1)
        button.layer.borderColor = CGColor(red: 59 / 255, green: 105 / 255, blue: 76 / 255, alpha: 1)
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGreetingAlert()
    }

    // MARK: Private methods

    private func setupUI() {
        view.addSubview(backgroundImageView)
        view.addSubview(guessNumberButton)
        view.addSubview(calculatorButton)
        view.addSubview(greetingLabel)
    }

    private func setupGreetingAlert() {
        let alertController = UIAlertController(
            title: "Пожалуйста, представьтесь",
            message: nil,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            guard let text = alertController.textFields?.first?.text else {
                self.greetingLabel.isHidden = false
                return self.greetingLabel.text = "Приветствую, !"
            }
            self.greetingLabel.isHidden = false
            return self.greetingLabel.text = text
        }

        alertController.addTextField()
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
