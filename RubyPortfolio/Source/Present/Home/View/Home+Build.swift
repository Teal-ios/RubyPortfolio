//
//  Home+Build.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

extension Home {

    static func build(data: HomeExternal.ExternalData) -> some View {
        let viewModel = HomeViewModel(externalData: data)
        let vc = Home(viewModel: viewModel)
        return vc
    }
}
