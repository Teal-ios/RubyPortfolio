//
//  WorkDetail.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

struct WorkDetail: View {
    @StateObject var viewModel = WorkDetailViewModel()
    
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
        WorkDetail()
    }
}
