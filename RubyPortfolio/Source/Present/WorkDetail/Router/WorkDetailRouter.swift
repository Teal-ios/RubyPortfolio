//
//  WorkDetailRouter.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/05.
//

import SwiftUI

struct WorkDetailRouter: RouterProtocol {
    typealias RouterScreenType = ScreenType
    typealias RouterAlertType = AlertScreen

    let subjects: Subjects
}

// MARK: - Navigation Screens

extension WorkDetailRouter {
    enum ScreenType: RouterScreenProtocol {
        case unowned

        var routeType: RouterScreenPresentationType { .navigationLink }
    }

    @ViewBuilder
    func makeScreen(type: RouterScreenType) -> some View { EmptyView() }
    func onDismiss(screenType: RouterScreenType) {}
}

// MARK: - Alerts

extension WorkDetailRouter {
    enum AlertScreen: RouterAlertScreenProtocol {
        case defaultAlert(title: String, message: String?)
    }

    func makeAlert(type: RouterAlertType) -> Alert {
        switch type {
        case let .defaultAlert(title, message):
            return Alert(title: Text(title),
                         message: message.map { Text($0) },
                         dismissButton: .cancel())
        }
    }
}
