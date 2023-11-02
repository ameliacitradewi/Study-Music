//
//  TimerViewModel.swift
//  Study Music
//
//  Created by Amelia Citra on 02/11/23.
//

import SwiftUI
import Combine

class TimerViewModel: ObservableObject {
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    @Published var isRunning = false
    var timer: Timer?
    @Published var isPickerVisible = true

    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.hours == 0, self.minutes == 0, self.seconds == 0 {
                self.resetTimer()
            } else {
                if self.seconds > 0 {
                    self.seconds -= 1
                } else if self.minutes > 0 {
                    self.minutes -= 1
                    
                    self.seconds = 59
                } else if self.hours > 0 {
                    self.hours -= 1
                    self.minutes = 59
                    self.seconds = 59
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
        hours = 0
        minutes = 0
        seconds = 0
    }
}
