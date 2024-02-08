// WordTurningController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
final class WordTurningViewController: UIViewController {
    // MARK: - Private Properties

    private var wordTurningView: WordTurningView?

    // MARK: - Life Cycle

    override func loadView() {
        view = WordTurningView(frame: UIScreen.main.bounds)
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        wordTurningView?.onStartWordTurningActionHandler = startWordTurningAction
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordTurningView?.onStartWordTurningActionHandler = { print("hfhffhfh") }
    }

    // MARK: - Private Methods

    private func startWordTurningAction() {
        print("qqqqq")
        let alertController = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            print(text ?? "ghhgghgh")
        }
        let cancel = UIAlertAction(title: "FFF", style: .default)
        alertController.addAction(action)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}
