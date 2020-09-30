//
//  ContentView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI

var game = GameView()

struct ContentView: View {
    @State var playing = false
    var body: some View {
        ZStack {
            if self.playing {
                game
                Button(action: {
                    self.playing = false
                    game.mover.reset()
                }) {
                Text("MENU")
                }
                .position(x: width/1.15384, y: height/26.68)
                .buttonStyle(ButtonStyle1())
            } else {
                Button(action: {
                    self.playing = true
                    game.mover.createTimer()
                }) {
                Text("PLAY")
                }
                .buttonStyle(ButtonStyle1())

            }
        }
    }
}
struct ButtonStyle1: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .scaleEffect(0.9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
