//
//  Work.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import Foundation

struct Work: Identifiable {
    var id: Int
    var title: String = ""
    var subTitle: String = ""
    var image: String = ""
    var workColor: WorkColor = .white
    var seriesCount: Int = 0
    var worksImage: [IdImage]
}

enum WorkColor: Hashable {
    case black
    case white
    case brown
    case turquoise
    case yellow
}
