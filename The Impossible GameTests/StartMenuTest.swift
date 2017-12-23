//
//  StartMenuTest.swift
//  The Impossible GameTests
//
//  Created by Roger Hartman II on 12/6/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import XCTest
import SpriteKit
import GameplayKit
@testable import TheImpossibleGame

class StartMenuTest: XCTestCase {
    
    var startMenuUnderTest: SKScene!
    var testView: SKView!
    var startGameButton: SKSpriteNode!
    
    override func setUp() {
        super.setUp()
        //This creates a view that will hold our scene
        
        testView = SKView()
        
        //This creates our scene to test
        let tempScene = SKScene(fileNamed: "StartMenuScene")
        startMenuUnderTest = tempScene
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreatesGameButton() {
        // This ensures that the startGameButton appears on opening the app
        
        startMenuUnderTest.didMove(to: testView)
        let startGameButton = startMenuUnderTest.childNode(withName: "startGameButton")
        XCTAssertTrue(((startGameButton as? SKSpriteNode) != nil))
    }
    
    func testGameButtonSwitchesView() {
        // This test ensures the screen switches when the start button is pressed
        
    }
}
