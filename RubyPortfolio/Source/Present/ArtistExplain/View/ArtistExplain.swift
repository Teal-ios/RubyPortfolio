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

    var backButton : some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") 
                    .aspectRatio(contentMode: .fit)
                    .tint(.white)
            }
        }
    }
    
    @ViewBuilder
    var body: some View {
        
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}
