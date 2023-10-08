//
//  LineChartPresenter.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit


class LineChartPresenter: LineChartViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: LineChartPresenterToViewProtocol?
    var interactor: LineChartPresenterToInteractorProtocol?
    var router: LineChartPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchLineChart()
    }
    
    func getLineChart() -> ChartResponse.LineData? {
        return interactor?.lineChart
    }
}

// MARK: - DonutChartInteractorToPresenterProtocol
extension LineChartPresenter: LineChartInteractorToPresenterProtocol {
    func lineChartFetched() {
        view?.showLineChart()
    }
    
    func lineChartFetchedFailed() {
        view?.showError()
    }
}
