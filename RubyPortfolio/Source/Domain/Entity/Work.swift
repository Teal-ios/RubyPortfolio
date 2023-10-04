//
//  Work.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import Foundation

struct Work: Decodable, Hashable, Identifiable {
    var id: Int
    var title: String = ""
    var subTitle: String = ""
    var image: String = ""
    var fontColor: FontColor = .white
}

enum FontColor: Hashable, Decodable {
    case black
    case white
}
