//
//  Bullet.swift
//  TheImpossibleGame
//
//  Created by Roger Hartman II on 12/24/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import UIKit
import SpriteKit

class Bullet: SKSpriteNode {
    
    var bulletEmitter: SKEmitterNode!
    let photonTorpedoCategory:UInt32 = 0x1 << 0
    
    init(emitterName: String, bulletSound: String?) {
        bulletEmitter = SKEmitterNode(fileNamed: emitterName)
        super.init(texture: bulletEmitter?.particleTexture, color: SKColor.clear, size: (bulletEmitter?.particleSize)!)
        if(bulletSound != nil){
            run(SKAction.playSoundFileNamed(bulletSound!, waitForCompletion: false))
        }
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = photonTorpedoCategory
        self.physicsBody?.contactTestBitMask = 0x1 << 1
        self.physicsBody?.collisionBitMask = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func fire() {
        bulletEmitter.targetNode = self
        self.addChild(bulletEmitter)
        bulletEmitter.position = CGPoint(x: 0, y: 0)
        self.physicsBody?.velocity = CGVector(dx: CGFloat(0), dy: CGFloat(1000))
    }
}
