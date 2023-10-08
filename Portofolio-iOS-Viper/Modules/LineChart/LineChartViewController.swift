//
//  LineChartViewController.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit
import Charts
import DGCharts

class LineChartViewController: UIViewController {
    // MARK: - Properties
    var presenter: LineChartViewToPresenterProtocol?
    var lineChartView: LineChartView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Line Chart"
        setupLineChartView()
        presenter?.updateView()
    }

    // MARK: - Methods
    func setupLineChartView() {
        lineChartView = LineChartView()
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineChartView)

        NSLayoutConstraint.activate([
            lineChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        lineChartView.noDataText = "No data available"
        lineChartView.chartDescription.text = ""
        lineChartView.legend.enabled = false
    }

    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }

        let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: "Monthly Data")
        
        
        lineChartDataSet.colors = [NSUIColor.blue]
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.mode = .cubicBezier
        lineChartDataSet.lineWidth = 2.0
        lineChartDataSet.drawValuesEnabled = false
        lineChartDataSet.fillAlpha = 0.5
        lineChartDataSet.drawFilledEnabled = true

        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
    }
}

// MARK: - LineChartPresenterToViewProtocol
extension LineChartViewController: LineChartPresenterToViewProtocol {
    func showLineChart() {
        guard let chartDataItems = presenter?.getLineChart() else { return }
        let dataPoints = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        let values = chartDataItems.month.map { Double($0) }

        customizeChart(dataPoints: dataPoints, values: values)
    }

    func showError() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching line chart", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
