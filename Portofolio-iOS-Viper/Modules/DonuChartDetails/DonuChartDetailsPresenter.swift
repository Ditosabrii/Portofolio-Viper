//
//  DonuChartDetailsPresenter.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class DonutChartDetailPresenter: DonutChartDetailViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: DonutChartDetailPresenterToViewProtocol?
    var interactor: DonutChartDetailPresenterToInteractorProtocol?
    var router: DonutChartDetailPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchDonutChart()
    }
    
    func getDonutChart() -> ChartResponse.DataItem? {
        return interactor?.donutChart
    }
}

// MARK: - DonutChartInteractorToPresenterProtocol
extension DonutChartDetailPresenter: DonutChartDetailInteractorToPresenterProtocol {
    func donutChartFetched() {
        view?.showDonutChart()
    }
    
    func donutChartFetchedFailed() {
        view?.showError()
    }
}
