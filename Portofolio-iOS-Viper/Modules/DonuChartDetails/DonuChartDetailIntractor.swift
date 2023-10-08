//
//  DonuChartDetailIntractor.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation


class DonutChartDetailInteractor: DonutChartDetailPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: DonutChartDetailInteractorToPresenterProtocol?
    var donutChart: ChartResponse.DataItem?
    
    init(donutChart: ChartResponse.DataItem) {
        self.donutChart = donutChart
    }
    
    // MARK: - Methods
    func fetchDonutChart() {
        if donutChart != nil {
            self.presenter?.donutChartFetched()
        } else {
            self.presenter?.donutChartFetchedFailed()
        }
    }
}
