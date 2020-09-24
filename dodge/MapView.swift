//
//  MapView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI

var spots = [20.0,55.0,90.0,125.0,160.0,195.0,230.0,265.0,300.0,335.0,370.0]


struct MapView: View {
    @State var newLayer = false
    @ObservedObject var mover: movement
    var body: some View {
        ZStack {
            mover.layer
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        return MapView(mover: movement())
    }
}

struct SpikeBall: Identifiable {
    
    @State var isAnimating = false
    var id = UUID()
    var x: CGFloat
    var y: CGFloat
    @ObservedObject var mover: movement
    var rect: CGRect {
        CGRect(x: mover.x_off+235, y: 460, width: 40, height: 100)
    }
    
    var dim: CGRect {
        CGRect(x: CGFloat(self.x + 45), y: CGFloat(Double(self.y) + Double(mover.dropped)), width: 45, height: 40)
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

struct SpikeLayer: View{
    
    @ObservedObject var mover: movement
    var num: Int
    var spots: [CGFloat]
    var body: some View {
        ZStack {
            SpikeBall(x: spots[0], y:-100, mover: self.mover).view
            SpikeBall(x: spots[1], y:-100, mover: self.mover).view
            if self.num == 3 {
                SpikeBall(x: spots[2], y:-100, mover: self.mover).view
            } else if self.num == 4 {
                SpikeBall(x: spots[2], y:-100, mover: self.mover).view
                SpikeBall(x: spots[3], y:-100, mover: self.mover).view

            } else if self.num == 5 {
                SpikeBall(x: spots[2], y:-100, mover: self.mover).view
                SpikeBall(x: spots[3], y:-100, mover: self.mover).view
                SpikeBall(x: spots[4], y:-100, mover: self.mover).view
            }
        }
        
    }
    
}

class GenLayer {
    
    func generate(mover: movement) -> SpikeLayer {
        let num = Int.random(in: 2..<6)
        var spotslist = [CGFloat]()
        for _ in 1...num {
            spotslist.append(CGFloat(spots[Int.random(in: 0..<11)]))
        }
        return SpikeLayer(mover: mover, num: num, spots: spotslist)
    }
}

