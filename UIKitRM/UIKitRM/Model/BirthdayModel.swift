// BirthdayModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для контроллера с записями дней рождения
struct BirthdayNoteModel {
    // MARK: - Public Properties

    /// Имя
    let name: String
    /// День и месяц рождения
    let dateOfBirth: String
    /// Текущий возраст
    let currentAge: Int
    /// Аватар
    let image: String
    /// Дней осталось до дня рождения
    let daysLeft: Int
}
