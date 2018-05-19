//
//  GameplaySceneClass.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist on 2018-05-16.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

class GameplaySceneClass: SKScene {
    
    let eater = SKSpriteNode(imageNamed: "eater")
    var eaterHeight = CGFloat(-165)
    var eaterMinX = CGFloat(-200)
    var eaterMaxX = CGFloat(200)
    
    override func didMove(to view: SKView) {
        initializeGame()
    }
    
    private func initializeGame() {
        eater.position = CGPoint(x: 0, y: eaterHeight)
        eater.setScale(0.06)
        self.addChild(eater)
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
    
} // class






















