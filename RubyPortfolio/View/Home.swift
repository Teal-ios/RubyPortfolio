//
//  Home.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = HomeViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Active card is \(viewModel.activeCard)")
                .font(.system(size: 22))
            
            SnapCarousel()
                .environmentObject(viewModel.stateModel)
        } // VStack
        .frame(height: 350, alignment: .center)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
