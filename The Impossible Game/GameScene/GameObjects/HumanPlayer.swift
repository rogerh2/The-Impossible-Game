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
    
    var exhaustMaintain: SKEmitterNode!
    
    //init(imageName: String) {
    //    let texture = SKTexture(imageNamed: imageName)
    //    super.init(texture: texture, color: SKColor.clear, size: texture.size())
    // }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func animate(){
    }
    
    
    func die (){
        
    }
    
    func kill(){
        
    }
    
    func respawn(){
        
    }
    
    func fireBullet(scene: SKScene){
        
    }
    
}
