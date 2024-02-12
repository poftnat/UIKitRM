// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения. Контроллер плейлиста.
class PlaylistViewController: UIViewController {
    /// Группа лейблов, отрисовывающих первую ячейку
    /// картинка с обложкой альбома
    @IBOutlet var firstSoundImage: UIImageView!
    /// Имя трека
    @IBOutlet var firstSoundNameLabel: UILabel!
    /// Имя автора
    @IBOutlet var firstSoundAuthorLabel: UILabel!
    /// Продолжительность трека
    @IBOutlet var firstSoundDurationLabel: UILabel!

    /// Группа лейблов, отрисовывающих вторую ячейку
    @IBOutlet var secondSoundImage: UIImageView!
    @IBOutlet var secondSoundNameLabel: UILabel!
    @IBOutlet var secondSoundAuthorLabel: UILabel!
    @IBOutlet var secondSoundDurationLabel: UILabel!

    /// Группа лейблов, отрисовывающих третью ячейку
    @IBOutlet var thirdSoundImage: UIImageView!
    @IBOutlet var thirdSoundDurationLabel: UILabel!
    @IBOutlet var thirdSoundAuthorLabel: UILabel!
    @IBOutlet var thirdSoundNameLabel: UILabel!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaylist()
    }

    // MARK: - Public Methods

    /// Метод конфигурации перехода через сегвей
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let newVC = segue.destination as? PlayerViewController {
            switch segue.identifier {
            case "firstTrackSegue":
                newVC.songIndex = 0
            case "secondTrackSegue":
                newVC.songIndex = 1
            case "thirdTrackSegue":
                newVC.songIndex = 2
            default:
                break
            }
        }
    }

    // MARK: - Private Methods

    /// Метод конфигурации супервью
    private func setupPlaylist() {
        firstSoundImage.image = UIImage(named: Sound.sounds[0].image)
        firstSoundNameLabel.text = Sound.sounds[0].name
        firstSoundAuthorLabel.text = Sound.sounds[0].author
        firstSoundDurationLabel.text = "03:13"

        secondSoundImage.image = UIImage(named: Sound.sounds[1].image)
        secondSoundNameLabel.text = Sound.sounds[1].name
        secondSoundAuthorLabel.text = Sound.sounds[1].author
        secondSoundDurationLabel.text = "03:09"

        thirdSoundImage.image = UIImage(named: Sound.sounds[2].image)
        thirdSoundNameLabel.text = Sound.sounds[2].name
        thirdSoundAuthorLabel.text = Sound.sounds[2].author
        thirdSoundDurationLabel.text = "07:54"
    }
}
