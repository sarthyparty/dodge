//
//  MapView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI

var spots = [width/18.75,width/6.8181818,width/4.16666667,width/3,width/2.34375,width/1.923077,width/1.63043,width/1.4151,width/1.25,width/1.119403,width/1.0135]


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
        CGRect(x: CGFloat(mover.x_off)+(width/1.5957), y: height/1.51591, width: width/9.375, height: height/6.67)
    }
    
    var dim: CGRect {
        CGRect(x: CGFloat(self.x + width/8.333333), y: CGFloat(Double(self.y) + Double(mover.dropped)), width: width/8.333333, height: height/16.675)
    }
    
    var view: some View {
        if dim.intersects(rect) {
            self.mover.gameTimer?.invalidate()
        }
        return Image("spikeball").resizable()
            .frame(width: width/8.3333333333, height: height/14.8222222222)
            .position(x: CGFloat(self.x), y: CGFloat(Double(self.y) + Double(mover.dropped)))
        
    }

}

struct SpikeLayer: View{
    
    @ObservedObject var mover: movement
    var num: CGFloat
    var spots: [CGFloat]
    var body: some View {
        ZStack {
            SpikeBall(x: spots[0], y:-height/6.67, mover: self.mover).view
            SpikeBall(x: spots[1], y:-height/6.67, mover: self.mover).view
            if self.num == 3 {
                SpikeBall(x: spots[2], y:-height/6.67, mover: self.mover).view
            } else if self.num == 4 {
                SpikeBall(x: spots[2], y:-height/6.67, mover: self.mover).view
                SpikeBall(x: spots[3], y:-height/6.67, mover: self.mover).view

            } else if self.num == 5 {
                SpikeBall(x: spots[2], y:-height/6.67, mover: self.mover).view
                SpikeBall(x: spots[3], y:-height/6.67, mover: self.mover).view
                SpikeBall(x: spots[4], y:-height/6.67, mover: self.mover).view
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
        return SpikeLayer(mover: mover, num: CGFloat(num), spots: spotslist)
    }
}

