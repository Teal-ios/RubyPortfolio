//
//  Image + Extension.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/13.
//

import SwiftUI

extension View {
    func resize(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return renderImage
    }
}
