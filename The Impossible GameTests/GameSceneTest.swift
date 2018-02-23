//
//  GameSceneTests.swift
//  TheImpossibleGame
//
//  Created by Roger Hartman II on 12/22/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import XCTest
import SpriteKit
import GameplayKit
@testable import TheImpossibleGame

class GameSceneTest: XCTestCase {
    
    var gameSceneUnderTest: SKScene!
    var testView: SKView!
    var player: SKSpriteNode!
    
    override func setUp() {
        super.setUp()
        //This creates a view that will hold our scene
        
        testView = SKView()
        
        //This creates our scene to test
        let tempScene = SKScene(fileNamed: "GameScene")
        gameSceneUnderTest = tempScene
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPlayerExists() {
        // This ensures that the player appears on opening the app
        gameSceneUnderTest.didMove(to: testView)
        let player = gameSceneUnderTest.childNode(withName: "player1")
        XCTAssertTrue(((player as? HumanPlayer) != nil))
    }
    
    func testPlayerEmitsExhuast() {
        // This ensures that the player appears on opening the app
        gameSceneUnderTest.didMove(to: testView)
        let player = gameSceneUnderTest.childNode(withName: "player1") as! HumanPlayer
        let tempExhaust = player.exhaust
        XCTAssertTrue(((tempExhaust as? SKEmitterNode) != nil))
    }
}
