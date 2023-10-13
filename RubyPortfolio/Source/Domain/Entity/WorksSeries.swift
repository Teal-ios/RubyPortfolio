//
//  WorksSeries.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/10.
//

import SwiftUI

enum WorksSeries: Hashable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    
    var worksSeries: [UIImage?] {
        switch self {
            
        case .one:
            return [UIImage(named: "1-1. 0412-1, Embroidery on tracing paper, 200 x 275mm, 2023"), UIImage(named: "1-2. 0412-1, Embroidery on tracing paper, 200 x 275mm, 2023"), UIImage(named: "1-3. 0412-1, Embroidery on tracing paper, 200 x 275mm, 2023"), UIImage(named: "1-4. 0412-1, Embroidery on tracing paper, 200 x 275mm, 2023")]
        case .two:
            return [UIImage(named: "2-1. Untitled_1228, Tapestry, Poly metal yarn, wool, wore, 1100 x 1400mm, 2023"),
                    UIImage(named: "2-2. Untitled_1228, Tapestry, Poly metal yarn, wool, wore, 1100 x 1400mm, 2023"),
                    UIImage(named: "2-3. Untitled_1228, Tapestry, Poly metal yarn, wool, wore, 1100 x 1400mm, 2023")]
        case .three:
            return [UIImage(named: "3-1. 0810-1, Tapestry, wool, 1300 x 110mm, 2022"),
            UIImage(named: "3-5. 0810-1, Tapestry, wool, 1300 x 110mm, 2022")]
        case .four:
            return [UIImage(named: "3-2. 0810-2, Tapestry, wool, 1200 x 1100mm,  2022")]
        case .five:
            return [UIImage(named: "3-3. 0810-3, Tapestry, wool, 1100 x 1000mm, 2022"),
            UIImage(named: "3-4. 0810-3, Tapestry, wool, 1100 x 1000mm, 2022")]
        case .six:
            return [UIImage(named: "4-1. 전하지 못한 편지, Tapestry, wool, 1500 x 1100mm, 2018"),
            UIImage(named: "4-2. 전하지 못한 편지, Tapestry, wool, 1500 x 1100mm, 2018"),
            UIImage(named: "4-3. 전하지 못한 편지, Tapestry, wool, 1500 x 1100mm, 2018"),
            UIImage(named: "4-4. 전하지 못한 편지, Tapestry, wool, 1500 x 1100mm, 2018")]
        case .seven:
            return [UIImage(named: "이솝1"),
            UIImage(named: "이솝2"),
            UIImage(named: "이솝3")]
        case .eight:
            return [UIImage(named: "6-2. Luv letter,Embroidery on paper, 300x200mm, 2023"),
            UIImage(named: "6-1. Luv letter, blue spring, universe, Embroidery on paper, 300x200mm, 2023")]
        case .nine:
            return [UIImage(named: "7-1. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023"),
            UIImage(named: "7-2. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023"),
            UIImage(named: "7-3. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023"),
            UIImage(named: "7-4. 와인단청댕기(신세계L&B 공예상품개발 선정작), Polyester, DTP, 45 x 330mm, 2023")]
        }
    }
}
