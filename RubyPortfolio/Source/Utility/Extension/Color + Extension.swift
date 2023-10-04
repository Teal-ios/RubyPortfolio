//
//  Color + Extension.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(a) / 255.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
    }
}

extension UIColor {
    /// Black
    static let black100 = UIColor.makeColor(from: "#0F0F0F")
    static let white100 = UIColor.makeColor(from: "#FFFFFF")
    static let darkGray = UIColor.makeColor(from: "#3F3F3F")

}

extension UIColor {
    /// hex sting -> UIColor
    static func makeColor(from hex: String) -> UIColor {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >>  8) & 0xFF) / 255.0
        let blue = Double((rgb >>  0) & 0xFF) / 255.0
        
        return .init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension Color {
    static let rubyWhite = Color(uiColor: UIColor.white100)
    static let rubyBlack = Color(uiColor: UIColor.black100)
    static let darkGray = Color(uiColor: UIColor.darkGray)
}
