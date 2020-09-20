//
//  GameView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI


struct GameView: View {
    
    @ObservedObject var mover = movement()
    var body: some View {
        return ZStack {
                Button(action: {
                    self.mover.createTimer()
                }) {
                Text("Start")
                }
                MapView(mover: mover)
                CharacterView(x_off: mover.x_off)
                MoveButton(x_pos: 50, y_pos: 600, dx: -3, text1: Text("Left"), Move: mover)
                
                MoveButton(x_pos: 320, y_pos: 600, dx: 3, text1: Text("Right"), Move: mover)
        }
            
    }
}




class movement: ObservableObject {
    @Published var x_off: Int = 0
    
    @Published var dropped: Int = 0
    
    var gameTimer: Timer?
    
    var dx: Int = 0
    
    @objc func move() {
        
        self.x_off += self.dx
        self.dropped += 4
        
    }
    
    func createTimer() {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
}



struct MoveButton: View {
    
    @State private var pressed = false
    
    @State var gameTimer: Timer?
    
    var x_pos: Int
    
    var y_pos: Int
    
    var dx: Int
    
    var text1 : Text
    
    var Move: movement
    
    
    var body: some View {
        return Button(action: {
        }) {
            text1
        }
        .position(x: CGFloat(x_pos), y: CGFloat(y_pos))
            .foregroundColor(.green)
            .padding(15)
            .compositingGroup()
//            .shadow(color: .black, radius: 3)
//            .opacity(self.pressed ? 0.5 : 1.0)
//            .scaleEffect(self.pressed ? 0.8 : 1.0)
            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: .infinity, pressing: { pressing in
                self.pressed = pressing
                
                if pressing {
                    self.Move.dx = self.dx
                } else {
                    self.Move.dx = 0
                }
            }, perform: { })
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
