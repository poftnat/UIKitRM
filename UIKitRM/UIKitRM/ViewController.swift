// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var loginTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var hidePasswordButton: UIButton!

    @IBOutlet var loginButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        loginTextField.delegate = self
    }

    // MARK: - Private Methods

    @IBAction private func enterAction(_ sender: UIButton) {}

    @IBAction private func hidePassword(_ sender: Any) {
        if passwordTextField.isSecureTextEntry {
            hidePasswordButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        } else {
            hidePasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        }
    }
}
