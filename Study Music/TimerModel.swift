//
//  TimerModel.swift
//  Study Music
//
//  Created by Amelia Citra on 31/10/23.
//

import Foundation

extension TimerViews {
    final class ViewModel: ObservableObject {
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "25:00"
        @Published var minute: Float = 25 {
            didSet {
                self.time = "\(Int(minute)):00"
            }
        }
        
        private var initialTime = 0
        private var endDate = Date()
        
        func startTimer(minute: Float) {
            self.initialTime = Int(minute)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minute), to: endDate)!
        }
        
        func resetTimer() {
            self.minute = Float(initialTime)
            self.isActive = false
            self.time = "\(Int(minute)):00"
        }
        
        func updateCountdown() {
            guard isActive else { return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00"
                self.showingAlert = true
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minute = calendar.component(.minute, from: date)
            let second = calendar.component(.second, from: date)
            
            self.minute = Float(minute)
            self.time = String(format: "%02d:%02d", minute, second)
        }
    }
}
