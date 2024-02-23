// WebPresentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран веб представления открытой ссылки
final class WebPresentViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let urlString = "https://www.spacex.com/vehicles/starship"
    }

    // MARK: - Visual Components

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        setupWebView()
        webView.addSubview(closeButton)
        setCloseButtonConstraints()
    }

    private func setupWebView() {
        view.addSubview(webView)
        setWebViewConstraints()
        loadRequest()
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    private func setCloseButtonConstraints() {
        closeButton.topAnchor.constraint(equalTo: webView.topAnchor, constant: 20).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setWebViewConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}
