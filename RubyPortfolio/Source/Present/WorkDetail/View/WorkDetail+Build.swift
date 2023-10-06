//
//  WorkDetail+Build.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

extension WorkDetail {

    static func build(data: WorkDetailData.ExternalData) -> some View {
        let viewModel = WorkDetailViewModel(externalData: data)
        let vc = WorkDetail(viewModel: viewModel)
        return vc
    }
}
