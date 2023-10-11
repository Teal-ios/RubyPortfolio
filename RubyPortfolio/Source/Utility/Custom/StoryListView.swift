//
//  P162_ScreenTransition.swift
//  Fabula
//
//  Created by jasu on 2021/09/06.
//  Copyright (c) 2021 jasu All rights reserved.
//

import SwiftUI

public struct P162_ScreenTransition: View {
    
    @Namespace private var namespace
    @State private var showDetail: Bool = false
    @State private var currentData: WorkStory? = nil
    
    @State private var  datas = [WorkStory]()
    
    public init() {}
    public var body: some View {
        ZStack {
            List(datas) { data in
                ListRow(namespace: namespace, data: data)
#if os(iOS)
                    .listRowSeparator(.hidden)
#endif
                    .listRowBackground(Color.clear)
                    .padding(.vertical, 8)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 6)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            withAnimation(.transitionSpring) {
                                currentData = data
                                showDetail = true
                            }
                        }
                    }
            }
            .listStyle(.plain)
            .opacity(showDetail ? 0.0 : 1.0)
            if showDetail {
                if let data = currentData {
                    DetailView(namespace: namespace, data: data, show: $showDetail)
                    
                }
            }
        }
        .animation(.transitionSpring, value: showDetail)
        .onAppear {
            DispatchQueue.main.async {
                
                datas = [
                    WorkStory(storyImages: [
                        IdImage(image: UIImage(named: "6-2. Luv letter,Embroidery on paper, 300x200mm, 2023")!)
                    ,
                        IdImage(image: UIImage(named: "6-1. Luv letter, blue spring, universe, Embroidery on paper, 300x200mm, 2023")!)
                    ], title: "Diary\nStory", name: "일기장 시리즈", description: "오랜 시간 글을 마주하며 비워내는 내면의 이야기", color: Color.gray,
                              explain: """
                                 작업은 오랜 시간 동안 써오던 글과 편지, 일기장 등 사적인 기록물을 주제로 이야기를 써냅니다. 오랫동안 글을 남기고 기록하던 습관은 자신과 소통하는 또 다른 언어이자 매개체였습니다.
                                
                                 글로 본인과 대화하는 습관에서 시작되어 쌓인 기록물이 작업의 시작이 되었습니다. 작품에서의 글은 뒤엉킨 언어로 시각화됩니다. 지극히도 사적인 기록을 통해 작업을 보는 이들도 자신을 받아들이고
                                사유할 수 있는 작은 틈이 되기를 바랍니다.

                                 작업 과정은 주로 섬유를 기반으로 진행되는데 태피스트리. 자수와 같은 기법으로 얽히고설킨 이미지를 만들어냅니다.
                                
                                 섬유 설치물은 따뜻한 실 소재의 느낌과는 달리 마치 머리카락이 엉키거나 글자를 지워내거나 종이를 구겨버리는 것과 같이 다소 불편해 보이는 이미지를 나타냅니다.
                                
                                 이 과정에서 오랜 시간 글을 마주하면서 비워내는 작업 태도를 바탕으로 내면의 이야기를 실로 풀어내고 있습니다.
                                
                                
                                """
                                ),
                    WorkStory(storyImages: [
                        IdImage(image: UIImage(named: "5-3. Brand Aesop Gloam eau de parfum invitation collaboration, Embroidery on paper, cotton thread, 148 x 210mm, 2023")!),
                        IdImage(image: UIImage(named: "5-1. Brand Aesop Gloam eau de parfum invitation collaboration, Embroidery on paper, cotton thread, 148 x 210mm, 2023")!),
                        IdImage(image: UIImage(named: "5-2. Brand Aesop Gloam eau de parfum invitation collaboration, Embroidery on paper, cotton thread, 148 x 210mm, 2023")!)
                    ], title: "Aesop\nStory", name: "이솝 초대장", description: "Gloam Eau de parfume", color: Color.brown,
                              explain:
                                """
  브랜드 이솝의 'Gloam Eau de parfume'의 영감이 되는 글귀를 한 글자 한 글자 소중히 손으로 자수를 놓은 초대장입니다.

 신제품인 Gloam 향수 행사를 위해 이솝과 협업하여 제작되었습니다.


"""
                             )
                    ,
                    WorkStory(storyImages: [
                        IdImage(image: UIImage(named: "7-1. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023")!),
                        IdImage(image: UIImage(named: "7-2. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023")!),
                        IdImage(image: UIImage(named: "7-3. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023")!),
                        IdImage(image: UIImage(named: "7-4. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023")!)
                    ], title: "Shinsegae\nStory", name: "와인 단청 댕기", description: "신당창작아케이드 공예상품 개발사업", color: Color.turquoise,
                              explain: """
 와인 단청 댕기는 한국의 소녀들이 머리를 묶을 때 사용했던 끝이 뾰족한 제비부리댕기에서 형태를 차용한 주류 패키징 상품입니다.

 한국 전통 목조건물에서 볼 수 있는 단청을 모티브로 패턴을 디자인하여 고급 원단으로 제작한 후, 직접 재봉하고 수를 놓아 기품을 더했습니다.

 단청의 화려한 컬러와 댕기의 단아한 형태가 동시에 담겨있어, 주는 이의 정성어린 마음을 표현하면서 선물의 격조를 높이는 아이템입니다.


"""
                             )
                ]
            }
        }
    }
}

fileprivate
extension Animation {
    static var transitionSpring: Animation {
        self.spring(response: 0.48, dampingFraction: 0.82, blendDuration: 0.7)
    }
}

fileprivate
struct WorkStory: Identifiable {
    var id = UUID()
    var storyImages: [IdImage]
    var title: String
    var name: String
    var description: String
    var color: Color
    var explain: String
}

fileprivate
struct ListRow: View {
    
    let namespace: Namespace.ID
    let data: WorkStory
    
    var body: some View {
        NamespaceView(namespace: namespace, data: data)
            .frame(height: 280)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

fileprivate
struct DetailView: View {
    
    let namespace: Namespace.ID
    let data: WorkStory
    @Binding var show: Bool
    @State private var showText: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                VStack {
                    NamespaceView(namespace: namespace, data: data)
                        .frame(height: 460)
                    
                    ZStack {
                        if showText {
                            Text(data.explain)
                                .lineLimit(nil)
                                .padding(12)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .animation(.transitionSpring, value: showText)
                    .opacity(0.5)
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.easeInOut) {
                                showText = true
                            }
                        }
                    }
                    
                    Spacer()

                    TabView {
                        ForEach(data.storyImages, id: \.id) { ele in
                            Image(uiImage: ele.image)
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
                    
                    Spacer()
                    Spacer()
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: xButton)
    }
    
    var xButton : some View {  // <-- 👀 커스텀 버튼
        Image(systemName: "xmark")
            .padding(8)
            .foregroundColor(Color.white)
            .shadow(color: Color.black.opacity(0.16), radius: 3, x: 0, y: 0)
            .onTapGesture {
                withAnimation(.transitionSpring) {
                    show = false
                }
            }
    }
}

fileprivate
struct NamespaceView: View {
    
    let namespace: Namespace.ID
    let data: WorkStory
    
    var imageTitleView: some View {
        ZStack(alignment: .bottomLeading) {
            GeometryReader { proxy in
                ZStack {
                    Image(uiImage: data.storyImages[0].image)
                        .resizable()
                }
            }
            .clipShape(Rectangle())
            .matchedGeometryEffect(id: "image\(data.id)", in: namespace)
            
            VStack(alignment: .leading, spacing: -6) {
                let arrText = data.title.split(separator: "\n")
                ForEach(arrText, id: \.self) { text in
                    Text(text)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color.white)
                }
            }
            .shadow(color: Color.black.opacity(0.16), radius: 3, x: 0, y: 0)
            .padding()
            .padding(.bottom, 56)
            .matchedGeometryEffect(id: "title\(data.id)", in: namespace)
        }
    }
    
    var bottomInfoView: some View {
        ZStack(alignment: .leading) {
            if #available(macOS 12.0, *) {
                Rectangle()
                    .fill(.thinMaterial)
            } else {
                Rectangle()
                    .fill(Color.black.opacity(0.5))
            }
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text(data.name)
                        .bold()
                        .foregroundColor(Color.rubyWhite)
                    Text(data.description)
                        .font(.caption)
                        .opacity(0.8)
                        .foregroundColor(Color.rubyWhite)
                }.offset(y: -2)
                Spacer()

            }
            .padding(.leading, 6)
        }
        .frame(maxHeight: 61)
        .matchedGeometryEffect(id: "botttom\(data.id)", in: namespace)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            imageTitleView
            bottomInfoView
        }
    }
}

struct P162_ScreenTransition_Previews: PreviewProvider {
    static var previews: some View {
        P162_ScreenTransition()
    }
}
