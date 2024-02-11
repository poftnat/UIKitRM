// WordTurningModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для WordTurningViewController
struct WordTurningModel {
    // MARK: - Public Properties

    /// Свойство, хранящее введенный текст
    var plainText: String
    /// Свойство, переворачивающее введенный текст
    var reversedText: String { String(plainText.reversed()).capitalized }
}
