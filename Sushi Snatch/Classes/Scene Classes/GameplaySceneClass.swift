//
//  GameplaySceneClass.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist on 2018-05-16.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

class GameplaySceneClass: SKScene, SKPhysicsContactDelegate {
    
    let eater = SKSpriteNode(imageNamed: "eater")
    var eaterHeight = CGFloat(-165)
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)
    
    private var itemController = ItemController()
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            var xPos = location.x
            if location.x < eaterMinX {
                xPos = eaterMinX
            }
            if location.x > eaterMaxX {
                xPos = eaterMaxX
            }
            eater.position = CGPoint(x: xPos, y: eaterHeight)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            var xPos = location.x
            if location.x < eaterMinX {
                xPos = eaterMinX
            }
            if location.x > eaterMaxX {
                xPos = eaterMaxX
            }
            eater.position = CGPoint(x: xPos, y: eaterHeight)
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        if contact.bodyA.node?.name == "eater" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.node?.name == "eater" && secondBody.node?.name == "Sushi-piece" {
            
        }
        
        
    }
    
    private func initializeGame() {
        
        physicsWorld.contactDelegate = self
        
        eater.position = CGPoint(x: 0, y: eaterHeight)
        eater.setScale(0.06)
        eater.zPosition = 3
        self.addChild(eater)
        initializeEater()
        
        Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
    }
    
    private func initializeEater() {
        eater.physicsBody = SKPhysicsBody(circleOfRadius: eater.size.height / 2)
        eater.physicsBody?.isDynamic = false
        eater.physicsBody?.categoryBitMask = ColliderType.EATER
        eater.physicsBody?.contactTestBitMask = ColliderType.SUCHIPIECE
        
    }
    
    @objc func spawnItems() {
        self.scene?.addChild(itemController.spawnItems(scene: self.scene!))
    }
    
    func restartGame() {
        if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
        }
    }
    
} // class






















