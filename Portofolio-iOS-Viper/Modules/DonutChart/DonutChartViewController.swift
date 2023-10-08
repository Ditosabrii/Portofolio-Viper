//
//  DonutChartViewController.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit
import DGCharts

class DonutChartViewController: UIViewController {
    // MARK: - Properties
    var presenter: DonutChartViewToPresenterProtocol?
    var pieChartView: PieChartView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Donut Chart"
        setupPieChartView()
        presenter?.updateView()
    }
    
    // MARK: - Methods
    private func setupPieChartView() {
        pieChartView = PieChartView()
        pieChartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pieChartView)
        
        NSLayoutConstraint.activate([
            pieChartView.topAnchor.constraint(equalTo: view.topAnchor),
            pieChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pieChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pieChartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        pieChartView.delegate = self
    }
    
    func customizeChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries)
        pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieChartView.data = pieChartData
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
}

// MARK: - DonutChartPresenterToViewProtocol
extension DonutChartViewController: DonutChartPresenterToViewProtocol {
    func showDonutChart() {
        guard let chartDataItems = presenter?.getDonutChart() else { return }
        
        let dataPoints = chartDataItems.map { $0.label }
        let values = chartDataItems.compactMap { Double($0.percentage) }
        
        customizeChart(dataPoints: dataPoints, values: values)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching donut chart", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DonutChartViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        guard let chartDataItems = presenter?.getDonutChart(),
              let label = entry.data as? String,
              let index = chartDataItems.firstIndex(where: { $0.label == label })
        else {
            print("chart data items nil or entry data not matching")
            return
        }
        
        let dataItem = chartDataItems[index]
        let detailViewController = DonutChartDetailRouter.createModule(with: dataItem)
        detailViewController.title = dataItem.label
        detailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

