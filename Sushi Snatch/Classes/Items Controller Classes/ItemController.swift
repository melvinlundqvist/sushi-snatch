//
//  ItemController.swift
//  Sushi Snatch
//
//  Created by Philip Song on 2018-05-19.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

struct ColliderType { //like a class - struct
    static let EATER_AND_WATER: UInt32 = 0 //can accessed in the class without instancint it
    static let SUCHIPIECE: UInt32 = 1
}

class ItemController {
    
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)
    var difficultySpeed = Double(0)
    
    func spawnItems(scene: SKScene) -> SKSpriteNode {  //return spriteNode ->
        let item: SKSpriteNode? //optional "?"
        let randomNum = Int(randomBetweenNumbers(firstNum: 1, lastNum: 5))
        
        item = SKSpriteNode(imageNamed: "sushi-piece\(randomNum)")
        item!.name = "Suchi-piece"
        item!.setScale(0.7)
        item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        item!.physicsBody?.categoryBitMask = ColliderType.SUCHIPIECE
        item!.physicsBody?.collisionBitMask = ColliderType.EATER_AND_WATER
        item!.physicsBody?.contactTestBitMask = ColliderType.EATER_AND_WATER
        item!.zPosition = 5
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        item!.position.x = randomBetweenNumbers(firstNum: eaterMinX, lastNum: eaterMaxX)
        item!.position.y = scene.frame.size.height / 2 + 50
        let fall = SKAction.moveTo(y: -800, duration: 5-difficultySpeed)
        item!.run(SKAction.repeatForever(fall))
        
        difficultySpeed += 0.08
        return item!
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, lastNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - lastNum) + min(firstNum, lastNum)
    }
    
} // class



































