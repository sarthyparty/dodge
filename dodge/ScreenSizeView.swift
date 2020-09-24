//
//  ScreenSizeView.swift
//  dodge
//
//  Created by 64000774 on 9/24/20.
//  Copyright © 2020 64000774. All rights reserved.
//

var screenSize: CGRect = UIScreen.main.bounds

var width = screenSize.width
var height = screenSize.height

import SwiftUI

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        return SizeView()
    }
}

struct SizeView: View {
    var body: some View {
        HStack {
            Text(width.description)
        }
    }
}
