//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Gabriel Garcia Pimentel Mendonca on 16/08/23.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
