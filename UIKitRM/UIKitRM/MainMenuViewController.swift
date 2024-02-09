// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс основного меню приложения.
final class MainMenuViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var clubCardSwitcher: UISwitch!
    @IBOutlet var issueBillButton: UIButton!
    @IBOutlet var salesLabel: UILabel!

    // MARK: - Private Methods

    @IBAction private func clubCardSwitcherAction(_ sender: UISwitch) {
        salesLabel.isHidden = !salesLabel.isHidden
    }

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
