//
//  TimerViews.swift
//  Study Music
//
//  Created by Amelia Citra on 01/11/23.
//

import SwiftUI

struct TimerViews: View {
    @ObservedObject var viewModel = TimerViewModel()
    @ObservedObject var audioManager = AudioPlayerModel()
    
    var body: some View {
        VStack {
            
            HStack {
                Text(String(format: "%02d:%02d:%02d", viewModel.hours, viewModel.minutes, viewModel.seconds))
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                    .padding()
            }
            
            if viewModel.isPickerVisible {
                HStack {
                    Picker("Hours", selection: $viewModel.hours) {
                        ForEach(0..<24, id: \.self) { hour in
                            Text("\(hour)")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())                    
                    
                    Picker("Minutes", selection: $viewModel.minutes) {
                        ForEach(0..<60, id: \.self) { minute in
                            Text("\(minute)")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                    
                    
                    Picker("Seconds", selection: $viewModel.seconds) {
                        ForEach(0..<60, id: \.self) { second in
                            Text("\(second)")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                    
                }
                .padding()
            }
            
            HStack {
                Button(viewModel.isRunning ? "Pause" : "Start") {
                    if viewModel.isRunning {
                        viewModel.pauseTimer()
                    } else {
                        viewModel.startTimer()
                        viewModel.isPickerVisible = false
                    }
                }
                Button("Reset") {
                    viewModel.resetTimer()
                    viewModel.isPickerVisible = true
                    viewModel.hours = 0
                    viewModel.minutes = 0
                    viewModel.seconds = 0
                }
                .disabled(!viewModel.isRunning)
            }
        }
    }
}

struct TimerViews_Previews: PreviewProvider {
    static var previews: some View {
        TimerViews()
    }
}

