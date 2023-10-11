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
            LinearGradient(gradient: Gradient(colors: [Color.rubyWhite, colorSetting()]),
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
                TabView {
                    ForEach(0..<work.seriesCount) { i in
                        Image(uiImage: returnToWorksSeries(id: work.id)[i])
                            .resizable()
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .cornerRadius(8)
                            .shadow(color: Color.gray, radius: 4, x: 0, y: 4)
                    }
                }
                .frame(width: UIScreen.screenWidth - 40, height: UIScreen.screenWidth - 40)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                
                
                Text(work.title)
                    .foregroundColor(Color.rubyWhite)
                    .bold()
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding(.bottom, 20.0)
                
                Text(work.subTitle)
                    .foregroundColor(Color.rubyWhite)
                    .font(.title3)
                    .multilineTextAlignment(.center)

            }
        }
    }
    
    private func returnToWorksSeries(id: Int) -> [UIImage] {
        var worksSeries: [UIImage] = []
        
        switch id {
        case 0:
            for ele in WorksSeries.one.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 1:
            for ele in WorksSeries.two.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 2:
            for ele in WorksSeries.three.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 3:
            for ele in WorksSeries.four.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 4:
            for ele in WorksSeries.five.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 5:
            for ele in WorksSeries.six.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 6:
            for ele in WorksSeries.seven.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 7:
            for ele in WorksSeries.eight.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        case 8:
            for ele in WorksSeries.nine.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        default:
            for ele in WorksSeries.one.worksSeries {
                worksSeries.append(ele ?? UIImage())
            }
        }
        return worksSeries
    }
}

extension WorkDetail {
    private func colorSetting() -> Color {
        switch viewModel.state {
        case let .work(work):
            switch work.workColor {
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

struct WorkDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetail.build(data: .init(work: Work(id: 0, title: "작품1", subTitle: "첫작품", image: "main1", workColor: .white, seriesCount: 1)))
    }
}
