//
//  DonuChartDetailsRouters.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit


class DonutChartDetailRouter: DonutChartDetailPresenterToRouterProtocol {
    static func createModule(with donutChart: ChartResponse.DataItem) -> UIViewController {
        let view = DonutChartDetailViewController()
        let presenter: DonutChartDetailViewToPresenterProtocol & DonutChartDetailInteractorToPresenterProtocol = DonutChartDetailPresenter()
        let interactor: DonutChartDetailPresenterToInteractorProtocol = DonutChartDetailInteractor(donutChart: donutChart)
        let router: DonutChartDetailPresenterToRouterProtocol = DonutChartDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
