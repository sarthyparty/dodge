//
//  GameView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI



private var X_off = 0

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
            ButtonRelease(x_pos: 50, y_pos: 600, dx: 5)
            
            Button(action: {
            }) {
                Text("Right")
            }
            .position(x: 320, y: 600)
        }
    }
}

final class movement {
    @objc func move(x_off: Int) {
        X_off += x_off
    }
}

struct ButtonRelease: View {
    
    
    @State private var pressed = false
    
    @State var gameTimer: Timer?
    
    var x_pos: Int
    
    var y_pos: Int
    
    var dx: Int
    
    
    
    @State var text1 = Text("Released")
    
    
    var body: some View {
       
        return Button(action: {
        }) {
            text1
        }
        .position(x: CGFloat(x_pos), y: CGFloat(y_pos))
//            .foregroundColor(.white)
//            .padding(15)
//            .compositingGroup()
//            .shadow(color: .black, radius: 3)
//            .opacity(self.pressed ? 0.5 : 1.0)
//            .scaleEffect(self.pressed ? 0.8 : 1.0)
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: .infinity, pressing: { pressing in
                self.pressed = pressing
                let Move = movement.move(x_off: dx)
                if pressing {
                    self.gameTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(Move.move(x_off: self.dx)), userInfo: nil, repeats: true)
                } else {
                    self.text1 = Text("Released")
                }
            }, perform: { })
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
