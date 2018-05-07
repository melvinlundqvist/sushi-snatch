//
//  GameViewController.swift
//  Sushi Snatch
//
//  Created by Melvin Lundqvist & Philip Song on 2018-04-28.
//  Copyright © 2018 Melvin Lundqvist & Philip Song. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    //koppla ihop användarinterface med koden
    
    @IBOutlet weak var bakgrund: UIImageView!
    @IBOutlet weak var sushiTextlbl: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    @IBAction func playButtonPressed(_ sender: Any) {
        playButton.isHidden = true
        sushiTextlbl.isHidden = true
        ätare.isHidden = false
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
