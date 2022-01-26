//
//  Decimal+Utils.swift
//  MyBank
//
//  Created by Prashant Gaikwad on 27/01/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
