//
//  ContentView.swift
//  Study Music
//
//  Created by Amelia Citra on 12/09/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    VStack(alignment: .center) {
                        Text("Set the timer!")
                            .font(.largeTitle)
                            .bold()
                        
                        TimerViews()
                    }
                }
                .foregroundColor(.black)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
