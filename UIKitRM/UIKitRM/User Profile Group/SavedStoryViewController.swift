// SavedStoryViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран просмотра сохраненной истории
class SavedStoryViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    private enum Constants {
        //    static let
        //    static let
        //    static let
        //    static let
    }

    // MARK: - Visual Components

    private let storyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let progressView: UIProgressView = {
        let view = UIProgressView()
        view.progressViewStyle = .bar
        view.setProgress(0.0, animated: true)
        view.progressTintColor = .buttonLightGray
        view.trackTintColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    private let storyCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.buttonLightGray.cgColor
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let storyTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        label.textColor = .buttonLightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Public Properties

    private var storyTimer = Timer()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTimer()
    }

    // MARK: - Public Methods

    func setStory(story: SavedStory) {
        storyImageView.image = UIImage(named: story.storyImageName)
        storyCoverImageView.image = UIImage(named: story.coverImageName)
        storyTitleLabel.text = story.title
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(storyImageView)
        view.addSubview(closeButton)
        view.addSubview(storyCoverImageView)
        view.addSubview(storyTitleLabel)
        view.addSubview(progressView)

        setStoryImageViewConstraints()
        setCloseButtonConstraints()
        setStoryCoverImageViewConstraints()
        setStoryTitleLabelConstraints()
        setProgressViewConstraints()
    }

    private func setStoryImageViewConstraints() {
        storyImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storyImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        storyImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storyImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setCloseButtonConstraints() {
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }

    private func setStoryCoverImageViewConstraints() {
        storyCoverImageView.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor).isActive = true
        storyCoverImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        storyCoverImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        storyCoverImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setStoryTitleLabelConstraints() {
        storyTitleLabel.centerYAnchor.constraint(equalTo: closeButton.centerYAnchor).isActive = true
        storyTitleLabel.leadingAnchor.constraint(equalTo: storyCoverImageView.trailingAnchor, constant: 12)
            .isActive = true
        storyTitleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        storyTitleLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -17).isActive = true
    }

    private func setProgressViewConstraints() {
        progressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
            .isActive = true
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }

    private func setTimer() {
        storyTimer = Timer.scheduledTimer(
            timeInterval: 1 / 60,
            target: self,
            selector: #selector(updateProgressBar),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateProgressBar() {
        progressView.progress += 0.001
        if progressView.progress == 1.0 {
            storyTimer.invalidate()
            closeScreen()
        }
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}
