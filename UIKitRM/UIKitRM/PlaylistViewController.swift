// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class PlaylistViewController: UIViewController {
    let sounds: [Sound] = [
        Sound(
            id: 0,
            name: "Беспонтовый пирожок",
            author: "Гражданская оборона",
            path: "pie",
            format: "mp3",
            image: "grob"
        ),
        Sound(
            id: 1,

            name: "Если бы на Марсе",
            author: "Браво",
            path: "mars",
            format: "mp3",
            image: "bravo"
        )
    ]

    @IBOutlet var firstSoundImage: UIImageView!
    @IBOutlet var firstSoundNameLabel: UILabel!
    @IBOutlet var firstSoundAuthorLabel: UILabel!
    @IBOutlet var firstSoundDurationLabel: UILabel!

    @IBOutlet var secondSoundImage: UIImageView!
    @IBOutlet var secondSoundNameLabel: UILabel!
    @IBOutlet var secondSoundAuthorLabel: UILabel!
    @IBOutlet var secondSoundDurationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlaylist()
    }

    /// Метод, оформляющий вью
    func setupPlaylist() {
        firstSoundImage.image = UIImage(named: sounds[0].image)
        firstSoundNameLabel.text = sounds[0].name
        firstSoundAuthorLabel.text = sounds[0].author
        firstSoundDurationLabel.text = "04:12"

        secondSoundImage.image = UIImage(named: sounds[1].image)
        secondSoundNameLabel.text = sounds[1].name
        secondSoundAuthorLabel.text = sounds[1].author
        secondSoundDurationLabel.text = "03:35"
    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }
}
