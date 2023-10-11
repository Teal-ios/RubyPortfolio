//
//  ArtistExplainDetailView.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/07.
//

import SwiftUI

struct DetailArtistInfoView: View {
    var content =
              """
2019 이화여자대학교 조형예술학부 섬유예술과 졸

2022 ~ 23 서울문화재단 신당창작아케이드 13 ~ 14기 입주작가


Exhibitions


2023.09 신당창작아케이드 기획전시 <form and pop> x 신세계 L&B 공예상품개발 프로젝트 결과전시 <Dining and more>, 서울

2023.09 청주국제공예비엔날레 <사물의 지도>, 청주국제공예비엔날레, 청주

2023.05 <태도 : 몰입하는, 비워내는, 사물을 대하는>, Woong 갤러리, 서울

2023.04 ~ 2024.03 <Inside me>, 뚝섬미술관, 서울

2023.03 <지붕없는 건축 – 출입구 (0, 0, 1)>, VA 갤러리, 서울

2022.12 <Empty words>이현화 개인전, 을지로 빈칸, 서울

2022.12 <2022 공예트렌드페어> 브랜드관 <WEAVECERA>, 코엑스, 서울

2022.11 2022 신당창작아케이드 기획전시 <HYBRID: CRAFT_곁에 두고 싶은 공예>, 코사이어티 서울숲, 서울

2022.10 <실온: 감각하는 색과 자신(Thread & Own)>, 서울공예박물관 전시3동 1층&크래프트 윈도우, 서울

2022.06 <Garage sale, party>, LAYER57갤러리, 서울

2021.12 <Temple>, 킵인터치 갤러리, 서울

2021.11 <제 22회 한국공예대전>, 익산 예술의전당, 익산

2020 <KCDF 공예매개인력양성 결과전>, 이유진 갤러리, 서울

2018 <실溫>, 이화여자대학교 조형아트센터, 서울


Awards/Residency


2023 <청주국제공예비엔날레> 입선

2023 신당창작아케이드X신세계 L&B 공예상품개발사업 선정

2023 한국공예디자인문화진흥원 <2023 공예 주간> 사업 선정

2023 서울문화재단 신당창작아케이드 14기 입주작가 선정

2022 서울공예박물관 시민소통프로그램 공모 선정 <실온: 감각하는 색과 자신(Tharead&own)>, 서울공예박물관

2022 한국공예디자인문화진흥원 <2022 공예트렌드페어> 브랜드관 선정

2022 서울문화재단 신당창작아케이드 13기 입주작가 선정

2021 <제22회 한국공예대전> 섬유 부문 입선


Brand collaboration


2023 스킨케어 브랜드 이솝 Aesop ‘Gloam Eau de Parfum’ invitation 작품 협업

Education/Workshop

2022 서울공예박물관 시민 소통 프로그램 <니들펠트 워크숍>

2022 중구문화재단 <보따리 민화> 미술교육 프로그램 에듀케이터 주강사

2022 한국공예디자인문화진흥원 <행복한 공예 교육> 보조강사

2021 서울공예박물관 <공예, 겨울을 짜다> 프로그램 전문 강사

2020 한국공예디자인문화진흥원  <2020 공예매개인력양성>사업 선정, 공예 에듀케이터 과정 수료



"""
    
    let viewCase: Int
    
    init(viewCase: Int) {
        self.viewCase = viewCase
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
    
    var body: some View {
        ZStack {
            switch viewCase {
            case 0:
                setupArtistExplainView()
            case 5:
                setupMakingFilmView()
            default:
                setupArtistRecordView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

extension DetailArtistInfoView {
    private func setupArtistExplainView() -> some View {
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

extension DetailArtistInfoView {
    private func setupArtistRecordView() -> some View {
        
        ZStack {
            Image("backgroundCut")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
                GeometryReader { geometry in
                    ScrollView {
                        Text(content)
                            .lineLimit(nil)
                            .frame(width: geometry.size.width)
                    }
                }
                .padding([.top], 280)
                .padding([.horizontal], 20)
                .foregroundColor(.rubyWhite)
                .bold()
        }
    }
}

extension DetailArtistInfoView {
    private func setupMakingFilmView() -> some View {
        MakingFilmView()
    }
}
