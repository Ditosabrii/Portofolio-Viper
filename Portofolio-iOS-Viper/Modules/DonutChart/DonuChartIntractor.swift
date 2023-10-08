//
//  DonuChartIntractor.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation


class DonutChartInteractor: DonutChartPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: DonutChartInteractorToPresenterProtocol?
    var donutChart: [ChartResponse.DataItem]?
    
    // MARK: - Methods
    func fetchDonutChart() {
        guard let path = Bundle.main.path(forResource: "Chart", ofType: "json") else {
            print("JSON file not found.")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let chartData = try JSONDecoder().decode([ChartResponse].self, from: data)
            if let donutData = chartData.first(where: { $0.type == "donutChart" }) {
                switch donutData.data {
                case .donutChart(let dataItems):
                    self.donutChart = dataItems
                    self.presenter?.donutChartFetched()
                default:
                    self.presenter?.donutChartFetchedFailed()
                }
            }
        } catch {
            print(error)
            self.presenter?.donutChartFetchedFailed()
        }
    }
}
