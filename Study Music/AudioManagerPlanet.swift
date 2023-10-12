//
//  AudioManager.swift
//  Study Music
//
//  Created by Amelia Citra on 12/09/23.
//

import AVFoundation

struct Song: Identifiable {
    let id = UUID()
    let songName: String
    let composer: String
    let audioFileName: String
    let image: String
    let copyrightInfo: String
}

class AudioManagerPlanet: NSObject, ObservableObject, AVAudioPlayerDelegate {
    //    static let shared = AudioManager()
    private var currentIndex = 0
    @Published var audioPlayer : AVAudioPlayer?
    @Published var isPlaying = true
    @Published var currentTime: TimeInterval = 0
    @Published var songs: [Song] = [
        Song(songName: "Signal to Noise", composer: "Scott Buckley", audioFileName: "Signal to Noise.mp3", image: "1", copyrightInfo: "www.scottbuckley.com.au Music promoted by https://www.chosic.com/free-music/all/ Creative Commons CC BY 4.0 https://creativecommons.org/licenses/by/4.0/ Image: https://www.pxfuel.com/"),
        Song(songName: "Arnor", composer: "Alex Productions", audioFileName: "Arnor.mp3", image: "2", copyrightInfo: "https://onsound.eu/ Music promoted by https://www.chosic.com/free-music/all/ Creative Commons CC BY 3.0 https://creativecommons.org/licenses/by/3.0/ Image: https://www.pxfuel.com/"),
        Song(songName: "Art of Silence", composer: "Uniq", audioFileName: "Art of Silence.mp3", image: "3", copyrightInfo: "https://soundcloud.com/uniqofficial/ Attribution 4.0 International (CC BY 4.0) https://creativecommons.org/licenses/by/4.0/ Music promoted by https://www.chosic.com/free-music/all/ Image: https://www.pxfuel.com/"),
        Song(songName: "Canon in D Major", composer: "Kevin MacLeod", audioFileName: "Canon in D Major.mp3", image:"4", copyrightInfo: "Licensed under Creative Commons: By Attribution 3.0 License http://creativecommons.org/licenses/by/3.0/ Music promoted by https://www.chosic.com/free-music/all/ Image: https://www.pxfuel.com/"),
        Song(songName: "Downtown Glow", composer: "Ghostrifter & Devyzed", audioFileName: "Downtown Glow.mp3", image: "5", copyrightInfo: "Creative Commons — Attribution-NoDerivs 3.0 Unported — CC BY-ND 3.0 Music promoted by https://www.chosic.com/free-music/all/ Image: https://www.pxfuel.com/"),
        Song(songName: "Embrace", composer: "Sappheiros", audioFileName: "Embrace.mp3", image: "6", copyrightInfo: "https://soundcloud.com/sappheirosmusicMusic promoted on https://www.chosic.com/free-music/all/ Creative Commons Attribution 3.0 Unported (CC BY 3.0) https://creativecommons.org/licenses/by/3.0/ Image: https://www.pxfuel.com/"),
        Song(songName: "Journey End", composer: "Purrple Cat", audioFileName: "Journey End.mp3", image: "7", copyrightInfo: "https://purrplecat.com/ Music promoted by https://www.chosic.com/free-music/all/ Creative Commons CC BY-SA 3.0 https://creativecommons.org/licenses/by-sa/3.0/ Image: https://www.pxfuel.com/"),
        Song(songName: "Memories of Spring", composer: "Tokyo Music Walker", audioFileName: "Memories of Spring.mp3", image: "8", copyrightInfo: "https://soundcloud.com/user-356546060 Music promoted by https://www.chosic.com/free-music/all/ Creative Commons CC BY 3.0 https://creativecommons.org/licenses/by/3.0/  Image: https://www.pxfuel.com/"),
        Song(songName: "Soon We'll Fly", composer: "Ghostrifter Official", audioFileName: "The Logo.mp3", image: "9", copyrightInfo: "https://soundcloud.com/ghostrifter-official Creative Commons — Attribution-NoDerivs 3.0 Unported — CC BY-ND 3.0 Music promoted by https://www.chosic.com/free-music/all/ Image: https://www.pxfuel.com/"),
    ]
    
    @Published var currentSong: Song?
    
    override init() {
        super .init()
        currentSong = self.songs.first
        setupAudio()
    }
    
    func setupAudio() {
        guard let currentSong = currentSong else { return }
        if let audioPlayer = audioPlayer {
            audioPlayer.stop()
            audioPlayer.delegate = nil
        }
        if let audioFileURL = Bundle.main.url(forResource: currentSong.audioFileName, withExtension: nil) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
                audioPlayer?.delegate = self
                audioPlayer?.play()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func playNextSong() {
        currentIndex += 1
        if currentIndex >= songs.count {
            currentSong = songs[0]
            stopAudio()
        } else {
            currentSong = songs[currentIndex]
            setupAudio()
        }
    }
    
    func stopAudio() {
        audioPlayer?.stop()
        isPlaying = false
    }
    
    func playPrevSong() {
        currentIndex -= 1
        if currentIndex < 0 {
            currentIndex = songs.count - 1
        }
        currentSong = songs[currentIndex]
        setupAudio()
    }
    
    func playAudio() {
        audioPlayer?.play()
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
    }
    
    func formatTime(_ timeInterval: TimeInterval) -> String {
        let minutes = Int(timeInterval / 60)
        let seconds = Int(timeInterval.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d: %02d", minutes, seconds)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self, self.isPlaying else { return }
            self.currentTime = self.audioPlayer?.currentTime ?? 0
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = true
        currentTime = 0
        playNextSong()
    }
}
