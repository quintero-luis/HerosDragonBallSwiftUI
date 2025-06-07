//
//  XCTestPrueba.swift
//  HerosSwiftUITests
//
//  Created by Luis Quintero on 05/06/25.
//

import XCTest
@testable import HerosSwiftUI

final class XCTestPrueba: XCTestCase {

    // testeamos un modelo con XCTest
    
    func testModels() throws {
        let bootcamp1 = BootcampModel(id: "01", name: "Bootcamp 1")
        XCTAssertNotNil(bootcamp1)
        XCTAssertEqual(bootcamp1.id, "01")
    }

}
