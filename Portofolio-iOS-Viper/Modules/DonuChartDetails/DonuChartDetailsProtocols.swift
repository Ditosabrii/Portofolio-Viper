//
//  DonuChartDetailsProtocols.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

protocol DonutChartDetailPresenterToViewProtocol: AnyObject {
    func showDonutChart()
    func showError()
}

protocol DonutChartDetailInteractorToPresenterProtocol: AnyObject {
    func donutChartFetched()
    func donutChartFetchedFailed()
}

protocol DonutChartDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DonutChartDetailInteractorToPresenterProtocol? { get set }
    var donutChart: ChartResponse.DataItem? { get }
    
    func fetchDonutChart()
}

protocol DonutChartDetailPresenterToRouterProtocol: AnyObject {
    static func createModule(with donutChart: ChartResponse.DataItem) -> UIViewController
}

protocol DonutChartDetailViewToPresenterProtocol: AnyObject {
    var view: DonutChartDetailPresenterToViewProtocol? { get set }
    var interactor: DonutChartDetailPresenterToInteractorProtocol? { get set }
    var router: DonutChartDetailPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getDonutChart() -> ChartResponse.DataItem?
}
