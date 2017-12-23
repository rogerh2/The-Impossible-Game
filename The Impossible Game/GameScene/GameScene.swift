//
//  GameScene.swift
//  The Impossible Game
//
//  Created by Roger Hartman II on 12/2/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var player1: HumanPlayer!
    
    override func didMove(to view: SKView) {
        
        
        if let somePlayer: HumanPlayer = self.childNode(withName: "player1") as? HumanPlayer {
            //make the declared variable equal to somePlayer
            player1 = somePlayer
            player1.texture = SKTexture(imageNamed: "smallfighter0006")
            player1.size = (player1.texture?.size())!
            player1.color = SKColor.clear
            player1.position = CGPoint(x: self.frame.size.width/2 - 2*player1.size.width, y: self.frame.size.height/2)
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
