// BirthdayModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для контроллера с записями дней рождения
struct BirthdayNoteModel {
    // MARK: - Public Properties

    /// Свойство типа, которое хранит дату для отображения.
    static var birthdayNotes: [BirthdayNoteModel] = [
        BirthdayNoteModel(
            name: "Helena Link",
            dateOfBirth: "10.03",
            currentAge: 24,
            image: "photo_1",
            daysLeft: 0
        ),
        BirthdayNoteModel(name: "Verona Tusk", dateOfBirth: "20.03", currentAge: 38, image: "photo_4", daysLeft: 102),
        BirthdayNoteModel(name: "Alex Smith", dateOfBirth: "21.04", currentAge: 38, image: "photo_3", daysLeft: 42),
        BirthdayNoteModel(name: "Tom Johnson", dateOfBirth: "05.06", currentAge: 17, image: "photo_2", daysLeft: 87)
    ]

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
