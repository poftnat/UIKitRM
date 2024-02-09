// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var loginTextField: UITextField!

    @IBOutlet private var passwordTextField: UITextField!

    @IBOutlet private var hidePasswordButton: UIButton!

    @IBOutlet private var loginButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        loginTextField.delegate = self
    }

    // MARK: - IBAction

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

// MARK: Extension - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if password.count > 3, login.count > 3 {
            loginButton.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0) {
                self.loginButton.alpha = 1
            }
        }
        return true
    }
}
