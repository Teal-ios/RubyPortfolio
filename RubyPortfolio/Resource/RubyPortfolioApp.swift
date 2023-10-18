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
            ArtistExplain(viewModel: ArtistExplainViewModel())
        }
    }
}
