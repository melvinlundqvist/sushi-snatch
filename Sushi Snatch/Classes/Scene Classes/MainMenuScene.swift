//
//  MainMenuScene.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist on 2018-05-16.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    private var pow = SKSpriteNode(imageNamed: "pow1")
    
    override func didMove(to view: SKView) {
        pow.name = "pow1"
        pow.setScale(0.2)
        pow.zPosition = 5
        pow.position = CGPoint(x: 0, y: 100)
        addChild(pow)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "Play" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                }
            }
        }
        
    }
    
    
} // class


































