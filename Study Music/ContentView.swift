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
                    
                    VStack(alignment: .center) {
                        Text("Set the timer!")
                            .font(.largeTitle)
                            .bold()
                        Text("make at maximum 25 minutes to keep you focusing in studies!")
                        
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
