// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс основного меню приложения.
final class MainMenuViewController: UIViewController {
    // MARK: - IBOutlets

    /// Свитчер "Есть карта лояльности"
    @IBOutlet var clubCardSwitcher: UISwitch!
    /// Кнопка запроса чека
    @IBOutlet var issueBillButton: UIButton!
    /// Лейбл, показывающий скидку по карте лояльности
    @IBOutlet var salesLabel: UILabel!

    // MARK: - Private Methods

    /// Функция показать/скрыть лейбл скидки от состояния свитчера
    @IBAction private func clubCardSwitcherAction(_ sender: UISwitch) {
        salesLabel.isHidden = !salesLabel.isHidden
    }

    /// Функция для кнопки запроса чека с переходом на экран чека
    @IBAction private func issueBillAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let bill = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "BillSegue", sender: nil)
        }
        alertController.addAction(cancel)
        alertController.addAction(bill)
        alertController.preferredAction = bill
        present(alertController, animated: true)
    }
}
