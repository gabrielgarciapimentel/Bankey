//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Gabriel Garcia Pimentel Mendonca on 17/08/23.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        
        formatter = CurrencyFormatter()
    }
    
    func testShouldBreakRealIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(91234.21)
        
        XCTAssertEqual(result.0, "91.234")
        XCTAssertEqual(result.1, "21")
    }
    
    func testShouldRealFormatted() throws {
        let result = formatter.dollarsFormatted(9100.00)
        
        XCTAssertEqual(result, "R$ 9.100,00")
    }
    
    func testShouldZeroRealFormatted() throws {
        let result = formatter.dollarsFormatted(0.00)
        
        XCTAssertEqual(result, "R$ 0,00")
    }
    
    func testDollarsFormattedWithCurrencySymbol() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(929466.23)
        
        XCTAssertEqual(result, "\(currencySymbol) 929.466,23")
    }
}
