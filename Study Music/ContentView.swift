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
        NavigationView {
            GeometryReader { geometry in
                Image("BgColor")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        
                        VStack {
                            Text("Set up your timer!")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            
                            TimerViews()
                        }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .foregroundColor(.white)
                    )
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
