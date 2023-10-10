//
//  HomeViewModel.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/09/27.
//

import Foundation
import SwiftUI
import Combine

final class HomeViewModel: ViewModelable {
    
    enum Action {
    }
    
    enum State {
        case works([Work])
    }
    
    @Published var state: State
    
    @Published private(set) var stateModel: UIStateModel = UIStateModel()
    
    @Published private(set) var activeCard: Int = 0
    
    private var cancellables: [AnyCancellable] = []
        
    private var externalData: HomeExternal.ExternalData
    
    init(externalData: HomeExternal.ExternalData) {
        self.externalData = externalData
        
        state = .works(externalData.work)
        
        self.stateModel.$activeCard.sink { completion in
            switch completion {
            case let .failure(error):
                print("finished with error: ", error.localizedDescription)
            case .finished:
                print("finished")
            }
        } receiveValue: { [weak self] activeCard in
            guard let self else { return }
            self.someCoolMethodHere(for: activeCard)
        }.store(in: &cancellables)
    }
    
    func action(_ action: Action) {

    }
}

extension HomeViewModel {
    private func someCoolMethodHere(for activeCard: Int) {
        print("someCoolMethodHere: index received: ", activeCard)
        self.activeCard = activeCard
    }
}
