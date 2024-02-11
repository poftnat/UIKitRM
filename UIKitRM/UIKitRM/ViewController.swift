// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    /// Текствове поле логина
    @IBOutlet private var loginTextField: UITextField!
    /// Текстовое поле пароля
    @IBOutlet private var passwordTextField: UITextField!
    /// Кнопка скрыть/показать пароль
    @IBOutlet private var hidePasswordButton: UIButton!
    /// Кнопка авторизации
    @IBOutlet private var loginButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        loginTextField.delegate = self
    }

    // MARK: - IBAction

    /// Метод перехода на следуюший экран
    @IBAction private func enterAction(_ sender: UIButton) {}
    /// Метод скрыть/показать пароль
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

/// Расширение контроллера с делегатом
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
