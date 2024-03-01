// Extension+UIView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для вью с удобным для проекта инициализатором
extension UIView {
    convenience init(frame: CGRect, backgroundColor: UIColor) {
        self.init()
        self.frame = frame
        self.backgroundColor = backgroundColor
    }
}
