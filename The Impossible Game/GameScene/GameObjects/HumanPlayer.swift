//
//  humanPLayer.swift
//  TheImpossibleGame
//
//  Created by Roger Hartman II on 12/22/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import GameplayKit
import SpriteKit
import UIKit

class HumanPlayer: SKSpriteNode {
    
    var exhaust: SKEmitterNode!
    var scrollSpeed: CGFloat! = -1500
    var exhaustAcceleration: CGFloat = 150
    
    //init(imageName: String) {
    //    let texture = SKTexture(imageNamed: imageName)
    //    super.init(texture: texture, color: SKColor.clear, size: texture.size())
    // }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startExhaust(){
        exhaust = SKEmitterNode(fileNamed: "thrustExhaustMaintain.sks")
        exhaust.targetNode = self
        exhaust.position = CGPoint(x: 0, y: -self.size.height/2 - 0.05*self.size.height)
        exhaust.emissionAngle = CGFloat((27/18)*Float.pi)
        
        self.addChild(exhaust)
        self.physicsBody = SKPhysicsBody()
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
    }
    
    func movePlayer(_ xLocation: CGFloat ) {
        //image 0011 and 250 for roll right, 0001 and 290 for left, and 0006 and 270 for straight
        //self.texture = SKTexture(imageNamed: imageName)
        //xLocation is relative to self
        
        if xLocation != 0 {
            let positionSign = xLocation/(abs(xLocation))
            exhaust.xAcceleration = CGFloat(positionSign*exhaustAcceleration)
            self.physicsBody?.velocity.dx = positionSign*self.scrollSpeed
        }
        else {
            exhaust.xAcceleration = CGFloat(0)
            self.physicsBody?.velocity.dx = 0
        }
    }
    
    func die (){
        
    }
    
    func kill(){
        
    }
    
    func respawn(){
        
    }
    
}
