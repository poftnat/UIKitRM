// BillViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс экрана со счетом
class BillViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var countButton: UIButton!

    // MARK: - Private Methods

    @IBAction private func pay(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let bill = UIAlertAction(title: "Да", style: .default) { _ in
            self.performSegue(withIdentifier: "ClosingSegue", sender: nil)
        }
        alertController.addAction(cancel)
        alertController.addAction(bill)
        alertController.preferredAction = bill
        present(alertController, animated: true)
    }
}
