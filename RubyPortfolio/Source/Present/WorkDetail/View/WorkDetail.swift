//
//  WorkDetail.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

struct WorkDetail: View {
    
    @ObservedObject var viewModel: WorkDetailViewModel
    
    init(viewModel: WorkDetailViewModel) {
        self.viewModel = viewModel
    }
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View {  // <-- 👀 커스텀 버튼
        Button{
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left") // 화살표 Image
                    .aspectRatio(contentMode: .fit)
                    .tint(.white)
            }
        }
    }
    
    @ViewBuilder
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.rubyWhite, Color.rubyBlack]),
                            startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                topContentView
                
                Spacer()

            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
        
    
    @ViewBuilder
    private var topContentView: some View {
        switch viewModel.state {
        case let .work(work):
            VStack {
                Image(work.image)
                    .resizable()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40)
                
                Text(work.title)
                    .foregroundColor(Color.rubyWhite)

                Text(work.subTitle)
                    .foregroundColor(Color.rubyWhite)
            }
        }
    }
}

struct WorkDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetail.build(data: .init(work: Work(id: 0, title: "작품1", subTitle: "첫작품", image: "main1", fontColor: .white)))
    }
}
