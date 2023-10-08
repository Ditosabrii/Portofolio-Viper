//
//  String+EXT.swift
//  Portofolio-iOS-Viper
//
//  Created by Dito on 08/10/23.
//

import Foundation


extension String {
    func convertDateString(fromFormat: DateFormat, toFormat: DateFormat) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat.rawValue
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = toFormat.rawValue
            dateFormatter.locale = Locale(identifier: "id_ID")
            let convertedString = dateFormatter.string(from: date)
            return convertedString
        } else {
            return nil
        }
    }
}
