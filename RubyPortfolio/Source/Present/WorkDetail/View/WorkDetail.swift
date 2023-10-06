//
//  WorkDetail.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

struct WorkDetail: View {
    
    @ObservedObject var viewModel: WorkDetailViewModel
    
    init(viewModel: WorkDetailViewModel) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct WorkDetail_Previews: PreviewProvider {
    static var previews: some View {
        WorkDetail.build(data: .init(work: Work(id: 0, title: "작품1", subTitle: "첫작품", image: "main1", fontColor: .white)))
    }
}
