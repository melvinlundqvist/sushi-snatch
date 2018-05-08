//
//  ViewController.swift
//  Sushi_Snatch
//
//  Created by Philip Song on 2018-05-07.
//  Copyright © 2018 Developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     connecting picture
     **/
    @IBOutlet weak var bakgrund: UIImageView!
    @IBOutlet weak var sushiTextlbl: UILabel! //ishidden
    @IBOutlet weak var bakgrundStartScreen: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var snatch: UILabel!
    @IBOutlet weak var eater: UIImageView!
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

