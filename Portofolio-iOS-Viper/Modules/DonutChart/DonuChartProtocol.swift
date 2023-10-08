//
//  DonuChartProtocol.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

protocol DonutChartPresenterToViewProtocol: AnyObject {
    func showDonutChart()
    func showError()
}

protocol DonutChartInteractorToPresenterProtocol: AnyObject {
    func donutChartFetched()
    func donutChartFetchedFailed()
}

protocol DonutChartPresenterToInteractorProtocol: AnyObject {
    var presenter: DonutChartInteractorToPresenterProtocol? { get set }
    var donutChart: [ChartResponse.DataItem]? { get }
    
    func fetchDonutChart()
}

protocol DonutChartPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol DonutChartViewToPresenterProtocol: AnyObject {
    var view: DonutChartPresenterToViewProtocol? { get set }
    var interactor: DonutChartPresenterToInteractorProtocol? { get set }
    var router: DonutChartPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getDonutChart() -> [ChartResponse.DataItem]?
}
