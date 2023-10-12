//
//  AudioPlayer.swift
//  Study Music
//
//  Created by Amelia Citra on 12/10/23.
//

import SwiftUI
import AVFoundation

struct AudioPlayerPlanet: View {
    @ObservedObject var audioManager = AudioManagerPlanet()
    @State private var showingCredits = false
    
    var body: some View {
        ZStack {
            Image(audioManager.currentSong?.image ?? "1")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        showingCredits = true
                    } label: {
                        Image(systemName: "info.circle")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $showingCredits) {
                        Text(audioManager.currentSong?.copyrightInfo ?? "No Info")
                            .presentationDetents([.fraction(0.12)])
                            .presentationDragIndicator(.visible)
                            .foregroundColor(.black)
                            .font(.caption2)
                            .padding(.top)
                            .padding(.leading)
                            .padding(.trailing)
                    }
                }
                
                Spacer()
                
                HStack (spacing: 20) {
                    Button {
                        audioManager.playPrevSong()
                    } label: {
                        Image(systemName: "backward.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                    }
                    
                    Button {
                        if audioManager.isPlaying {
                            audioManager.audioPlayer?.pause()
                        } else {
                            audioManager.playAudio()
                        }
                        audioManager.isPlaying.toggle()
                    } label: {
                        Image(systemName: audioManager.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                    }
                    .tint(.black)
                    
                    Button {
                        audioManager.playNextSong()
                    } label: {
                        Image(systemName: "forward.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                    }
                }
                
                VStack {
                    Text(audioManager.currentSong?.songName ?? "No Name")
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(audioManager.currentSong?.composer ?? "No Composer")
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom)
                
            }
            .foregroundColor(.white)
        }
    }
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerPlanet()
    }
}
