//
//  MapView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI


struct MapView: View {
    @ObservedObject var mover: ObjectMovement = ObjectMovement()
    
    
    var body: some View {
        mover.createTimer()
        return ZStack {
            SpikeBall(x: 20, y: -100, mover: self.mover).view
            SpikeBall(x: 55, y: -100, mover: self.mover).view
            SpikeBall(x: 90, y: -100, mover: self.mover).view
            SpikeBall(x: 125, y: -100, mover: self.mover).view
            SpikeBall(x: 160, y: -100, mover: self.mover).view
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct SpikeBall: Identifiable {
    
    var id = UUID()
    var x: Int
    var y: Int
    @ObservedObject var mover: ObjectMovement
    
    var view: some View {
        Image("spikeball").resizable()
        .frame(width: 45, height: 45)
            .position(x: CGFloat(x), y: CGFloat(Double(self.y) + mover.moves))
    }
}

class ObjectMovement: ObservableObject {
    @Published var moves: Double = 0
    
    
    var gameTimer: Timer?
    
    @objc func move() {
        
        self.moves += 0.005
    }
    
    func createTimer() {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 0.001,target: self, selector: #selector(move), userInfo: nil, repeats: true)
    }
}

