//
//  DonuChartDetailsCell.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation
import UIKit

class HistoryTransactionTableViewCell: UITableViewCell {
    var dateLabel: UILabel!
    var nominalLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    private func setupSubviews() {
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)

        nominalLabel = UILabel()
        nominalLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nominalLabel)

        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            nominalLabel.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            nominalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nominalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    func configureContent(donutChart: ChartResponse.DataItem.Transaction) {
        let date = donutChart.trx_date.convertDateString(fromFormat: .reverseServerDateSlash, toFormat: .dayMonthYear)
        dateLabel.text = date
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp "
        formatter.currencyGroupingSeparator = ","
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "id_ID")

        if let formattedNominal = formatter.string(from: NSNumber(value: donutChart.nominal)) {
            nominalLabel.text = formattedNominal
        } else {
            nominalLabel.text = "-"
        }
    }
}
