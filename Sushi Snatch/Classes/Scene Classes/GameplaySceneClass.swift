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
    var water = SKSpriteNode(color: SKColor.clear, size: CGSize(width: 480, height: 10))
    private var pauseButton = SKSpriteNode(imageNamed: "pause")
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
        if contact.bodyA.node?.name == "Sushi-piece" { // Make sure that firstBody will be the sushi piece
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if firstBody.categoryBitMask == ColliderType.SUCHIPIECE && secondBody.categoryBitMask == ColliderType.EATER {
            score += 1
            scoreLabel?.text = String(score)
            firstBody.node?.removeFromParent()
        }
        
        if firstBody.categoryBitMask == ColliderType.SUCHIPIECE && secondBody.categoryBitMask == ColliderType.WATER {
            restartGame() // One sushi piece has reached the bottom
        }
    }
    
    private func initializeGame() {
        
        physicsWorld.contactDelegate = self
        
        initializeEater()
        initializeWater()
        initializePauseButton()
        scoreLabel = (childNode(withName: "ScoreLabel") as? SKLabelNode?)!
        scoreLabel?.text = "0"
        
        Timer.scheduledTimer(timeInterval: TimeInterval(0.8), target: self, selector: #selector(GameplaySceneClass.spawnItems), userInfo: nil, repeats: true)
    }
    
    private func initializeEater() {
        eater.name = "Eater"
        eater.position = CGPoint(x: 0, y: eaterHeight)
        eater.setScale(0.06)
        eater.zPosition = 3
        eater.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 1))
        eater.physicsBody?.affectedByGravity = false
        eater.physicsBody?.isDynamic = false
        eater.physicsBody?.categoryBitMask = ColliderType.EATER
        eater.physicsBody?.contactTestBitMask = ColliderType.SUCHIPIECE
        self.addChild(eater)
    }
    
    private func initializeWater() {
        water.name = "Water"
        water.position = CGPoint(x: 0, y: -400)
        water.zPosition = 5
        water.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 480, height: 10))
        water.physicsBody?.affectedByGravity = false
        water.physicsBody?.isDynamic = false
        water.physicsBody?.categoryBitMask = ColliderType.WATER
        water.physicsBody?.contactTestBitMask = ColliderType.SUCHIPIECE
        self.addChild(water)
    }
    
    private func initializePauseButton() {
        pauseButton.name = "PauseButton"
        pauseButton.setScale(0.1)
        pauseButton.zPosition = 5
        pauseButton.position = CGPoint(x: self.frame.size.width/2-50, y: self.frame.size.height/2-35)
        addChild(pauseButton)
    }
    
    @objc func spawnItems() {
        self.scene?.addChild(itemController.spawnItems(scene: self.scene!))
    }
    
    func restartGame() {
        if let scene = GameOverSceneClass(fileNamed: "GameOverScene") {
            scene.scaleMode = .aspectFill
            view?.presentScene(scene, transition: SKTransition.doorsCloseHorizontal(withDuration: TimeInterval(1)))
        }
    }
    
} // class






















