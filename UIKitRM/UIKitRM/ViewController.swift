// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var loginTextField: UITextField!

    @IBOutlet var hidePasswordButton: UIButton!

    @IBOutlet var loginButton: UIButton!

    @IBAction func hidePassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }

    @IBAction func enterAction(_ sender: UIButton) {
        print("hghggh")
        if passwordTextField.text != nil, loginTextField.text != nil {
            loginButton.isEnabled = true
        }
    }
}
