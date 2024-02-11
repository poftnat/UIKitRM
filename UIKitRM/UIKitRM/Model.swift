// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для хранения звуков
struct Sound {
    /// Индекс
    var id: Int
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
}
