//
//  ContentView.swift
//  Study Music
//
//  Created by Amelia Citra on 12/09/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var hours = Array(0...23)
    var minutes = Array(0...59)
    var seconds = Array(0...59)
    @State private var selectedHours = 0
    @State private var selectedMins = 0
    @State private var selectedSecs = 5
    @State private var isRunning = false
    @State private var isPickerVisible = true
    @State private var timer: Timer?
    @State private var audioPlayer = AudioPlayerModel()
    
    var body: some View {
        
        ZStack {
            //MARK: add background
            Image("BgColor")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if isPickerVisible {
                    HStack {
                        Picker("Hour", selection: self.$selectedHours) {
                            ForEach(0..<24) {
                                Text("\(self.hours[$0]) hour")
                            }
                        }
                        
                        Picker("Min", selection: self.$selectedMins) {
                            ForEach(0..<60) {
                                Text("\(self.minutes[$0]) min")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Picker("Sec", selection: self.$selectedSecs) {
                            ForEach(0..<60) {
                                Text("\(self.seconds[$0]) sec")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .accentColor(.white)
                }
                
                //MARK: Timer countdown preview
                HStack {
                    Text(String(format: "%02d:%02d:%02d", calculate()/3600, (calculate()/60)%60, calculate()%60))
                        .font(.system(size: 50, weight: .medium, design: .rounded))
                        .padding()
                }
                
                //MARK: Button start or restart timer
                HStack {
                    Button(isRunning ? "Pause" : "Start") {
                        if isRunning {
                            pause()
                            audioPlayer.pauseAudio()
                        } else {
                            start()
                            isPickerVisible = false
                            audioPlayer.playAudio()
                        }
                    }
                    
                    Button {
                        restart()
                        audioPlayer.setupAudio()
                    } label: {
                        Text("Restart")
                    }
                }
            }
            .foregroundColor(.white)
        }
        
    }
    
    //MARK: Function for timer
    func calculate() -> Int {
        let totalsecs = selectedSecs + selectedMins*60 + selectedHours*3600
        return totalsecs
    }
    
    func restart() {
        timer?.invalidate()
        isRunning = false
        isPickerVisible = true
        selectedHours = 0
        selectedMins = 0
        selectedSecs = 0
        audioPlayer.pauseAudio()
    }
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            selectedSecs -= 1
            
            if calculate() <= 0 {
                restart()
            }
        }
    }
    
    func pause() {
        isRunning = false
        timer?.invalidate()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

