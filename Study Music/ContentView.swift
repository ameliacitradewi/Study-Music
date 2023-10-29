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
                ZStack {
                    Image("BgColor")
                        .resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("Choose a Playlist")
                            .font(.largeTitle)
                            .bold()
                        Text("Choose the playlist you want to play!")
                        
                    }
                    .foregroundColor(.white)
                }
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
