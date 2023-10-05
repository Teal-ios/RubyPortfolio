//
//  HomeRouter.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

struct HomeRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
}

// MARK: - Navigation Screens

extension HomeRouter {
    enum ScreenType: RouterScreenProtocol {
        case workDetail(work: Work)

        var routeType: RouterScreenPresentationType {
            switch self {
            case .workDetail:
                return .navigationLink
            }
        }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View {

    }

    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension HomeRouter {
    enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }

    func makeAlert(type: RouterAlertType) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title),
                         message: message.map { Text($0) },
                         dismissButton: .cancel(Text("Cancel")))
        }
    }
}
