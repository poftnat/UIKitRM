// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс основного меню приложения.
class MainMenuViewController: UIViewController {
    @IBOutlet var issueBillButton: UIButton!

    @IBAction func issueBillAction(_ sender: Any) {
        print("dfdf")
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let bill = UIAlertAction(title: "Чек", style: .default)
        alertController.addAction(cancel)
        alertController.addAction(bill)
        alertController.preferredAction = bill
        present(alertController, animated: true)
    }
}

func addAction(title: String?, message: String?, style: UIAlertViewStyle) {}
