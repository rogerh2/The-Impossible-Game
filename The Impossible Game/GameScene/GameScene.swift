//
//  GameScene.swift
//  The Impossible Game
//
//  Created by Roger Hartman II on 12/02/17.
//  Copyright © 2017 Roger. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var player1: HumanPlayer!
    private var touchArray: [UITouch]! = []
    private var bulletTime: TimeInterval = 0
    private var enemyTime: TimeInterval = 0
    private var enemyNumber: Int = 0
    let alienCategory:UInt32 = 0x1 << 1
    let photonTorpedoCategory:UInt32 = 0x1 << 0
    //var gameTimer:Timer!
    
    override func didMove(to view: SKView) {
        
        if let somePlayer: HumanPlayer = self.childNode(withName: "player1") as? HumanPlayer {
            //make the declared variable equal to somePlayer
            player1 = somePlayer
            player1.texture = SKTexture(imageNamed: "smallfighter0006")
            player1.size = (player1.texture?.size())!
            player1.color = SKColor.clear
            player1.position = CGPoint(x: self.frame.size.width/2 - 2*player1.size.width, y: self.frame.size.height/2)
            player1.startExhaust()
        }
        
        self.physicsWorld.contactDelegate = self
        
        //gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(createStandardEnemy), userInfo: nil, repeats: true)
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if let node = firstBody.node as? Bullet {
            if firstBody.categoryBitMask != secondBody.categoryBitMask && (secondBody.node?.position.y)! < self.size.height {
                let alienBody = secondBody.node as? Asteroid
                alienBody?.death(node)
                enemyNumber -= 1
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if touchArray.count == 0 {
            touchArray.append(touches.first!)
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        if touchArray.count == 1 {
            touchArray.removeAll()
            player1.removeAction(forKey: "motion")
            player1.movePlayer(0)
        }
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let touchLocation = touchArray.first?.location(in: self) {
            let touchXLocation = touchLocation.x
            let absDistance = abs(player1.position.x - touchXLocation)
            if absDistance >= player1.size.width/4 {
                movePlayer(touchXLocation)
            }
            else {
                player1.movePlayer(0)
            }
            
            if currentTime - bulletTime > 0.25 {
                bulletTime = currentTime
                fireStandardBullet(player: 1)
            }
        }
        
        if currentTime - enemyTime > 1 && enemyNumber <= 2 {
            createAsteroid()
            enemyTime = currentTime
        }
    }
    
    func movePlayer(_ touchXLocation: CGFloat){
        let distanceToTravel = player1.position.x - touchXLocation
        let absDistanceToTravel = abs(distanceToTravel)
        // let isMoving: Bool = player1.action(forKey: "motion") == nil
        if absDistanceToTravel > player1.size.width/8 {
            player1.movePlayer(distanceToTravel)
        }
        
    }
    
    func fireStandardBullet(player: Int){
        
        switch player { //This is a switch case looking forward to adding more fighters (other players/obstacles)
        case 1:
            let bullet = Bullet(emitterName: "bulletStandard.sks", bulletSound: nil)
            bullet.position = CGPoint(x: player1.position.x, y: player1.position.y + player1.size.height/2)
            self.addChild(bullet)
            bullet.fire()
        default:
            let bullet = Bullet(emitterName: "bulletStandard.sks", bulletSound: nil)
            self.addChild(bullet)
            bullet.position = CGPoint(x: player1.position.x, y: player1.position.y + player1.size.height/2)
            bullet.fire()
        }
    }
    
    func createAsteroid() {
        //let fileManager = FileManager.default
        //let bundleUrl = Bundle.main.bundleURL
        //let textureUrl = bundleUrl.appendingPathComponent("Assets.xcassets/Asteroids/Large")
        //let contents = try! fileManager.contentsOfDirectory(atPath: textureUrl.absoluteString)
        var textureArray: [SKTexture] = []
        let contents: [String] = ["a10000", "a30000", "b10000", "b30000", "c10000", "c30000", "c40000"]
        
        for item in contents
        {
            textureArray.append(SKTexture(imageNamed: item))
        }
        
        let textureInd = Int(arc4random_uniform(UInt32(textureArray.count)))
        
        let texture = textureArray[textureInd]
        let enemy = Asteroid(texture: texture, emitterName: "thrustExhaustMaintain", id: "\(enemyNumber)")
        self.addChild(enemy)
        let eWidth = enemy.size.width
        let screenDivisions = Int(round(Float(self.size.width/eWidth)))
        let randNum = Float(arc4random_uniform(UInt32(screenDivisions-1)))/Float(UInt32(screenDivisions))
        let randCenter =  self.size.width*CGFloat(randNum)
        enemy.position = CGPoint(x: abs(randCenter + eWidth), y: CGFloat(self.size.height + enemy.size.height))
        let addEnemyAction = SKAction.moveTo(y: CGFloat(self.size.height - 1.2*enemy.size.height), duration: 2.5)
        enemyNumber += 1
        enemy.run(addEnemyAction)
    }
}
