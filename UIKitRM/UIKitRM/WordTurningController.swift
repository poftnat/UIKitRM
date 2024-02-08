// WordTurningController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
final class WordTurningViewController: UIViewController {
    // MARK: - Private Properties

    private var wordTurningView = WordTurningView()

    // MARK: - Life Cycle

    override func loadView() {
        view = wordTurningView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        wordTurningView.onStartWordTurningActionHandler = { [weak self] in
            self?.startWordTurningAction()
        }
    }

    // MARK: - Private Methods

    @objc func startWordTurningAction() {
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alertController.textFields?.first?.text
        }

        let cancel = UIAlertAction(title: "FFF", style: .default)
        alertController.addAction(action)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
