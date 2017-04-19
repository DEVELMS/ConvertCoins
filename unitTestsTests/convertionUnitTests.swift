//
//  unitTestsTests.swift
//  unitTestsTests
//
//  Created by Storm on 18/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

import XCTest
@testable import unitTests

class convertionUnitTests: XCTestCase {
    
    var viewController: ConvertionController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ConvertionController
        
        viewController.preload()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConvertStringValueToDoubleDoingWell() {
        
        XCTAssertGreaterThan(viewController.convertStringValueToDouble(value: "1700.1076"), 0, "A conversão foi realizada com sucesso.")
        XCTAssertGreaterThan(viewController.convertStringValueToDouble(value: viewController.removeSpecialChars(from: "17.001,076")), 0, "A conversão foi realizada com sucesso.")
    }
    
    func testConvertStringValueToDoubleFailing() {
        
        XCTAssertEqual(viewController.convertStringValueToDouble(value: nil), 0, "Não é possível converter a string digitada para double")
        XCTAssertEqual(viewController.convertStringValueToDouble(value: "17.00123123asdasd0.076"), 0, "Não é possível converter a string digitada para double")
        XCTAssertEqual(viewController.convertStringValueToDouble(value: "string"), 0, "Não é possível converter a string digitada para double")
    }
    
    func testRemoveSpecialCharsDoingWell() {
        
        XCTAssertNotNil(viewController.removeSpecialChars(from: "17.00123123a,sdasd0.076"), "Caracteres especiais removidos corretamente da string")
    }
    
    func testRemoveSpecialCharsFailing() {
        
        XCTAssertNil(viewController.removeSpecialChars(from: nil), "Caracteres especiais removidos corretamente da string")
    }
    
    func testGetConvertedCoinValueFromDoubleValue() {
        
        XCTAssertNotEqual(viewController.getConvertedCoinValue(from: 575.76), "", "Valor da moeda convertido e retornada corretamente")
    }
    
    func testPerformanceConvertionMethods() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
            _ = self.viewController.removeSpecialChars(from: "17.00123123a,sdasd0.076")
            _ = self.viewController.convertStringValueToDouble(value: "17001076")
            _ = self.viewController.getConvertedCoinValue(from: 575.76)
        }
    }
    
}

extension ConvertionController {
    
    func preload() {
        _ = self.view
    }
}
