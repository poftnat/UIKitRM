// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Контроллер плеера
class PlayerViewController: UIViewController {
    /// Свойство-плеер
    private lazy var player = AVAudioPlayer()
    /// Свойство-индекс текущей песни
    var songIndex = 0
    /// Экземпляр текущей песни
    var song: Sound {
        Sound.sounds[songIndex]
    }

    /// Картинка обложки
    @IBOutlet var coverImageView: UIImageView!
    /// Слайдеры громкости и трека
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playerSlider: UISlider!
    /// Аутлеты, рисующие плеер
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var backwardButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var muteButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        setupVolumeSlider()
        setupPlayer()
    }

    // MARK: - Private Methods

    /// Конфигурация слайдера громкости
    private func setupVolumeSlider() {
        volumeSlider.transform = CGAffineTransformMakeRotation(CGFloat(-Double.pi / 2))
        volumeSlider.value = volumeSlider.maximumValue
    }

    /// Конфигурация плеера
    private func setupPlayer() {
        do {
            if let audioPath = Bundle.main.path(forResource: song.path, ofType: song.format) {
                try player = AVAudioPlayer(contentsOf: URL(filePath: audioPath))
            }
        } catch {
            print(error)
        }
        player.play()
        coverImageView.image = UIImage(named: song.image)
        nameLabel.text = song.name
        authorLabel.text = song.author
        playerSlider.maximumValue = Float(player.duration)
        playButton.setImage(UIImage(named: "pause"), for: .normal)

        let timer = Timer.scheduledTimer(
            timeInterval: 0.0001,
            target: self,
            selector: #selector(updateSlider),
            userInfo: nil,
            repeats: true
        )
    }

    /// Метод обновления значения на слайдере
    @objc private func updateSlider() {
        playerSlider.value = Float(player.currentTime)
        let time = Int(player.duration) - Int(player.currentTime)
        let minutes = time / 60
        let seconds = time - minutes * 60
        timeLabel.text = NSString(format: "-%02d:%02d", minutes, seconds) as String
    }

    /// Метод движения по текущему треку слайдером
    @IBAction func slideTrek(_ sender: UISlider) {
        if sender == playerSlider {
            player.stop()
            playButton.setImage(UIImage(named: "play"), for: .normal)
            player.currentTime = TimeInterval(sender.value)
            player.prepareToPlay()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        }
    }

    /// Метод изменения громкости
    @IBAction func slideVolume(_ sender: UISlider) {
        if sender == volumeSlider {
            player.volume = volumeSlider.value
            if volumeSlider.value == volumeSlider.minimumValue {
                muteButton.setImage(UIImage(named: "mute"), for: .normal)
            } else {
                muteButton.setImage(UIImage(named: "sound"), for: .normal)
            }
        }
    }

    /// Метод кнопки play
    @IBAction func startPlay(_ sender: UIButton) {
        if playButton.currentImage == UIImage(named: "pause") {
            playButton.setImage(UIImage(named: "play"), for: .normal)
            player.pause()
        } else {
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            player.play()
        }
    }

    /// Метод кнопки "следующий трек"
    @IBAction func playNext(_ sender: UIButton) {
        player.stop()
        playButton.setImage(UIImage(named: "play"), for: .normal)
        if songIndex < Sound.sounds.count - 1 {
            songIndex += 1
            nameLabel.text = song.name
            authorLabel.text = song.author
            setupPlayer()
        } else {
            songIndex = Sound.sounds.count - 1
            setupPlayer()
        }
    }

    /// Метод кнопки "предыдущий трек"
    @IBAction func playPrevious(_ sender: UIButton) {
        player.stop()
        playButton.setImage(UIImage(named: "play"), for: .normal)
        if songIndex > 1 {
            songIndex -= 1
            nameLabel.text = song.name
            authorLabel.text = song.author
            setupPlayer()
        } else {
            songIndex = 0
            setupPlayer()
        }
    }

    /// Метод кнопки "закрыть окно"
    @IBAction func dismissAction(_ sender: UIButton) {
        player.stop()
        dismiss(animated: true)
    }
}
