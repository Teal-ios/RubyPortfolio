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
                Work(id: 0,
                     title: "0412-2",
                     subTitle: "20x27.5cm\n Embroidery on Paper\n2021",
                     image: "1-1. 0412-1, Embroidery on tracing paper, 200 x 275mm, 2023",
                     workColor: .white),
                Work(id: 1,
                     title: "Untitled_1228",
                     subTitle: "110 x 140cm\nTapestry, poly metal yarn, wool, wire\n2023",
                     image: "2-1. Untitled_1228, Tapestry, Poly metal yarn, wool, wore, 1100 x 1400mm, 2023",
                     workColor: .white),
                Work(id: 2,
                     title: "0810 #1",
                     subTitle: "130 x 110cm\nWool, Tapestry\n2022",
                     image: "3-1. 0810-1, Tapestry, wool, 1300 x 110mm, 2022",
                     workColor: .white),
                Work(id: 3,
                     title: "0810 #2",
                     subTitle: "120 x 110cm\nWool, Tapestry\n2022",
                     image: "3-2. 0810-2, Tapestry, wool, 1200 x 1100mm,  2022",
                     workColor: .white),
                Work(id: 4,
                     title: "0810 #3",
                     subTitle: "110 x 100cm\nWool, Tapestry\n2022",
                     image: "3-3. 0810-3, Tapestry, wool, 1100 x 1000mm, 2022",
                     workColor: .white),
                Work(id: 5,
                     title: "전하지 못한 편지",
                     subTitle: "110 x 150cm\nWool, Tapestry\n2018",
                     image: "4-1. 전하지 못한 편지, Tapestry, wool, 1500 x 1100mm, 2018",
                     workColor: .yellow),
                Work(id: 6,
                     title: "Brand ‘Aesop’ Gloam eau de parfum invitation collaboration",
                     subTitle: "Embroidery on paper, cotton thread\n148 x 210mm\n2023",
                     image: "5-1. Brand Aesop Gloam eau de parfum invitation collaboration, Embroidery on paper, cotton thread, 148 x 210mm, 2023",
                     workColor: .brown),
                Work(id: 7,
                     title: "일기장",
                     subTitle: "Luv letter,Embroidery on paper\n 300x200mm\n2023",
                     image: "6-2. Luv letter,Embroidery on paper, 300x200mm, 2023",
                     workColor: .brown),
                Work(id: 8,
                     title: "와인단청댕기\n(신세계L&B 공예상품개발 선정작)",
                     subTitle: "Polyester, DTP\n45 x 330mm\n2023",
                     image: "7-1. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023",
                     workColor: .turquoise)
            ]))
        }
    }
}
