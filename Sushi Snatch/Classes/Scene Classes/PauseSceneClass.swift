//
//  PauseSceneClass.swift
//  Sushi Snatch
//
//  Created by Philip Song on 2018-05-20.
//  Copyright © 2018 Melphi. All rights reserved.
//

import SpriteKit

class PauseSceneClass: SKScene {
    //private var scoreLabel: SKLabelNode?
    private var continueLabel: SKLabelNode?
    private var mainMenuLabel: SKLabelNode?
    private var currentScene: SKScene?
  //  private var score = 0
    
    override func didMove(to view: SKView) {
        //scoreLabel = (childNode(withName: "ScoreLabel") as? SKLabelNode?)!
       // scoreLabel?.text = "Final score: " + String(score)
        //scoreLabel?.isHidden = false
        continueLabel = (childNode(withName: "ContinueLabel") as? SKLabelNode?)!
        mainMenuLabel = (childNode(withName: "MainMenuLabel") as? SKLabelNode?)!
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if atPoint(location).name == "ContinueLabel" {
                currentScene?.isPaused = false
                view!.presentScene(currentScene!, transition: SKTransition.crossFade(withDuration: 1))
                
            } else if atPoint(location).name == "MainMenuLabel" {
                if let scene = MainMenuScene(fileNamed: "MainMenu") {
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition: SKTransition.crossFade(withDuration: 1))
                }
            }
        }
        
    }
    
    func setScene(tempScene: SKScene) {
        currentScene = tempScene
    }
    
}
