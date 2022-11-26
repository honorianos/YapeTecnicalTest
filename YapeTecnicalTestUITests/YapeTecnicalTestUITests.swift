//
//  YapeTecnicalTestUITests.swift
//  YapeTecnicalTestUITests
//
//  Created by Oswaldo Escobar on 24/11/22.
//

import XCTest

class YapeTecnicalTestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testFlowFilter() {
        let app = XCUIApplication()
        app.launch()
        let searchSearchField = app.tables.searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.tap()
        let bKey = app.keys["B"]
        bKey.tap()
        let rKey = app.keys["r"]
        rKey.tap()
        let eKey = app.keys["e"]
        eKey.tap()
        let aKey = app.keys["a"]
        aKey.tap()
        let kKey = app.keys["k"]
        kKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    func testFlowDetail() {
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Breakfast Burrito"]/*[[".cells.staticTexts[\"Breakfast Burrito\"]",".staticTexts[\"Breakfast Burrito\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Detalle Breakfast Burrito"].buttons["Recetas"].tap()
    }
    func testFlowDetailCompleteMap() {
        let app = XCUIApplication()
        app.launch()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Breakfast Burrito"]/*[[".cells.staticTexts[\"Breakfast Burrito\"]",".staticTexts[\"Breakfast Burrito\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Origen"].tap()
        app.navigationBars["Origen Breakfast Burrito"].buttons["Detalle Breakfast Burrito"].tap()
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
