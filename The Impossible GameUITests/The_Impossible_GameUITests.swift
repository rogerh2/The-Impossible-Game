//
//  The_Impossible_GameUITests.swift
//  The Impossible GameUITests
//
//  Created by Roger Hartman II on 12/2/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import XCTest
import SpriteKit
import GameplayKit

class The_Impossible_GameUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartGameButtonWorks() {
        //Bored, MJ opens the app and touches the start game button
        let startGameButton = app.otherElements["startGameButton"]
        XCTAssert(startGameButton.exists)
    }
    
}
