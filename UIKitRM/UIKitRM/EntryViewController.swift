// EntryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class EntryViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        imageView.image = UIImage(named: "logo_image")
        return imageView
    }()

    private lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        label.text = "Birthday\nReminder"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .violetAccent
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        label.text = "Sign in"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .raspberryAccent
        return label
    }()

    //
    private lazy var emailTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        label.text = "Email"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .raspberryAccent
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        textField.placeholder = "Typing email"
        textField.borderStyle = .none
        return textField
    }()

    private lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        label.text = "Password"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = .raspberryAccent
        return label
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        textField.placeholder = "Typing password"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var hidePasswordButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 332, y: 419, width: 30, height: 20)
        button.layer.cornerRadius = 5
        button.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .lightGray
        button.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        button.backgroundColor = .raspberryAccent.withAlphaComponent(0.4)
        button.layer.cornerRadius = 12
//        button.clipsToBounds = true
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.isUserInteractionEnabled = false
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        let loginBorderView = setBorderLineView(20, 372)
        let passwordBorderView = setBorderLineView(20, 448)

        [
            logoImageView,
            appTitleLabel,
            signInLabel,
            emailTitleLabel,
            passwordTitleLabel,
            loginTextField,
            passwordTextField,
            hidePasswordButton,
            loginButton,
            loginBorderView,
            passwordBorderView
        ].forEach { view.addSubview($0) }
    }

    private func setBorderLineView(_ xFrame: Int, _ yFrame: Int) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: xFrame, y: yFrame, width: 335, height: 1)
        view.backgroundColor = .lightGray
        return view
    }

    @objc private func hidePassword() {
        if passwordTextField.isSecureTextEntry {
            hidePasswordButton.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        } else {
            hidePasswordButton.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        }
    }
}

extension EntryViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let login = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if password.count > 3, login.count > 3 {
            loginButton.isUserInteractionEnabled = true
            loginButton.backgroundColor = .raspberryAccent
        }
        return true
    }
}

// extension EntryViewController: UITextFieldDelegate {
//    func textField(
//        _ textField: UITextField,
//        shouldChangeCharactersIn range: NSRange,
//        replacementString string: String
//    ) -> Bool {
//        let login = loginTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
//        if password.count > 3, login.count > 3 {
//            loginButton.isUserInteractionEnabled = true
//            UIView.animate(withDuration: 0) {
//                self.loginButton.alpha = 1
//            }
//        }
//        return true
//    }
// }
