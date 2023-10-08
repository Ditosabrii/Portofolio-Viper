//
//  TabBarController.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTabBar()
        configureViews()
    }
    
    // MARK: - Helpers
    private func configureViews() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        
        let tabGradientView = UIView(frame: tabBar.bounds)
        tabGradientView.backgroundColor = .white
        tabGradientView.translatesAutoresizingMaskIntoConstraints = false
        
        tabBar.addSubview(tabGradientView)
        tabBar.sendSubviewToBack(tabGradientView)
        tabGradientView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        tabGradientView.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabGradientView.layer.shadowRadius = 4.0
        tabGradientView.layer.shadowColor = UIColor.darkGray.cgColor
        tabGradientView.layer.shadowOpacity = 0.1
        tabBar.clipsToBounds = false
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }
    
    private func makeTabBar() {
        self.viewControllers = [
            makeNavigation(viewController: createDonutChartTab()),
            makeNavigation(viewController: createLineChartTab())
        ]
    }
    
    private func makeNavigation(viewController: UIViewController) -> CustomUINavigationViewController {
        let navigation = CustomUINavigationViewController(rootViewController: viewController)
        navigation.delegate = self
        navigation.navigationBar.prefersLargeTitles = false
        return navigation
    }
    
    private func createDonutChartTab() -> UIViewController {
        let donutChartViewController = DonutChartRouter.createModule()
        donutChartViewController.tabBarItem.title = "Donut Chart"
        donutChartViewController.tabBarItem.image = UIImage(systemName: "chart.pie")
        donutChartViewController.tabBarItem.selectedImage = UIImage(systemName: "chart.pie.fill")
        return donutChartViewController
    }
    
    private func createLineChartTab() -> UIViewController {
        let lineChartViewController = LineChartRouter.createModule()
        lineChartViewController.tabBarItem.title = "Line Chart"
        lineChartViewController.tabBarItem.image = UIImage(systemName: "chart.xyaxis.line")
        lineChartViewController.tabBarItem.selectedImage = UIImage(systemName: "chart.xyaxis.line")
        return lineChartViewController
    }
}

// MARK: - UINavigationControllerDelegate
extension UIViewController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if #available(iOS 14.0, *) {
            viewController.navigationItem.backButtonDisplayMode = .minimal
        } else {
            viewController.navigationItem.backButtonTitle = ""
        }
    }
}
