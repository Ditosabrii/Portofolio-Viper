//
//  DonuChartRouter.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class DonutChartRouter: DonutChartPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = DonutChartViewController()
        let presenter: DonutChartViewToPresenterProtocol & DonutChartInteractorToPresenterProtocol = DonutChartPresenter()
        let interactor: DonutChartPresenterToInteractorProtocol = DonutChartInteractor()
        let router: DonutChartPresenterToRouterProtocol = DonutChartRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
