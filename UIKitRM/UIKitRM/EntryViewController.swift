// EntryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
final class EntryViewController: UIViewController {
    // MARK: - IBAction

    @IBAction func moveToTask(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            let controllerToMove = StackViewController()
            navigationController?.pushViewController(controllerToMove, animated: true)
        case 1:
            let controllerToMove = AnchorsViewController()
            navigationController?.pushViewController(controllerToMove, animated: true)
        case 2:
            let controllerToMove = ConstraintsViewController()
            navigationController?.pushViewController(controllerToMove, animated: true)
        case 3:
            let controllerToMove = VFLViewController()
            navigationController?.pushViewController(controllerToMove, animated: true)
        default:
            break
        }
    }
}
