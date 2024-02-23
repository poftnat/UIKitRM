// UserPostsModels.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Общие типы контента
enum ContentType {
    /// первый пост
    case firstPost
    /// остальные посты
    case otherPosts
    /// истории
    case story
    /// рекомендованные аккаунты
    case recommended
}

/// Наполнение ячеек с постами пользователей
struct UserPostsData {
    /// имя аккаунта
    let userName: String
    /// имя аватарки аккаунта
    let avatarImageName: String
    /// имя контента
    let contentImageName: [String]
    /// текст поста
    let postText: String
    /// количество лайков
    let liked: Int
    /// дата публикации
    let publishingTime: String
}

/// Наполнение ячеек сториз
struct StoriesData {
    /// имя аккаунта
    let userName: String
    /// имя аватарки аккаунта
    let avatarImageName: String
}

/// Наполнение ячеек рекомендованные аккаунты
struct RecommendedUsersData {
    /// имя аккаунта
    let userName: String
    /// имя аватарки аккаунта
    let avatarImageName: String
}

/// Текущий пользователь
struct UserInfo {
    /// имя
    let name: String
    /// название аватара пользователя
    let imageName: String
    /// экземпляр-синглтон
    static let shared = UserInfo(name: "notIbrahim", imageName: "post6")
}

/// Даты получения уведомлений
enum NotificationTime {
    /// получено сегодня
    case today
    /// получено на прошлой неделе
    case lastWeek
}

/// Тип уведомления
enum NotificationType {
    /// подписки
    case subscription
    /// лайки, комментарии, отметки
    case action
}

/// Протокол, со свойством, хранящим тип уведомления
protocol Notification {
    /// Свойство хранит тип уведомления.
    var type: NotificationType { get }
}

/// Уведомление о событии с подписями
struct Subscription: Notification {
    /// Свойство хранит тип уведомления.
    var type: NotificationType
    /// Название картинки пользователя
    let userImageName: String
    /// имя пользователя
    let userName: String
    /// описание события
    let description: String
    /// временной период
    let timeInterval: NotificationTime
    /// время с момента получения уведомления
    let time: String
}

/// Наполнение ячейки для остальных действий
struct Action: Notification {
    /// Свойство хранит тип уведомления.
    var type: NotificationType
    /// Название картинки пользователя
    let userImageName: String
    /// имя пользователя
    let userName: String
    /// описание события
    let description: String
    /// время с момента получения уведомления
    let time: String
    /// временной период
    let timeInterval: NotificationTime
    /// превью поста, к которому добавляется действие
    let postPreviewImageName: String
}
