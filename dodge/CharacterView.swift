//
//  CharacterView.swift
//  dodge
//
//  Created by 64000774 on 9/15/20.
//  Copyright © 2020 64000774. All rights reserved.
//

import SwiftUI


struct ImageAnimated: UIViewRepresentable {
    let imageSize: CGSize
    let imageNames: [String]
    let duration: Double = 0.5

    func makeUIView(context: Self.Context) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0
            , width: imageSize.width, height: imageSize.height))

        let animationImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))

        animationImageView.clipsToBounds = true
        animationImageView.layer.cornerRadius = 5
        animationImageView.autoresizesSubviews = true
        animationImageView.contentMode = UIView.ContentMode.scaleAspectFill

        var images = [UIImage]()
        imageNames.forEach { imageName in
            if let img = UIImage(named: imageName) {
                images.append(img)
            }
        }

        animationImageView.image = UIImage.animatedImage(with: images, duration: duration)

        containerView.addSubview(animationImageView)

        return containerView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<ImageAnimated>) {

    }
}

struct CharacterView: View {
    var x_off: Int
    
    var body: some View {
        VStack (alignment: HorizontalAlignment.center, spacing: 10) {
            ImageAnimated(imageSize: CGSize(width: 50, height: 100), imageNames: ["left1","right1"])
            .frame(width: 150, height: 125, alignment: .center)
        }
        .position(x: CGFloat((width/1.5957) + CGFloat(x_off)), y: (height/1.334))
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(x_off: 0)
    }
}
