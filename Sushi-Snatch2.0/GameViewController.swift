//
//  GameViewController.swift
//  Sushi-Snatch2.0
//
//  Created by Philip Song on 2018-05-08.
//  Copyright © 2018 Developers. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    /*
     connecting graphics with code
     **/
    @IBOutlet weak var bakgrund: UIImageView!
    @IBOutlet weak var snatch: UILabel!
    @IBOutlet weak var sushiTextlbl: UILabel!
    @IBOutlet weak var bakgrundStartScreen: UIImageView!
    @IBOutlet weak var eater: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var sushiBit1: UIImageView!
    
    
    
    
    /*
     takes action when "Play- button is pressed. Hides all the startscreen animations.
     **/
    @IBAction func playButtonIsPressed(_ sender: Any) {
        bakgrundStartScreen.isHidden = true
        snatch.isHidden = true
        playButton.isHidden = true
        sushiTextlbl.isHidden = true
        eater.isHidden = false
        sushiBit1.isHidden = false
        
        
        UIView.animate(withDuration: 6, animations: {
            self.sushiBit1.frame.origin.y += 700
        }, completion: nil)
        
    }
    

    var location = CGPoint(x: 0, y: 0)
    var eaterHeight = 466
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch! = touches.first
        location = touch.location(in: self.view)
        eater.center = CGPoint(x: location.x, y: CGFloat(eaterHeight))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch! = touches.first
        location = touch.location(in: self.view)
        eater.center = CGPoint(x: location.x, y: CGFloat(eaterHeight))
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
           eater.center = CGPoint(x: self.view.bounds.midX, y: CGFloat(eaterHeight)) //ätarens startposition
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
