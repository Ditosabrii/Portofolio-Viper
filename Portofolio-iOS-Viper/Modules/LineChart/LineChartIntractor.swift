//
//  LineChartIntractor.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation


class LineChartInteractor: LineChartPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: LineChartInteractorToPresenterProtocol?
    var lineChart: ChartResponse.LineData?
    
    // MARK: - Methods
    func fetchLineChart() {
        guard let path = Bundle.main.path(forResource: "Chart", ofType: "json") else {
            print("JSON file not found.")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let chartData = try JSONDecoder().decode([ChartResponse].self, from: data)
            if let lineData = chartData.first(where: { $0.type == "lineChart" }) {
                switch lineData.data {
                case .lineChart(let dataItems):
                    self.lineChart = dataItems
                    self.presenter?.lineChartFetched()
                default:
                    self.presenter?.lineChartFetchedFailed()
                }
            }
        } catch {
            print(error)
            self.presenter?.lineChartFetchedFailed()
        }
    }
}
