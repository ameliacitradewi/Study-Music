//
//  TimerViews.swift
//  Study Music
//
//  Created by Amelia Citra on 01/11/23.
//

import SwiftUI

struct CountdownTimerView: View {
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var isPickerVisible = true
    
    var body: some View {
        VStack {
            
            HStack {
                Text(String(format: "%02d:%02d:%02d", hours, minutes, seconds))
                    .font(.system(size: 50, weight: .medium, design: .rounded))
                    .padding()
            }
            
            if isPickerVisible {
                HStack {
                    Picker("Hours", selection: $hours) {
                        ForEach(0..<24, id: \.self) { hour in
                            Text("\(hour)")
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                    
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0..<60, id: \.self) { minute in
                            Text("\(minute)")
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                    
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0..<60, id: \.self) { second in
                            Text("\(second)")
                        }
                    }
                    .frame(width: 100)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())
                }
                .padding()
            }
            
            HStack {
                Button(isRunning ? "Pause" : "Start") {
                    if isRunning {
                        pauseTimer()
                    } else {
                        startTimer()
                        isPickerVisible = false
                    }
                }
                Button("Reset") {
                    resetTimer()
                    isPickerVisible = true
                    hours = 0
                    minutes = 0
                    seconds = 0
                }
                .disabled(!isRunning)
            }
        }
    }
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if hours == 0, minutes == 0, seconds == 0 {
                resetTimer()
            } else {
                if seconds > 0 {
                    seconds -= 1
                } else if minutes > 0 {
                    minutes -= 1
                    seconds = 59
                } else if hours > 0 {
                    hours -= 1
                    minutes = 59
                    seconds = 59
                }
            }
        }
    }
    
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    func resetTimer() {
        isRunning = false
        timer?.invalidate()
        isPickerVisible = true
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView()
    }
}

