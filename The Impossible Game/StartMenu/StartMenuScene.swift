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
        let startButtonSize = startButtonNode.size
        
        startButtonNode.position = CGPoint(x: self.frame.size.width/2, y: (5.5/8)*self.frame.size.height - startButtonSize.height/2)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchLoc = touches.first?.location(in: self) {
            let nodesArray = self.nodes(at: touchLoc)
            
            if nodesArray.first?.name == "startGameButton" {
                let tempGameScene = GameScene(fileNamed: "GameScene")
                let gameScene: GameScene! = tempGameScene
                gameScene.size = size
                gameScene.scaleMode = scaleMode
                let transitionType = SKTransition.flipHorizontal(withDuration: 1.0)
                view?.presentScene(gameScene,transition: transitionType)
            }
        }
    }
}
