//
//  ItemController.swift
//  Sushi Snatch
//
//  Created by Philip Song on 2018-05-19.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

struct ColliderType { //like a class - struct
    static let EATER: UInt32 = 0 //can accessed in the class without instancint it
    static let SUCHIPIECE: UInt32 = 1
}

class ItemController {
    
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)

    
    func spawnItems(scene: SKScene) -> SKSpriteNode {  //return spriteNode ->
        let item: SKSpriteNode? //optional "?"
        
        
        
        let randomNum = Int(randomBetweenNumbers(firstNum: 1, lastNum: 5))
        
        item = SKSpriteNode(imageNamed: "sushi-piece\(randomNum)")
        item!.name = "Suchi-piece"
        item!.setScale(0.7)
        item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        item!.physicsBody?.categoryBitMask = ColliderType.SUCHIPIECE
        item!.zPosition = 3
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        item!.position.x = randomBetweenNumbers(firstNum: eaterMinX, lastNum: eaterMaxX)
        item!.position.y = scene.frame.size.height / 2 - 50
        
        return item!
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, lastNum: CGFloat) -> CGFloat {
        
        
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - lastNum) + min(firstNum, lastNum)
    }
    
} // class



































