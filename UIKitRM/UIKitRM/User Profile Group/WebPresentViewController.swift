// WebPresentViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран представления веб браузера
final class WebPresentViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let urlString = "https://youtu.be/dQw4w9WgXcQ?si=1h9kaErkM2mfkDkM"
    }

    // MARK: - Visual Components

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        view.addSubview(closeButton)
        view.backgroundColor = .white
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        setupWebView()
    }

    private func setupWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadRequest()
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}
