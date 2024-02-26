// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Верстка стеквью
final class StackViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let colors: [UIColor] = [.customRed, .customYellow, .customGreen]
        static let viewHeight: CGFloat = 190
    }

    // MARK: - Visual Components

    private let redView: ViewForStackView = {
        let view = ViewForStackView()
        view.backgroundColor = .customRed
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        return view
    }()

    private let yellowView: ViewForStackView = {
        let view = ViewForStackView()
        view.backgroundColor = .customYellow
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        return view
    }()

    private let greenView: ViewForStackView = {
        let view = ViewForStackView()
        view.backgroundColor = .customGreen
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: Constants.viewHeight).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        return view
    }()

    private let stackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        setStackViewConstraints()
    }

    private func setStackViewConstraints() {
        stackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        stackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10).isActive = true

        redView.widthAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: Constants.viewHeight / view.bounds.height
        ).isActive = true
    }
}

final class ViewForStackView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
