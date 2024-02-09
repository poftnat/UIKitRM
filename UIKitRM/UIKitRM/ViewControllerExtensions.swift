// ViewControllerExtensions.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

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
