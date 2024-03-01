// Extension+UILabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UILabel с нужным инициализатором
extension UILabel {
    convenience init(
        frame: CGRect,
        text: String,
        font: String?,
        fontSize: CGFloat,
        textColor: UIColor?,
        alignment: NSTextAlignment?
    ) {
        self.init()
        self.text = text
        self.font = UIFont(name: font ?? "Verdana-Bold", size: fontSize)
        self.frame = frame
        self.textColor = textColor ?? .black
        textAlignment = alignment ?? .left
    }
}
