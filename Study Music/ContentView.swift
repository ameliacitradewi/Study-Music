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
                    Image("BgColorDummy")
                        .resizable()
                        .aspectRatio(geometry.size, contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Text("Choose a Playlist")
                            .font(.largeTitle)
                            .bold()
                        Text("")
                        
                        HStack {
                            VStack {
                                NavigationLink {
                                    AudioPlayerPlanet()
                                } label: {
                                    Image("3a")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(20)
                                        .frame(width: .infinity, alignment: .center)
                                        .shadow(radius: 10)
                                }
                                Text("Solar Sounds")
                                    .font(.subheadline)
                                    .bold()
                                Text("45 minutes")
                                    .font(.caption)
                                
                            }
                            VStack {
                                Image("9a")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(20)
                                    .frame(width: .infinity, alignment: .center)
                                    .shadow(radius: 10)
                                Text("Nature Sounds")
                                    .font(.subheadline)
                                    .bold()
                                Text("90 minutes")
                                    .font(.caption)
                            }
                        }
                        .padding()
                        
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
