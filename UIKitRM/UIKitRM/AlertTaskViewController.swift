// AlertTaskViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения.
final class AlertTaskViewController: UIViewController {
    // MARK: - Private Properties

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
        button.addTarget(self, action: #selector(startGuessNumberGame), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(startCalculator), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupGreetingAlert()
    }

    // MARK: - Private Methods

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
            if let text = alertController.textFields?.first?.text {
                self.greetingLabel.isHidden = false
                return self.greetingLabel.text = "Приветствую, \(text)!"
            }
        }

        alertController.addTextField()
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    @objc private func startGuessNumberGame() {
        let alertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "ОК", style: .default) { [weak self] _ in
            guard let number = alertController.textFields?.first?.text else { return }
            if let number = Int(number) {
                self?.showGameResultAlert(number)
            }
        }

        let cansel = UIAlertAction(title: "Отмена", style: .default)

        alertController.addTextField()
        alertController.addAction(cansel)
        alertController.addAction(action)
        alertController.preferredAction = action
        present(alertController, animated: true)
    }

    private func showGameResultAlert(_ number: Int) {
        let randomNumber = Int.random(in: 1 ... 10)
        if Int(number) == randomNumber {
            let alertController = UIAlertController(title: "Поздравляю!", message: "Вы угадали", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ОК", style: .default) { [weak self] _ in
                self?.startGuessNumberGame()
            })
            present(alertController, animated: true)
        } else {
            let alertController = UIAlertController(
                title: "Упс!",
                message: "Это неверный ответ",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "ОК", style: .default))
            present(alertController, animated: true)
        }
    }

    @objc private func startCalculator() {
        let alertController = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Сложить          ", style: .default) { [weak self] _ in
            guard let firstNumber = alertController.textFields?.first?.text,
                  let secondNumber = alertController.textFields?[1].text else { return }
            self?.showResultAlert(firstNumber, secondNumber)
        }

        let cansel = UIAlertAction(title: "Отмена           ", style: .default) { _ in
        }

        alertController.addTextField()
        alertController.addTextField()
        alertController.addAction(action)
        alertController.addAction(cansel)
        alertController.preferredAction = action
        present(alertController, animated: true)
    }

    private func showResultAlert(_ firstNumber: String, _ secondNumber: String) {
        guard let firstNumber = Int(firstNumber), let secondNumber = Int(secondNumber) else { return }
        let result = firstNumber + secondNumber

        let alertController = UIAlertController(
            title: "Ваш результат",
            message: "\(result)",
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "Ок", style: .default)
        let cansel = UIAlertAction(title: "Отмена", style: .default)
        alertController.addAction(cansel)
        alertController.addAction(action)
        alertController.preferredAction = action
        present(alertController, animated: true)
    }
}
