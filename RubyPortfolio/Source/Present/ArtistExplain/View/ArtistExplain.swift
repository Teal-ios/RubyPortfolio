//
//  ArtistExplain.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/07.
//

import SwiftUI

struct ArtistExplain: View {
    
    @ObservedObject var viewModel: ArtistExplainViewModel
    
    init(viewModel: ArtistExplainViewModel) {
        self.viewModel = viewModel
    }
    
    @ViewBuilder
    var body: some View {
        Text("ㅎㅇ")
    }
}
