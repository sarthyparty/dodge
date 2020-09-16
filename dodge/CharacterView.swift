//
//  CharacterView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        VStack {
            Image("character")
                .resizable()
                .frame(width: 166, height: 150)
                .animation(.default)
        }
    }
}


func animatedImages(for name: String) -> [UIImage] {
    
    var i = 0
    var images = [UIImage]()
    
    while let image = UIImage(named: "\(name)/\(i)") {
        images.append(image)
        i += 1
    }
    return images
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
