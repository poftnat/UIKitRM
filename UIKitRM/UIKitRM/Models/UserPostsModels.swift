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

/// Наполнение ячеек cохраненных сториз
struct SavedStory {
    /// Заголовок
    let title: String
    /// Имя картинки-обложки
    let coverImageName: String
    /// Сххраненная история
    let storyImageName: String
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
    /// название аватара пользователя
    let postsCount: Int
    /// название аватара пользователя
    let followsCount: Int
    /// название аватара пользователя
    let followersCount: Int
    /// название аватара пользователя
    let fullName: String
    /// название аватара пользователя
    let profileDescription: String

    /// экземпляр-синглтон
    static let shared = UserInfo(
        name: "notIbrahim",
        imageName: "post6",
        postsCount: 10,
        followsCount: 24,
        followersCount: 300,
        fullName: "Maria Maria",
        profileDescription: "Консультат"
    )
}

/// Перечисление для наполнения экрана пользователя
enum ProfileSections {
    /// заглавная ячейка. Аватар, лейблы "подписчики", "подписки", "посты"
    case header
    /// описание аккаунта
    case description
    /// кнопки редактировать и поделиться
    case buttons
    /// сохраненные истории
    case stories
    /// коллекция фотографий
    case postsCollection
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
