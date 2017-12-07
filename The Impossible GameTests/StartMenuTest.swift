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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
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
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        startMenuUnderTest.didMove(to: testView)
        
        //let tempNodeClass = SKSpriteNode()
        let startGameButton = startMenuUnderTest.childNode(withName: "startGameButton")

        
        XCTAssertTrue(((startGameButton as? SKSpriteNode) != nil))
    }
    
}
