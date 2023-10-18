//
//  ArtistExplain.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/07.
//

import SwiftUI

struct ArtistExplain: View {
    
    @ObservedObject var viewModel: ArtistExplainViewModel
    
    init(viewModel: ArtistExplainViewModel) {
        self.viewModel = viewModel
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundCut")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Image("sign")
                    .resizable()
                    .frame(width: 150, height: 75)
                    .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 8)
                
                P183_CircularList()
            }
        }
    }
}
