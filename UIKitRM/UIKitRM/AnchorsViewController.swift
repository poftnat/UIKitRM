// AnchorsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Верстка якорями
final class AnchorsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let coloredViewHeight: CGFloat = 191
    }

    // MARK: - Visual Components

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .customRed
        view.layer.cornerRadius = Constants.coloredViewHeight / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .customYellow
        view.layer.cornerRadius = Constants.coloredViewHeight / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .customGreen
        view.layer.cornerRadius = Constants.coloredViewHeight / 2
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.8)
        view.layer.cornerRadius = Constants.coloredViewHeight / 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        redView.layer.cornerRadius = redView.frame.size.height / 2
        yellowView.layer.cornerRadius = yellowView.frame.size.height / 2
        greenView.layer.cornerRadius = greenView.frame.size.height / 2
        backgroundView.layer.cornerRadius = redView.frame.size.height / 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)

        setYellowViewConstraints()
        setRedViewConstraints()
        setGreenViewConstraints()
        setBackgroundViewConstraints()
    }

    private func setRedViewConstraints() {
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 191).isActive = true
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor, multiplier: 1).isActive = true
        redView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 191 / view.frame.size.height)
            .isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -4).isActive = true
        redView.setNeedsLayout()
    }

    private func setYellowViewConstraints() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: Constants.coloredViewHeight).isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 191 / view.frame.size.height)
            .isActive = true
        yellowView.layoutMarginsDidChange()
        yellowView.layoutIfNeeded()
    }

    private func setGreenViewConstraints() {
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 4).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: Constants.coloredViewHeight).isActive = true
        greenView.widthAnchor.constraint(equalTo: greenView.heightAnchor, multiplier: 1).isActive = true
        greenView.widthAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: Constants.coloredViewHeight / view.frame.size.height
        ).isActive = true
    }

    private func setBackgroundViewConstraints() {
        backgroundView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -4).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -4).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 4).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 4).isActive = true
    }
}
