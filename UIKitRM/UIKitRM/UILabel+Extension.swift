// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение UILabel для установки текста с разным весом шрифта
extension UILabel {
    /// Функция для установки текста с разным весом шрифта
    /// - Parameter boldText: часть строки, которая будет жирной
    /// - Parameter regularText: часть строки, которая будет обычной
    func setBoldAndRegularText(boldText: String, regularText: String) {
        let attributedString = NSMutableAttributedString()

        let boldAttributes: [NSAttributedString.Key: Any] =
            [NSAttributedString.Key.font: UIFont(name: "Verdana-Bold", size: 10) ?? UIFont.systemFont(ofSize: 12)]
        let boldString = NSAttributedString(string: boldText, attributes: boldAttributes)
        attributedString.append(boldString)

        let regularString = NSAttributedString(string: regularText)
        attributedString.append(NSAttributedString(" "))
        attributedString.append(regularString)

        attributedText = attributedString
    }
}
