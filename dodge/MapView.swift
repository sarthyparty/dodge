//
//  MapView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI


struct MapView: View {
    @ObservedObject var mover: movement
    
    
    var body: some View {
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
        return MapView(mover: movement())
    }
}

struct SpikeBall: Identifiable {
    
    var id = UUID()
    var x: Int
    var y: Int
    @ObservedObject var mover: movement
    var rect: CGRect {
        CGRect(x: mover.x_off+235, y: 460, width: 50, height: 100)
    }
    
    var dim: CGRect {
        CGRect(x: CGFloat(self.x + 45), y: CGFloat(Double(self.y) + Double(mover.dropped)), width: 45, height: 45)
    }
    
    var view: some View {
        if dim.intersects(rect) {
            self.mover.gameTimer?.invalidate()
        }
        return Image("spikeball").resizable()
        .frame(width: 45, height: 45)
            .position(x: CGFloat(self.x), y: CGFloat(Double(self.y) + Double(mover.dropped)))
    }
}


