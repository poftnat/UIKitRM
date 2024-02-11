// WordTurningView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для WordTurningViewController
final class WordTurningView: UIView {
    // MARK: - Public Properties

    /// Кнопка Начать игру
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1)
        button.setTitle("Начать", for: .normal)
        button.addTarget(self, action: #selector(startWordTurningAction), for: .touchUpInside)
        return button
    }()

    /// Лейбл заголовка для введенного текста
    lazy var inputTextHeaderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.text = "Вы ввели слово"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    /// Лейбл  для введенного текста
    lazy var inputTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 206, width: 275, height: 57)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        label.textColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.2)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    /// Лейбл заголовка для перевернутого текста
    lazy var outputTextHeaderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 306, width: 275, height: 57)
        label.text = "А вот что получится, если читать справа налево"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    /// Лейбл для перевернутого текста
    lazy var outputTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 406, width: 275, height: 57)
        label.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        label.textColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 0 / 255, alpha: 0.2)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    /// Замыкание для связи с контролллером
    var onStartWordTurningActionHandler: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// Метод установки вью на супервью
    private func setupUI() {
        backgroundColor = .white
        addSubview(startButton)
        addSubview(inputTextHeaderLabel)
        addSubview(inputTextLabel)
        addSubview(outputTextHeaderLabel)
        addSubview(outputTextLabel)
    }

    /// Метод для нажатия по кнопке "Начать", внутри выполняется замыкание, которое вызываается в контроллере
    @objc private func startWordTurningAction() {
        onStartWordTurningActionHandler?()
    }
}
