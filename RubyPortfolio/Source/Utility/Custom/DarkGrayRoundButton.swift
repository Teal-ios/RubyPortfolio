//
//  DarkGrayRoundButton.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/06.
//

import SwiftUI

struct DarkGrayRoundButton: View {
    let buttonTitle: String
    
    init(buttonTitle: String) {
        self.buttonTitle = buttonTitle
    }
    
    var body: some View {
        Button(buttonTitle) {
            print("Pressed")
        }
        .buttonStyle(.borderedProminent)
        .foregroundColor(Color.rubyWhite)
        .tint(.black)
        .shadow(color: Color.darkGray, radius: 4, x: 2, y: 2)

    }
}

