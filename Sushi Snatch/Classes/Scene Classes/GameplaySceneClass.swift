//
//  GameplaySceneClass.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist on 2018-05-16.
//  Copyright © 2018 Melphi. All rights reserved.
//



//vi la precis till collisionbitmask på alla ställen,gjorde ingen skillnad
import SpriteKit

class GameplaySceneClass: SKScene, SKPhysicsContactDelegate {
    
    let eater = SKSpriteNode(imageNamed: "eater")
    var eaterHeight = CGFloat(-165)
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)
    var water = SKSpriteNode(color: SKColor.red, size: CGSize(width: 480, height: 10))

    
    private var itemController = ItemController()
    
    private var scoreLabel: SKLabelNode?
    private var score = 0
    
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
        if contact.bodyA.node?.name == "Sushi-piece" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            print("ja")
        }
        else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            print(firstBody.node?.name, secondBody.node?.name)
        }
        
        
        if firstBody.node?.name == "Sushi-piece" && secondBody.node?.name == "Eater" {
            score += 1
            scoreLabel?.text = String(score)
            firstBody.node?.removeFromParent()
        }
        
            //One sushi piece has reached the water
        if firstBody.node?.name == "Eater" && secondBody.node?.name == "water" {
            restartGame()
        }
        print("hje")
    }
    
    private func initializeGame() {
        
        physicsWorld.contactDelegate = self
        eater.name = "Eater"
        eater.position = CGPoint(x: 0, y: eaterHeight)
        eater.setScale(0.06)
        eater.zPosition = 3
        self.addChild(eater)
        initializeEater()
        initializeWater()
        scoreLabel = childNode(withName: "ScoreLabel") as? SKLabelNode!
        scoreLabel?.text = "0"
        
        Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
    }
    
    private func initializeEater() {
        eater.physicsBody = SKPhysicsBody(circleOfRadius: eater.size.height / 2)
        eater.physicsBody?.isDynamic = false
        eater.physicsBody?.categoryBitMask = ColliderType.EATER_AND_WATER
        eater.physicsBody?.contactTestBitMask = ColliderType.SUCHIPIECE
        eater.physicsBody?.collisionBitMask = ColliderType.SUCHIPIECE

    }
    
    private func initializeWater() {
        water.name = "water"

        water.physicsBody?.isDynamic = false
        water.physicsBody?.categoryBitMask = ColliderType.EATER_AND_WATER
        water.physicsBody?.contactTestBitMask = ColliderType.SUCHIPIECE
        water.physicsBody?.collisionBitMask = ColliderType.SUCHIPIECE
        water.position = CGPoint(x: 0, y: -400)
        water.zPosition = 7
        water.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        water.setScale(1)
        self.addChild(water)
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






















