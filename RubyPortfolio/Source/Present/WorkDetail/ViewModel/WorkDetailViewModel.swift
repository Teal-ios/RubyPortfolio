//
//  WorkDetailViewModel.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import Foundation
import Combine

final class WorkDetailViewModel: ViewModelable {

    enum Action {
        case onTapWorkButton(work: Work)
    }
    
    enum State {
        case work(Work)
    }
    
    @Published var state: State

    // MARK: - Properties
    private var cancellables: [AnyCancellable] = []
    private var externalData: WorkDetailData.ExternalData
    
    init(externalData: WorkDetailData.ExternalData) {
        self.externalData = externalData
        state = .work(externalData.work)
    }
    
    func action(_ action: Action) {

    }
}

extension WorkDetailData {
    struct ExternalData {
        let work: Work
    }
}

enum WorkDetailData { }
