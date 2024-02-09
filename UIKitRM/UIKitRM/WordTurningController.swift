// WordTurningController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер стартового MVC
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
            guard let text = alertController.textFields?.first?.text else { return }
            self.wordTurningView.startButton.frame = CGRect(x: 20, y: 700, width: 335, height: 44)
            self.wordTurningView.inputTextHeaderLabel.isHidden = false
            self.wordTurningView.inputTextLabel.isHidden = false
            self.wordTurningView.outputTextHeaderLabel.isHidden = false
            self.wordTurningView.outputTextLabel.isHidden = false
            let wordTurningModel = WordTurningModel(plainText: text)
            self.wordTurningView.inputTextLabel.text = wordTurningModel.plainText
            self.wordTurningView.outputTextLabel.text = String(wordTurningModel.reversedText)
        }

        let cancel = UIAlertAction(title: "FFF", style: .default)
        alertController.addAction(action)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
