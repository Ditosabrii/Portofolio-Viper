//
//  LineChartRouter.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class LineChartRouter: LineChartPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = LineChartViewController()
        let presenter: LineChartViewToPresenterProtocol & LineChartInteractorToPresenterProtocol = LineChartPresenter()
        let interactor: LineChartPresenterToInteractorProtocol = LineChartInteractor()
        let router: LineChartPresenterToRouterProtocol = LineChartRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
