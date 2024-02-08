// WordTurningView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class WordTurningView: UIView {
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        button.backgroundColor = UIColor(red: 76 / 255, green: 216 / 255, blue: 102 / 255, alpha: 1)
        button.setTitle("Начать", for: .normal)
        button.addTarget(self, action: #selector(startWordTurningAction), for: .touchUpInside)
        return button
    }()

    private lazy var inputTextHeaderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        label.text = "Вы ввели слово:"
        label.textAlignment = .center
        return label
    }()

    private lazy var inputTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 206, width: 275, height: 57)
        label.text = "some"
        label.textAlignment = .center
        return label
    }()

    private lazy var outputTextHeaderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 306, width: 275, height: 57)
        label.text = "А вот что получится, если читать справа налево"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var outputTextLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 406, width: 275, height: 57)
        label.text = "some"
        label.textAlignment = .center
        return label
    }()

    var onStartWordTurningActionHandler: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        addSubview(startButton)
        addSubview(inputTextHeaderLabel)
        addSubview(inputTextLabel)
        addSubview(outputTextHeaderLabel)
        addSubview(outputTextLabel)
    }

    @objc func startWordTurningAction() {
        print("thththth")
        onStartWordTurningActionHandler?()
    }
}
