//
//  GameOverSceneClass.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist on 2018-05-20.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

class GameOverSceneClass: SKScene {
    
    private var scoreLabel: SKLabelNode?
    private var restartLabel: SKLabelNode?
    private var mainMenuLabel: SKLabelNode?
    
    
    override func didMove(to view: SKView) {
        scoreLabel = (childNode(withName: "ScoreLabel") as? SKLabelNode?)!
        scoreLabel?.text = "Highscore: X"
        scoreLabel?.isHidden = false
        restartLabel = (childNode(withName: "RestartLabel") as? SKLabelNode?)!
        mainMenuLabel = (childNode(withName: "MainMenuLabel") as? SKLabelNode?)!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "RestartLabel" {
                if let scene = GameplaySceneClass(fileNamed: "GameplayScene") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                }
            } else if atPoint(location).name == "MainMenuLabel" {
                if let scene = MainMenuScene(fileNamed: "MainMenu") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
