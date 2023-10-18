//
//  Home.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var onToolBarTrigger: Bool = false
    @State var presentSheetAppear: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var UIState: UIStateModel
    @GestureState var isDetectingLongPress = false
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    // MARK: - Body
    
    let spacing: CGFloat = 16
    let widthOfHiddenCards: CGFloat = 32
    let cardHeight: CGFloat = 279
    
    let cardWidth = UIScreen.main.bounds.width - (32 * 2) - (16 * 2)
    
    
    var body: some View {
        switch viewModel.state {
        case let .works(works):
            ZStack {
                Image(uiImage: UIImage(named: works[viewModel.activeCard].image)!)
                canvas
            }
        }
    }
    
    var canvas: some View {
        switch viewModel.state {
        case let .works(works):
            let totalSpacing = (CGFloat(works.count - 1)) * spacing
            let totalCanvasWidth: CGFloat = (cardWidth * CGFloat(works.count)) + totalSpacing
            let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
            let leftPadding = widthOfHiddenCards + spacing
            let totalMovement = cardWidth + spacing
            let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(viewModel.stateModel.activeCard))
            var calcOffset = Float(activeOffset)
            let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(viewModel.stateModel.activeCard) + 1)
            if (calcOffset != Float(nextOffset)) {
                calcOffset = Float(activeOffset) + viewModel.stateModel.screenDrag
            }
            return Canvas{ HStack(alignment: .center, spacing: spacing) {
                ForEach(works, id: \.id) { work in
                    NavigationLink(
                        destination: {
                            WorkDetail(
                                viewModel: WorkDetailViewModel(
                                    externalData: WorkDetailData.ExternalData(
                                        work: work
                                    )
                                )
                            )
                        },
                        label: {
                            Item(_id: work.id,
                                 spacing: 16,
                                 widthOfHiddenCards: 32,
                                 cardHeight: 279) {
                                
                                VStack {
                                    Image(work.image)
                                        .resizable()
                                }
                            }
                                 .foregroundColor(Color.white)
                                 .background(Color.gray)
                                 .cornerRadius(8)
                                 .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                                 .transition(AnyTransition.slide)
                                 .animation(.spring())
                                 .environmentObject(viewModel.stateModel)
                        }
                    )
                }
            }
            .offset(x: CGFloat(calcOffset), y: 0)
            .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
                DispatchQueue.main.async {
                    viewModel.stateModel.screenDrag = Float(currentState.translation.width)
                }
                
                
            }.onEnded { value in
                viewModel.stateModel.screenDrag = 0
                
                if (value.translation.width < -50) &&  viewModel.stateModel.activeCard < Int(works.count) - 1 {
                    viewModel.stateModel.activeCard = viewModel.stateModel.activeCard + 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
                
                if (value.translation.width > 50) && viewModel.stateModel.activeCard > 0 {
                    viewModel.stateModel.activeCard = viewModel.stateModel.activeCard - 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }
            })
            .transition(AnyTransition.slide)
            .animation(.spring())
            }
        }
    }
    
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
        
        NavigationLink(
            destination: WorkDetail(
                viewModel: WorkDetailViewModel(
                    externalData: WorkDetailData.ExternalData(
                        work: works[viewModel.activeCard]
                    )
                )
            )
        ) {
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
