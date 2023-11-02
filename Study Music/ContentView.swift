//
//  ContentView.swift
//  Study Music
//
//  Created by Amelia Citra on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerViewModel = TimerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .center) {
                   
                }
            }
        }
        .foregroundColor(.black)
        .background(Color.black)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
