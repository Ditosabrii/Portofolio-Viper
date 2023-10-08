//
//  DonuChartPresenter.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation

class DonutChartPresenter: DonutChartViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: DonutChartPresenterToViewProtocol?
    var interactor: DonutChartPresenterToInteractorProtocol?
    var router: DonutChartPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchDonutChart()
    }
    
    func getDonutChart() -> [ChartResponse.DataItem]? {
        return interactor?.donutChart
    }
}

// MARK: - DonutChartInteractorToPresenterProtocol
extension DonutChartPresenter: DonutChartInteractorToPresenterProtocol {
    func donutChartFetched() {
        view?.showDonutChart()
    }
    
    func donutChartFetchedFailed() {
        view?.showError()
    }
}
