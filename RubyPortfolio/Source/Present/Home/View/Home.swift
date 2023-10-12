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
    @State var presentSheetAppear: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                        
                        Button {
                            presentSheetAppear = true

                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: 80, height: 40)
                                    .tint(Color.rubyBlack)
                                    .shadow(color: Color.darkGray, radius: 4, x: 2, y: 2)
                                
                                Text("작품 소개")
                                    .foregroundColor(Color.rubyWhite)
                                    .padding(8)

                            }
                        }
                        
                        Spacer()
                        
                        onTapToArtistExplain()
                        
                    }
                }
            }
        }
        .sheet(isPresented: $presentSheetAppear) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.rubyWhite, colorSetting()]),
                               startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .presentationDetents([.medium, .large])
                                
                titleText
                    .bold()
                    .foregroundColor(Color.black)
                    .position(x: UIScreen.screenWidth / 2, y: 40)
                    .multilineTextAlignment(.center)
                
                subtitleText
                    .bold()
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
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
    
    @ViewBuilder
    private var subtitleText: some View {
        switch viewModel.state {
        case let .works(works):
            Text(works[viewModel.activeCard].subTitle)
        }
    }
}

extension Home {
    private func colorSetting() -> Color {
        switch viewModel.state {
        case let .works(work):
            switch work[viewModel.activeCard].workColor {
            case .white:
                return Color.rubyBlack
            case .brown:
                return Color.brown
            case .turquoise:
                return Color.turquoise
            case .yellow:
                return Color.rubyYellow
            default:
                return Color.rubyBlack
            }
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

extension Home {
    @ViewBuilder
    private func onTapToArtistExplain() -> some View {
        
        NavigationLink(destination: ArtistExplain(viewModel: ArtistExplainViewModel())) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 4)
                    .tint(Color.rubyBlack)
                    .shadow(color: Color.darkGray, radius: 4, x: 2, y: 2)

                Image(uiImage: UIImage(named: "sign")!)
                    .resizable()
                    .frame(width: 80, height: 40)

            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home.build(data: .init(work: [
            Work(id: 0, title: "작품1", subTitle: "첫작품", image: "main1", workColor: .white),
            Work(id: 1, title: "작품2", subTitle: "시리즈작품2", image: "main2", workColor: .white),
            Work(id: 2, title: "작품3", subTitle: "시리즈작품3", image: "main3", workColor: .white),
            Work(id: 3, title: "작품4", subTitle: "이것도작품", image: "main4", workColor: .white),
            Work(id: 4, title: "작품5", subTitle: "뉴작품", image: "main5", workColor: .white),
            Work(id: 5, title: "작품6", subTitle: "대단한작품", image: "main6", workColor: .white),
            Work(id: 6, title: "작품7", subTitle: "완벽한작품", image: "main7", workColor: .white),
            Work(id: 7, title: "작품8", subTitle: "굳작품", image: "main8", workColor: .black)
        ]))
    }
}
