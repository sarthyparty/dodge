//
//  GameView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            MapView()
            CharacterView(x_off: 0)
            ButtonView()
            
        }
    }
}

struct ButtonView: View {
    var body: some View {
        ZStack {
            Button(action: {
            }) {
                Text("Left")
            }
            .position(x: 50, y: 600)
            
            Button(action: {
            }) {
                Text("Right")
            }
            .position(x: 320, y: 600)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
