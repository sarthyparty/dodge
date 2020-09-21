//
//  ContentView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var playing = false
    var body: some View {
        ZStack {
            if self.playing {
                GameView()
                Button(action: {
                    self.playing = false
                }) {
                Text("MENU")
                }
                    .position(x: 325, y: 25)
            } else {
                Button(action: {
                    self.playing = true
                }) {
                Text("PLAY")
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
