//
//  settingsUnitTests.swift
//  unitTests
//
//  Created by Storm on 18/04/17.
//  Copyright © 2017 DEVELMS. All rights reserved.
//

import XCTest
@testable import unitTests

class settingsUnitTests: XCTestCase {
    
    var viewController: SettingsController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsController") as! SettingsController
        
        viewController.preload()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetCoinFromListDoingWell() {
        
        XCTAssertNotNil(viewController.getCoinFromList(tag: 1), "O valor enviado é válido e coin é retornada corretamente.")
        XCTAssertNotNil(viewController.getCoinFromList(tag: 2), "O valor enviado é válido e coin é retornada corretamente.")
        XCTAssertNotNil(viewController.getCoinFromList(tag: 3), "O valor enviado é válido e coin é retornada corretamente.")
        XCTAssertNotNil(viewController.getCoinFromList(tag: 4), "O valor enviado é válido e coin é retornada corretamente.")
    }
    
    func testGetCoinFromListFailing() {
        
        XCTAssertNil(viewController.getCoinFromList(tag: 0), "O valor enviado é inválido, deve ser enviado uma tag entre 1 e 4.")
        XCTAssertNil(viewController.getCoinFromList(tag: 5), "O valor enviado é inválido, deve ser enviado uma tag entre 1 e 4.")
    }
    
    func testPerformanceSettingsMethods() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
        }
    }
    
}

extension SettingsController {
    
    func preload() {
        _ = self.view
    }
}
