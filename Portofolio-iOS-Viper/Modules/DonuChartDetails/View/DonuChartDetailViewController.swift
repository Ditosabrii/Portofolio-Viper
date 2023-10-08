//
//  DonuChartDetailViewController.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class DonutChartDetailViewController: UIViewController {
    // MARK: - Properties
    var presenter: DonutChartDetailViewToPresenterProtocol?
    var historyTransactionTableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.updateView()
    }

    // MARK: - Methods
    private func setupTableView() {
        historyTransactionTableView = UITableView()
        historyTransactionTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(historyTransactionTableView)

        NSLayoutConstraint.activate([
            historyTransactionTableView.topAnchor.constraint(equalTo: view.topAnchor),
            historyTransactionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historyTransactionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historyTransactionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        historyTransactionTableView.dataSource = self
        historyTransactionTableView.delegate = self
        historyTransactionTableView.register(UINib(nibName: "HistoryTransactionTableViewCell", bundle: .main), forCellReuseIdentifier: "HistoryTransactionTableViewCell")
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension DonutChartDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDonutChart()?.data.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTransactionTableViewCell", for: indexPath) as? HistoryTransactionTableViewCell, let donutChart = presenter?.getDonutChart()?.data[indexPath.row] else { return UITableViewCell() }
        cell.configureContent(donutChart: donutChart)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Transaction History"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - DonutChartDetailPresenterToViewProtocol
extension DonutChartDetailViewController: DonutChartDetailPresenterToViewProtocol {
    func showDonutChart() {
        historyTransactionTableView.reloadData()
    }

    func showError() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching donut chart detail", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
