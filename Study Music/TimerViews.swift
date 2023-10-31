//
//  TimerViews.swift
//  Study Music
//
//  Created by Amelia Citra on 31/10/23.
//

import SwiftUI

struct TimerViews: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        VStack {
            Text("\(vm.time)")
                .font(.system(size: 50, weight: .medium, design: .rounded))
                .alert("Timer done!", isPresented: $vm.showingAlert) {
                    Button("Continue", role: .cancel) {
                        // code
                    }
                }
            
            Slider(value: $vm.minute, in: 1...59, step: 1)
                .frame(width: width)
                .disabled(vm.isActive)
                .animation(.easeInOut, value: vm.minute)
            
            HStack(spacing: 15) {
                Button("Start") {
                    vm.startTimer(minute: vm.minute)
                }
                .disabled(vm.isActive)
                
                Button("Reset", action: vm.resetTimer)
                    .tint(.red)
            }
            .frame(width: width)
            
        }
        .onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

struct TimerViews_Previews: PreviewProvider {
    static var previews: some View {
        TimerViews()
    }
}
