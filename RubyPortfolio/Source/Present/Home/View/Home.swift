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
        
        ZStack {

            
            Image(viewModel.works[viewModel.activeCard].image)
            HStack {
                VStack(spacing: 8) {
                    Text("\(viewModel.works[viewModel.activeCard].title)")
                        .font(.system(size: 22))
                        .foregroundColor(Color.rubyWhite)
                    Spacer()
                    
                    SnapCarousel(works: viewModel.works)
                        .environmentObject(viewModel.stateModel)
                        .font(.system(size: 22))
                    
                } // VStack
                .frame(height: 350, alignment: .top)
                
                
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
