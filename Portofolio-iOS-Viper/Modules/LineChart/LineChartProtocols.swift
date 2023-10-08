//
//  LineChartProtocols.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

protocol LineChartPresenterToViewProtocol: AnyObject {
    func showLineChart()
    func showError()
}

protocol LineChartInteractorToPresenterProtocol: AnyObject {
    func lineChartFetched()
    func lineChartFetchedFailed()
}

protocol LineChartPresenterToInteractorProtocol: AnyObject {
    var presenter: LineChartInteractorToPresenterProtocol? { get set }
    var lineChart: ChartResponse.LineData? { get }
    
    func fetchLineChart()
}

protocol LineChartPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol LineChartViewToPresenterProtocol: AnyObject {
    var view: LineChartPresenterToViewProtocol? { get set }
    var interactor: LineChartPresenterToInteractorProtocol? { get set }
    var router: LineChartPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getLineChart() -> ChartResponse.LineData?
}
