//
//  GameView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI
import Foundation



struct GameView: View {
    
    @ObservedObject var mover = movement()
    var body: some View {
        return ZStack {
            Text("Score: " + self.mover.score.description)
                .position(x: width/2, y: height/26.68)
                MapView(mover: mover)
                CharacterView(x_off: mover.x_off)
            MoveButton(x_pos: (width/7.5), y_pos: (height/1.11167), dx: -(width/125), text1: Text("Left"), Move: mover)
                
            MoveButton(x_pos: (width/1.171875), y_pos: (height/1.11167), dx: (width/125), text1: Text("Right"), Move: mover)
        }
            
    }
}




class movement: ObservableObject {
    @Published var x_off: CGFloat = 0
    
    @Published var dropped: CGFloat = 0
    
    var gameTimer: Timer?
    
    var dx: CGFloat = 0
    
    var layer: SpikeLayer? = nil
    
    var score = 0
    
    @objc func move() {
        
        self.x_off += self.dx
        self.dropped += (height/166.75)
        if self.x_off >= (width / 2.3) {
            self.x_off -= self.dx
        }
        if self.x_off <= (width / -2.2) {
            self.x_off -= self.dx
        }
        if dropped >= (height/0.83375) {
            let gen = GenLayer()
            self.layer = gen.generate(mover: self)
            self.dropped = (height/166.75)
        }
        self.score += 1
        
    }
    
    func createTimer() {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
    
    func reset() {
        self.x_off = 0
        self.dropped = 0
        self.gameTimer?.invalidate()
        self.layer = nil
        self.score = 0
    }
}



struct MoveButton: View {
    
    @State private var pressed = false
    
    @State var gameTimer: Timer?
    
    var x_pos: CGFloat
    
    var y_pos: CGFloat
    
    var dx: CGFloat
    
    var text1 : Text
    
    var Move: movement
    
    
    var body: some View {
        return Button(action: {
        }) {
            VStack{
                HStack{
                    text1
                }  
            }
        }
        .position(x: CGFloat(x_pos), y: CGFloat(y_pos))
            .buttonStyle(ButtonStyle1())
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
