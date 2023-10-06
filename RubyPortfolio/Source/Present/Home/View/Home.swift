//
//  Home.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var onToolBarTrigger: Bool = false
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            switch onToolBarTrigger {
            case false:
                Button {
                    onToolBarTrigger.toggle()
                } label: {
                    contentView
                }
                
            case true:
                Button {
                    onToolBarTrigger.toggle()
                } label: {
                    contentView
                }
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        DarkGrayRoundButton(buttonTitle: "작품 소개")
                        
                        Spacer()

                        DarkGrayRoundButton(buttonTitle: "작가 소개")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case let .works(works):
            
            ZStack {
                Image(works[viewModel.activeCard].image)
                
                HStack {
                    VStack(spacing: 8) {
                        
                        getWorkCellButtonTap(works: works)
                    } // VStack
                    .frame(height: 350, alignment: .top)
                }
            }
        }
    }
    
    @ViewBuilder
    private var titleText: some View {
        switch viewModel.state {
        case let .works(works):
            Text(works[viewModel.activeCard].title)
        }
    }
}

extension Home {
    @ViewBuilder
    private func getWorkCellButtonTap(works: [Work]) -> some View {
        
        NavigationLink(destination: WorkDetail(viewModel: WorkDetailViewModel(externalData: WorkDetailData.ExternalData(work: works[viewModel.activeCard])))) {
            SnapCarousel(works: works)
                .environmentObject(viewModel.stateModel)
                .font(.system(size: 22))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home.build(data: .init(work: [
            Work(id: 0, title: "작품1", subTitle: "첫작품", image: "main1", fontColor: .white),
            Work(id: 1, title: "작품2", subTitle: "시리즈작품2", image: "main2", fontColor: .white),
            Work(id: 2, title: "작품3", subTitle: "시리즈작품3", image: "main3", fontColor: .white),
            Work(id: 3, title: "작품4", subTitle: "이것도작품", image: "main4", fontColor: .white),
            Work(id: 4, title: "작품5", subTitle: "뉴작품", image: "main5", fontColor: .white),
            Work(id: 5, title: "작품6", subTitle: "대단한작품", image: "main6", fontColor: .white),
            Work(id: 6, title: "작품7", subTitle: "완벽한작품", image: "main7", fontColor: .white),
            Work(id: 7, title: "작품8", subTitle: "굳작품", image: "main8", fontColor: .black)
        ]))
    }
}
