// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение создает функцию, которая добавляет несколько принимаемых параметров типа вью в супервью и снимает
/// AutoresizingMask
extension UIView {
    /// Функция добавляет несколько принимаемых параметров типа вью в супервью и снимает AutoresizingMask
    /// - Parameter subviews: принимаемые для добавления вью
    func addSubviewsWithoutAutoResizingMask(_ subviews: UIView...) {
        for subview in subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
            addSubview(subview)
        }
    }
}
