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
        game
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
