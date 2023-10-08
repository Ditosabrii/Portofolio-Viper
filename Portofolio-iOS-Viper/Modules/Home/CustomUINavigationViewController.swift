//
//  CustomUINavigationViewController.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit


class CustomUINavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
