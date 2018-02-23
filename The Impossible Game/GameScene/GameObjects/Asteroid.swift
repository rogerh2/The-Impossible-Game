//
//  EnemySaucer.swift
//  TheImpossibleGame
//
//  Created by Roger Hartman II on 12/27/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import GameplayKit
import SpriteKit
import UIKit

class Asteroid: SKSpriteNode {
    
    var exhaust: SKEmitterNode!
    var deathExhaust: SKEmitterNode!
    var maxSpeed: CGFloat! = -500
    var exhaustAcceleration: CGFloat = 150
    let enemyCategory:UInt32 = 0x1 << 1
    var explosion: SKEmitterNode!
    var uniqueKey: String!
    
    init(texture: SKTexture, emitterName: String, id: String) {
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = enemyCategory
        self.physicsBody?.contactTestBitMask = 0x1 << 0
        self.physicsBody?.collisionBitMask = 0
        
        uniqueKey = id
        
        exhaust = SKEmitterNode(fileNamed: "thrustExhaustMaintain.sks")
        exhaust.targetNode = self
        exhaust.position = CGPoint(x: 0, y: -self.size.height/2 - 0.05*self.size.height)
        exhaust.emissionAngle = CGFloat((27/18)*Float.pi)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func death(_ bullet: Bullet) {
        self.explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = self.position
        self.scene?.addChild(explosion)
        self.texture = nil
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        bullet.removeFromParent()
        
        let removeExplosion = SKAction.customAction(withDuration: TimeInterval(3)) { (node, elapsedTime) in
            if let asteroidNode = node as? Asteroid {
                if elapsedTime > 0.1 {
                    asteroidNode.explosion.removeFromParent()
                    asteroidNode.removeFromParent()
                }
            }
        }
        
        self.run(removeExplosion, withKey: uniqueKey)
    }

}
