// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Контроллер плеера
class PlayerViewController: UIViewController {
    @IBOutlet var coverImageView: UIImageView!
    private lazy var player = AVAudioPlayer()

    @IBOutlet var playerSlider: UISlider!

    @IBOutlet var backwardButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var timeLabel: UILabel!

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        setupPlayer()
    }

    // MARK: - Private Methods

    private func setupPlayer() {
        do {
            if let audioPath = Bundle.main.path(forResource: "pie", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
            }
        } catch {
            print(error)
        }
        player.play()
    }

    @IBAction func startPlay(_ sender: UIButton) {
        if playButton.currentImage == UIImage(named: "pause") {
            playButton.setImage(UIImage(named: "play"), for: .normal)
            player.pause()
        } else {
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        }
    }
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
