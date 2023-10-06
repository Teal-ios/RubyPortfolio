//
//  RubyPortfolioApp.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

@main
struct RubyPortfolioApp: App {
    var body: some Scene {
        WindowGroup {
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
}
