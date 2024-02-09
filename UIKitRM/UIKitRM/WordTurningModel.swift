// WordTurningModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для WordTurningViewController
struct WordTurningModel {
    // MARK: - Public Properties

    var plainText: String
    var reversedText: String { String(plainText.reversed()).capitalized }
}
