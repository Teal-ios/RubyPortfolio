//
//  ArtistExplainDetailView.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/07.
//

import SwiftUI

struct ArtistExplainDetailView: View {
    var body: some View {
        ZStack {
            Image("backgroundCut")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("0. 프로필")
                    .resizable()
                    .frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenWidth / 2)
                    .cornerRadius(UIScreen.screenWidth / 2)
                
                Text("이현화 작가")
                    .font(.title)
                    .foregroundColor(.rubyWhite)
                
                Text("\n태피스트리(Tapestry), 자수(Embroidery)와 같은 섬유 예술을 기반으로 인간 내면을 탐구하고 인지하며 진솔하게 시각적으로 표현합니다. \n\n 주요 작업은 전통적인 태피스트리의 고블랭직(Gobelin)으로, 긴장시켜 놓은 날실에 평직으로 씨실을 정교하게 짜넣어 마치 회화처럼 보이게 직물을 제작할 수 있는 기법을 사용합니다. 이러한 전통적인 태피스트리 기법을 활용하되, 인간 내면의 가장 깊은 부분을 꺼내어 날 것의 모습으로 드러내고 썼다 지웠다 하는 행위의 흔적을 시각적으로 나타냅니다. \n\n 작업을 통해 스스로에 대한 내면의 사유의 시간을 갖고 비워내는 과정을 거쳐 끝내 사라지는 숭고한 경험을 하게 되며, 내면의 가장 깊숙한 인간의 삶에 대한 이야기를 씨실과 날실로 엮어 진솔하게 풀어내고자 합니다. \n현재 서울문화재단 신당창작아케이드 13-14기 레지던시 입주작가로 활동하며 공예와 조형예술 활동을 활발히 하고 있습니다.")
                    .foregroundColor(.rubyWhite)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
