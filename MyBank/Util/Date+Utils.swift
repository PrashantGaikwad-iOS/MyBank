//
//  Date+Utils.swift
//  MyBank
//
//  Created by Prashant Gaikwad on 28/01/22.
//

import Foundation

extension Date {
    static var myBankDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "IST")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.myBankDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
