//
//  ItemController.swift
//  Sushi Snatch
//
//  Created by Philip Song on 2018-05-19.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

struct ColliderType { // Similar to a class
    static let EATER: UInt32 = 0 // Can be accessed in the class without making an instance of it
    static let SUCHIPIECE: UInt32 = 1
    static let WATER: UInt32 = 2
}

class ItemController {
    
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)
    var difficultySpeed = Double(0)
    
    func spawnItems(scene: SKScene) -> SKSpriteNode {  // Return spriteNode ->
        let item: SKSpriteNode? // Optional "?"
        let randomNum = Int(randomBetweenNumbers(firstNum: 1, lastNum: 5))
        
        item = SKSpriteNode(imageNamed: "sushi-piece\(randomNum)")
        item!.name = "Suchi-piece"
        item!.setScale(0.7)
        item!.zPosition = 6
        item!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        item!.position.x = randomBetweenNumbers(firstNum: eaterMinX, lastNum: eaterMaxX)
        item!.position.y = scene.frame.size.height / 2 + 50
        
        item!.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height/2)
        item!.physicsBody?.categoryBitMask = ColliderType.SUCHIPIECE
        
        let initialRotation = SKAction.rotate(byAngle: CGFloat(Double.pi*Double(2/5*randomNum)), duration: 0.5)
        let rotate = SKAction.rotate(byAngle: 3, duration: 1)
        let fall = SKAction.moveTo(y: -800, duration: 5-difficultySpeed)
        item!.run(initialRotation)
        item!.run(SKAction.repeatForever(rotate))
        item!.run(SKAction.repeatForever(fall))
        
        difficultySpeed += 0.08
        return item!
    }
    
    func randomBetweenNumbers(firstNum: CGFloat, lastNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - lastNum) + min(firstNum, lastNum)
    }
    
} // class



































