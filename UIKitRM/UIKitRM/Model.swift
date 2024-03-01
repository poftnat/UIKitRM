// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для хранения звуков
struct Sound {
    /// Название песни
    var name: String
    /// Исполнитель
    var author: String
    /// Расположение (имя)
    var path: String
    /// Разрешение
    var format: String
    /// Лейбл
    var image: String
    /// Статик массив для хранения библиотеки песен
    static let sounds: [Sound] = [
        Sound(
            name: "Беспонтовый пирожок",
            author: "Гражданская оборона",
            path: "pie",
            format: "mp3",
            image: "grob"
        ),
        Sound(
            name: "Если бы на Марсе",
            author: "Браво",
            path: "mars",
            format: "mp3",
            image: "bravo"
        ),
        Sound(name: "Это все...", author: "ДДТ", path: "ddt", format: "mp3", image: "ddt_eto_vsio")
    ]
}
