//
//  MusicMediaPlayer.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 7/03/24.
//

import AVFoundation
import Combine
import Foundation

class MusicMediaPlayer {
    private var avPlayer: AVPlayer
    private var timeObserverToken: Any?
    let NSEC_PER_SEC = 2400

    var currentProgressPublisher: PassthroughSubject<Float, Never> = .init()
    var currentTimeInSecondsPublisher: PassthroughSubject<Double, Never> = .init()

    init() {
//        let url1 = URL(string: "http://codeskulptor-demos.commondatastorage.googleapis.com/descent/background%20music.mp3")
        let url2 = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
        let playerItem: AVPlayerItem = AVPlayerItem(url: url2!)
//        avPlayer = AVPlayer(playerItem: playerItem)
        avPlayer = AVPlayer(url: url2!)
        addPeriodicObserver(for: avPlayer)
    }

    // make sure I need to remove observer:
    deinit {
        removePeriodicObserver()
    }

    var isPlaying: Bool {
        avPlayer.rate != 0
    }

    private var duration: Double {
        avPlayer.currentItem?.duration.seconds ?? 0
    }

    private func addPeriodicObserver(for player: AVPlayer) {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)

        timeObserverToken = player.addPeriodicTimeObserver(forInterval: time, queue: .main, using: { [weak self] time in
            guard let self = self else { return }
            let progress = calculateProgress(currentTime: time.seconds)
            currentProgressPublisher.send(progress)
            currentTimeInSecondsPublisher.send(time.seconds)
        })
    }

    private func calculateProgress(currentTime: Double) -> Float {
        Float(currentTime / duration)
    }

    private func removePeriodicObserver() {
        if let nonNullTimeObserverToken = timeObserverToken {
            avPlayer.removeTimeObserver(nonNullTimeObserverToken)
            timeObserverToken = nil
        }
    }

    func play() {
        avPlayer.play()
    }

    func pause() {
        guard isPlaying else {
            return print("Attempting to pause while not playing.")
        }
        avPlayer.pause()
    }

    func seek(to time: CMTime) {
        avPlayer.seek(to: time)
    }

    func seek(to percetange: Float) {
        let time = convertFloatToCMTime(percetange)
        avPlayer.seek(to: time)
    }

    private func convertFloatToCMTime(_ percentage: Float) -> CMTime {
        CMTime(seconds: duration * Double(percentage), preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    }

    // func for rewind song time
    func rewindTime(to seconds: Double) {
        let timeCM = CMTime(seconds: seconds, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        seek(to: timeCM)
    }
}
