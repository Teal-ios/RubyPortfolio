//
//  Home.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import SwiftUI

struct Home: View {
    @ObservedObject var store: HomeStore = HomeStore()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            self.contentView

        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch store.state {
        case let .works(works):
            ZStack {
                Image(works[store.activeCard].image)
                    
                HStack {
                    VStack(spacing: 8) {

                        getWorkCellButtonTap(works: works)
                    } // VStack
                    .frame(height: 350, alignment: .top)
                }
            }
        }
    }
}

extension Home {
    @ViewBuilder
    private func getWorkCellButtonTap(works: [Work]) -> some View {
        Button {
            store.action(.onTapWorkButton(work: works[store.activeCard]))
        } label: {
            SnapCarousel(works: works)
                .environmentObject(store.stateModel)
                .font(.system(size: 22))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
