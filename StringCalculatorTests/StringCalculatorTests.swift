//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Akshay Sonawane on 27/06/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {
    
    var calculator: StringCalculator!
    
    override func setUp() {
        super.setUp()
        calculator = StringCalculator()
    }
    
    override func tearDown() {
        calculator = nil
        super.tearDown()
    }
    
    func testEmptyStringReturnZero () {
        XCTAssertEqual(try! calculator.add(""), 0)
    }
    
    func testSingleNumberReturnThatNumber() {
        XCTAssertEqual(try! calculator.add("3"), 3)
    }
    
    func testTwoNumbersReturnSum() {
        XCTAssertEqual(try! calculator.add("3,4"), 7)
    }
    
    func testNewLineAsDelimiter() {
        XCTAssertEqual(try! calculator.add("3\n4"), 7)
    }
    
    func testCustomDelimiterSemiColon() {
        XCTAssertEqual(try! calculator.add("//;\n3;4"), 7)
    }
    
    func testSingleNegativeNumberThrowsException() {
        XCTAssertThrowsError(try calculator.add("-1")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -1")
        }
    }
    
    func testMultipleNegativeNumbersThrowsException() {
        XCTAssertThrowsError(try calculator.add("-1,-2,-3")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -1,-2,-3")
        }
    }
}
