//
//  StartMenuScene.swift
//  The Impossible Game
//
//  Created by Roger Hartman II on 12/6/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import SpriteKit
import GameplayKit

class StartMenuScene: SKScene {
    
    var startButtonNode: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        
        startButtonNode = self.childNode(withName: "startGameButton") as! SKSpriteNode
        
    }

}
